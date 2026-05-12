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

Note that the only operations relevant to a schedule are those that involve some sort of direct interaction with the database / the disk.

>[!Definition] Transaction Scheduling
>**Scheduling** is the process of determining the order in which transactions are executed. When multiple transactions run concurrently, scheduling ensures that operations are executed in a way that prevents conflicts or overlaps between them
### Schedule types
Schedules can be either serial or non-serial.

| Type       | Description                                               |
| ---------- | --------------------------------------------------------- |
| Serial     | the actions of different transactions are not interleaved |
| Non-Serial | the actions of different transactions are interleaved     |
The following is a non-serial (interleaved) schedule:

| T1             | T2          | Schedule   |
| -------------- | ----------- | ---------- |
| read(V)        |             | read(V)    |
| read(sum)      |             | read(sum)  |
|                | read(V)     | read(V)    |
|                | V := V + 50 |            |
|                | write(V)    | write(V)   |
|                | commit      | commit     |
| read(V)        |             | read(V)    |
| sum := sum + V |             |            |
| write(sum)     |             | write(sum) |
| commit         |             | commit     |

## Serializability

>[!Definition]
>Let $C$ be the set of transactions and $Sch(C)$ the set of schedules for $C$.
>A schedule $S \in Sch(C)$ is *serializable* $\iff$ the effect of $S$ on any consistent database instance is identical to the effect of some serial schedule $S_0 \in Sch(C)$.

Serialisability is a *correctness criterion* for an interleaved schedule.
>[!Info]- Proof
>Consider the serial schedule $(T_1, T_2, \dots, T_n), T_i \in C$. Assume the database instance is in a correct state prior to executing $T_i$. Each transaction must follow the ACID properties, i.e. it must preserve the consistency of the database. Thus, the database is in a correct state after $T_n$ completes execution $\Rightarrow$ if a serializable schedule is executed on a correct database instance, it produces a correct database instance (since it is equivalent to some serial schedule).
### Conflict serializability

>[!Definition] Conflict relations
>Let $C$ be the set of transactions, $Sch(C)$ the set of schedules for $C$ and $Op(C)$ the set of operations of the transactions in $C$. Let $S \in Sch(C)$. 
>The **conflict relation** of $S$ is defined as: $$
\begin{aligned}
\text{conflict}(S) = \{ (op_1, op_2) \mid op_1, op_2 \in Op(C), op_1 \text{ before } op_2 \text{ in } S, \\ 
\text{and } op_1, op_2 \text{ are in conflict} \}
\end{aligned}
$$

>[!Definition] Conflict equivalence
> Two schedules $S_1$ and $S_2$ are **conflict equivalent** ($S_1 \equiv_c S_2$) $\iff$ conflict($S_1$) = conflict($S_2$), i.e.
> - $S_1$ and $S_2$ contain the same operations of the same transactions and 
> - every pair of conflicting operations is ordered in the same manner in $S_1$ and $S_2$.



