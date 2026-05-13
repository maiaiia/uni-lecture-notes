---
Class: "[[DBMS]]"
date:
type: Lecture
---
# Crash Recovery

## Recovery Manager
The Recovery Manager in a DBMS ensures two important ACID properties:
- atomicity: the effects of uncommitted transactions are undone
- durability: the effects of committed transactions survive system crashes

There are various causes for transaction failures:
- system failures (hardware, os bugs, db system bugs etc)
- action by the *Transaction Manager* (deadlock resolution, deadlock victim)
- self-abort (rollback, abort) %%Can be seen as a special case of action by the TM%%

Normal execution:
- reading database object O
	- bring O from the disk into a frame in the Buffer Pool[^1]
	- copy O's value into a program variable
- writing database object O
	- modify an in-memory copy of O (in the BP)
	- write the in-memory copy to disk

There are multiple approaches for writing objects:

| Approach | Description                                                                                                                                                                                              | Advantages                                                                                     | Drawbacks                                                                                                |
| -------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------- |
| steal    | $T$'s changes can be written to disk before it commits<br>if transaction $T_2$ needs a page, the BM chooses a frame $F$ as a replacement frame (while $T$ is in progress). $T_2$ steals a frame from $T$ |                                                                                                |                                                                                                          |
| no-steal | $T$'s changes cannot be written to disk before $T$ commits                                                                                                                                               | changes of aborted transactions don't have to be undone (since they never get written to disk) | all pages modified by active transactions may not fit in the BP                                          |
| force    | $T$'s changes are immediately forced to disk when it commits                                                                                                                                             | actions of committed transactions don't have to be redone                                      | excessive I/O                                                                                            |
| no-force | $T$'s changes are not forced to disk when it commits                                                                                                                                                     |                                                                                                | if a transaction commits, then the system crashes before the changes get written, they need to be redone |
>[!Tip]
>Most systems use either *steal* and *no-force*

[^1]: For a recap on how the buffer manager works, see: [[The Physical Structure of Databases#Buffer Manager]]

## Storage Media
Recap: volatile storage, non-volatile storage: [[Memory. Magnetic Disks]]

Stable storage: 
- information is never lost
- techniques that approximate stable storage (e.g. store information on multiple disks, in several locations)

## ARIES
>[!Definition] Algorithms for Recovery and Isolation Exploiting Semantics
>**ARIES** is a recovery algorithm that uses the *steal* and *no-force* approaches. It is based on the [[The Physical Structure of Databases#WAL]] (Write-Ahead Logging) protocol.
>

>[!Info] WAL
>- a change to an object is first recorded in a log record LR
>- LR must be written to stable storage *before* the change is written to disk

The system restart after a crash consists of *three phases*:

| Phase        | Actions                                                                                                                                           |
| ------------ | ------------------------------------------------------------------------------------------------------------------------------------------------- |
| **analysis** | determine:<br>- active transactions at the time of the crash<br>- *dirty pages*, i.e. pages in the BP whose changes have not been written to disk |
| **redo**     | reapply all changes (starting from a certain record in the log), i.e. bring the DB to the state it was in when the crash occurred                 |
| **undo**     | undo changes of uncommitted transactions                                                                                                          |
### WAL (Write-Ahead Logging): The Log
- keeps a history of actions executed by the DBMS
- it's a file of records
- it's stored in a *stable storage* (at least 2 copies of the log are kept on different disks, to ensure the durability of the log)
- records are added to the end of the log (queue-like structure?)

| Component                 | Meaning                                                                                                           |
| ------------------------- | ----------------------------------------------------------------------------------------------------------------- |
| log tail                  | - the most recent fragment of the log<br>- kept in main memory and periodically forced to stable storage          |
| log sequence number (LSN) | - unique id for every log record<br>- monotonically increasing                                                    |
| page LSN                  | every page P in the DB contains the *pageLSN*: the LSN of the most recent record in the log describing a change P |

The following are the log record's fields:

| Field   | Meaning                             |
| ------- | ----------------------------------- |
| prevLSN | linking a transaction's log records |
| transID | id of the corresponding transaction |
| type    |                                     |
A log record is written for each of the following actions:

| Action      | What actually happens                                                                                                                                                                 |
| ----------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| update page | - add an *update typ*e log record ULR to the log tail, with $LSN_{ULR}$<br>- $pageLSN(P)$ is set to $LSN_{ULR}$                                                                       |
| commit      | - add a *commit type* log record CoLR to the log<br>- force log tail to stable storage (including CoLR)<br>- complete subsequent actions (remove current tran from transaction table) |
| abort       | - add an *abort type* log record to the log<br>- initiate Undo for the transaction                                                                                                    |
| end         | - transaction $T$ commits / aborts - complete required actions<br>- add an *end type* log record to the log                                                                           |
| undo update | - i.e. when the change described in an update log record is undone<br>- write a *compensation log record* (CLR)                                                                       |
>[!Info]
>An *update log record* has the following additional fields
>- pageID (of the changed page)
>- length (length of the change, in bytes)
>- offset 
>- before-image (value before the change)
>- after-image (value after the change)
>  
>  It can be used to undo / redo the change

