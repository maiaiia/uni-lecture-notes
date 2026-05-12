---
Class: "[[DBMS]]"
date:
type: Lecture
---
# Transactions
![[dbms-architecture]]
Transactions are sequences of operations performed as a single logical unit of work, ensuring that all operations are completed successfully or none are applied. They follow the **ACID** properties.

## ACID

>[!Definition] ACID
> Atomicity, Consistency, Isolation, Durability

| Notion      | Meaning                                                                                                                                       |
| ----------- | --------------------------------------------------------------------------------------------------------------------------------------------- |
| Atomicity   | Either all operations succeed, or none are applied. The transaction is treated as an invisible unit of execution                              |
| Consistency | The database must remain in a valid state before and after every transaction                                                                  |
| Isolation   | Transactions run independently without affecting each other. Changes made by a transaction are not visible to others until they are committed |
| Durability  | Once a transaction is committed, its changes are permanently saved, even if the system fails                                                  |
### Atomicity
A transaction can commit / abort:
- *commit* - after finalising all its operations
- *abort* - after executing some of its operations; the DBMS itself can abort a transaction

>[!Tip]
>The DBMS logs all the transaction's writes, so it can undo them if necessary

In the presence of system crashes, atomicity is guaranteed by **crash recovery**.

### Consistency
In the absence of other transactions, a transaction that executes on a consistent database state leaves the database in a consistent state.

Transactions do not violate the *integrity constraints* specified on the database and enforced by the DBMS. They are correct programs.

### Isolation 

Transactions are protected from the effects of concurrently scheduling other transactions. 

### Durability
The system must guarantee the effects of a successfully completed transaction won't be lost, even if failures subsequently occur. Thus, once the DBMS informs the user that a transaction has been successful, its effects should persist, even in the event of a system crash.

>[!Definition] The Write-Ahead Log Property
>Changes are written to the log (on the disk) before being reflected in the database

The log ensures atomicity and durability

## Scheduling Transactions

>[!Definition] Schedule
>A **schedule** is a list of operations (Read / Write / Commit / Abort) within a set of transactions, with the property that the order of the operations in each individual transaction is preserved.

Schedules can be either serial or non-serial.

| Type       | Description                                               |
| ---------- | --------------------------------------------------------- |
| Serial     | the actions of different transactions are not interleaved |
| Non-Serial | the actions of different transactions are interleaved     |
![[scheduling-transactions]]

