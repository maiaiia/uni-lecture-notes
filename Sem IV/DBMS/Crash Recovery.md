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

