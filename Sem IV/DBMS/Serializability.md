---
Class: "[[DBMS]]"
date:
type: Lecture
---
# Serializability

>[!Definition]
>Let $C$ be the set of [[Transactions|transactions]] and $Sch(C)$ the set of schedules for $C$.
>A schedule $S \in Sch(C)$ is *serializable* $\iff$ the effect of $S$ on any consistent database instance is identical to the effect of some serial schedule $S_0 \in Sch(C)$.

^da0122

Serialisability is a *correctness criterion* for an interleaved schedule.
>[!Info]- Proof
>Consider the serial schedule $(T_1, T_2, \dots, T_n), T_i \in C$. Assume the database instance is in a correct state prior to executing $T_i$. Each transaction must follow the ACID properties, i.e. it must preserve the consistency of the database. Thus, the database is in a correct state after $T_n$ completes execution $\Rightarrow$ if a serializable schedule is executed on a correct database instance, it produces a correct database instance (since it is equivalent to some serial schedule).

![[dbms-serializability]]
## Conflicts

>[!Definition] Conflicts
>Two operations are in conflict if they meet *all three* of these criteria:
>1. They belong to *different transactions*
>2. They access the *same data item*
>3. At least one of them is a *Write* operation 

>[!Definition] Conflict relations
>Let $C$ be the set of transactions, $Sch(C)$ the set of schedules for $C$ and $Op(C)$ the set of operations of the transactions in $C$. Let $S \in Sch(C)$. 
>The **conflict relation** of $S$ is defined as: $$\begin{aligned}
\text{conflict}(S) = \{ (op_1, op_2) \mid op_1, op_2 \in Op(C), op_1 \text{ before } op_2 \text{ in } S, \\ 
\text{and } op_1, op_2 \text{ are in conflict} \}
\end{aligned}$$

## Conflict Serializability

>[!Definition] Conflict equivalence
> Two schedules $S_1$ and $S_2$ are **conflict equivalent** ($S_1 \equiv_c S_2$) $\iff$ conflict($S_1$) = conflict($S_2$), i.e.
> - $S_1$ and $S_2$ contain the same operations of the same transactions and 
> - every pair of conflicting operations is ordered in the same manner in $S_1$ and $S_2$.


>[!Definition] Conflict serializability
>A schedule $S$ is **conflict serializable** $\iff \exists$ a serial schedule $S_0 \in Sch(C)$ s.t. $S \equiv_c S_0$, i.e. $S$ is conflict equivalent to some serial schedule

Natural language equivalents cause damn:
If two consecutive operations in a schedule *do not* conflict, their order can be swapped without changing the final state of the database. 

*Conflict serializability* means that by repeatedly swapping non-conflicting adjacent operations, *an interleaved schedule can be transformed into a serial one*.

The easiest way to check if a schedule is conflict serializable is using a *precedence graph*.

>[!Definition]
> The precedence (serializability) graph of $S$ contains:
> - one node for every committed transaction in $S$
> - an arc from $T_i$ to $T_j$ if an action in $T_i$ precedes and conflicts with one of the actions in $T_j$

>[!Theorem]
>A schedule $S \in Sch(C)$ is conflict serializable $\iff$ its precedence graph is *acyclic*

Notes:
- Every conflict serializable schedule is serializable (in the absence of inserts / deletes, when items can only be updated)
-   **in the presence of insert operations, conflict serializability does not guarantee serializability** (see phantom reads)
- there are serializable schedules that are not conflict serializable

## View Serializability

>[!Definition] View equivalence
> Let $T_1, T_2 \in C$, $S_1, S_2 \in Sch(C)$. $S_1$ and $S_2$ are **view equivalent** ($S_1 \equiv_v S_2$), $\iff$:
> - if $T_i$ reads the initial value of $V$ in $S_1$, then $T_i$ also reads the initial value of $V$ in $S_2$
> - if $T_i$ reads the value of $V$ written by $T_j$ in $S_1$, then $T_i$ also reads the value of $V$ written by $T_j$ in $S_2$
> - if $T_i$ writes the final value of $V$ in $S_1$, then $T_i$ also writes the final value of $V$ in $S_2$

In other words, each transaction performs the same computation in $S_1$ and $S_2$ AND both $S_1$ and $S_2$ produce the same final database. Same initial reads, same dirty reads, same final writes.

>[!Definition] View Serializability
>A schedule is **view serializable** if it is *view equivalent* to some serial schedule.


>[!Tip]
> Conflict serializability is a sufficient, yet not necessary, condition for serializability. View serializability, on the other hand, is a more general, sufficient condition.

