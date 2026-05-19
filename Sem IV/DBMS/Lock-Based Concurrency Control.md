---
Class: "[[DBMS]]"
date:
type: Lecture
---
# Lock-Based Concurrency Control

Lock-based concurrency control is a technique used to guarantee serializable, recoverable schedules.
## Recoverable schedules

>[!Definition] 
>A schedule is **recoverable** if each transaction $T$ in the schedule commits only after all transactions whose changes $T$ reads commit.

Example of an unrecoverable schedule:

| T1          | T2         |
| ----------- | ---------- |
| Read(X)     |            |
| X := X + 10 |            |
| Write(X)    |            |
|             | Read(X)    |
|             | X := X + 5 |
|             | Write(X)   |
|             | blabla     |
|             | commit     |
| abort       |            |
$T_2$ operates on a value of $X$ that shouldn't have been there (because $T_1$ aborts)

>[!Definition]
>A schedule in which each transaction $T$ only reads changes of committed transactions is said to **avoid cascading aborts**.

Note that avoiding cascading aborts leads to recoverable schedules.

## Locks

>[!Definition]
>Locks are a tool used by the *transaction manager* to control concurrent access to the data.

Locks prevent a transaction from accessing a data object while another transaction is accessing it.

### Types 
- **SLock** (shared / *read* lock): if a transaction holds an SLock on an object, it can read it, but cannot modify it
- **XLock** (exclusive / *write* lock): allows both reading and writing an object

There may be multiple transactions holding SLocks at any time. However, if at least one transaction holds an XLock on an object, others cannot be granted any type of locks on said object. (note how this is super similar to [[Read Write Lock]])

###  Lock Table. Transaction Table
>[!Definition]
>The **lock table** is a structure used by the *lock manager* to keep track of granted locks / lock requests.

Each entry in the lock table corresponds to one data object and has info on the following:
- number of transactions holding a lock on the data object
- lock type (SLock / XLock)
- pointer to a queue of lock requests

>[!Definition]
>The **transaction table** is a structure maintained by the **DBMS** that keeps track of the locks held by a transaction.

It contains one entry per transaction.

>[!Tip] Lock Upgrade
>An SLock granted to a transaction can be upgraded to an XLock

## Transaction Protocols

>[!Definition] 
>A **transaction protocol** is a set of rules enforced by the *transaction manager* and obeyed by all transactions.

Locks, in conjunction with protocols, allow interleaved executions.

### Strict 2PL: Strict Two-Phase Locking

>[!Summary]
> - before a transaction can read / write an object, it must acquire a lock on it
> - all the locks held by a transaction are released when it completes execution

![[Strict2PL]]
The Strict 2PL protocol allows [[Serializability#^da0122|serializable]] schedules only. These are specifically called *strict schedules*.

>[!Definition] Strict schedules
>If a transaction $T_i$ has written object $A$, then transaction $T_j$ may only read / write $A$ after $T_i$'s completion (via either a commit or an abort).


Strict schedules:
- avoid cascading aborts
- are [[#Recoverable schedules]]
- if a transaction is aborted, its operations can be undone

### 2PL: Two-Phase Locking

>[!Summary]
> - before a transaction can read / write an object, it must acquire a lock on it
> - once the transaction releases a lock, it *cannot request other locks*.

So 2PL consists of *2 phases*: a *growing* and a *shrinking* phase

![[2PL]]

In 2PL, any schedule that completes normally is serializable. 

## Deadlocks
Related: [[Deadlocks]]

>[!Definition]
>A **deadlock** is a cycle of transactions waiting for one another to release a locked resource.

Deadlocks prevent normal execution from continuing without external intervention.

There are 2 types of "philosophies" when it comes to deadlock management:
- prevention
- detection (allow deadlocks to occur and solve the issues as they arise)

### Prevention
- assign transactions timestamp-based priorities
- the lower the timestamp, the older the transaction
- the older the transaction, the higher its priority

2 deadlock prevention policies: **Wait-die** and **Wound-wait**

Assume $T_1$ wants to access an object locked by $T_2$ (with a conflicting lock)

| Scenario \ Policy          | Wait-die         | Wound-wait       |
| -------------------------- | ---------------- | ---------------- |
| $T_1$'s priority is higher | $T_1$ can wait.  | $T_2$ is aborted |
| Otherwise                  | $T_1$ is aborted | $T_1$ can wait   |
>[!Important]
> If an aborted transaction is restarted, it is assigned its original timestamp
### Detection

####  waits-for graph
- this is a structure maintained by the *lock manager* to detect deadlock cycles
	- a node per active transaction
	- an arc from $T_i$ to $T_j$ if $T_i$ is waiting for $T_j$ to release a lock
- cycles in the graph represent deadlocks
- the DBMS periodically checks whether there are cycles in the waits-for graph

Victim-choosing criteria
- number of objects modified by the transaction
- number of objects that are to be modified by the transaction
- the number of locks held

Of course, the policy should be "fair" and eventually prioritise transactions that have been repeatedly chosen as victims.

#### timeout mechanism
- if a transaction $T$ has been waiting for too long for a lock on an object, a deadlock is assumed to exist and $T$ is terminated

## Concurrency Anomalies
### Isolation Levels
| Level            | Description                                                                                                                                                                                                                                     | Locks Acquisition                                                                                                                                | Releasing Locks                                                                  | Anomalies that may occur                           |
| ---------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------ | -------------------------------------------------------------------------------- | -------------------------------------------------- |
| READ UNCOMMITTED | a transaction $T$ can read uncommitted data                                                                                                                                                                                                     | no SLocks when reading data                                                                                                                      | -                                                                                | dirty reads<br>unrepeatable reads<br>phantom reads |
| READ COMMITTED   | a transaction $T$ can only read committed data.<br><br>an object read by $T$ can still be changed by another transaction while $T$ is in progress                                                                                               | XLock acquired before writing<br><br>SLock acquired before reading<br>                                                                           | XLocks released at the end of the transaction<br><br>SLocks immediately released | unrepeatable reads<br>phantom reads                |
| REPEATABLE READ  | $T$ can only read committed data<br><br>no object read by $T$ can be changed by another transaction while $T$ is in progress                                                                                                                    | XLock acquired before writing<br><br>SLock acquired before reading                                                                               | all locks are held until the end of the transaction                              | phantom reads                                      |
| SERIALIZABLE     | $T$ can only read committed data<br>no object read by $T$ can be changed by another transaction<br><br>if $T$ reads a set of objects based on a search predicate, this set cannot be changed by other transactions while $T$ is in progress<br> | XLock acquired before writing<br><br>SLock acquired before reading<br><br>Locks are also acquired on sets of objects that must remain unmodified | locks are held until the end of the transaction                                  | -                                                  |
