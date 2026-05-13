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

>[!Definition] 
>A **transaction protocol** is a set of rules enforced by the *transaction manager* and obeyed by all transactions.

Locks, in conjunction with protocols, allow interleaved executions.

### Types 
- **SLock** (shared / *read* lock): if a transaction holds an SLock on an object, it can read it, but cannot modify it
- **XLock** (exclusive / *write* lock): allows both reading and writing an object

There may

(note how this is super sim)