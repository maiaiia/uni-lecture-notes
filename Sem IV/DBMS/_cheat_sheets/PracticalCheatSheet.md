---
Class: "[[DBMS]]"
date: 2026-05-27
type: CheatSheet
---
# PracticalCheatSheet

| Concurrency Problem \ Isolation Level | Read Uncommitted | Read Committed<br>(default) | Read Committed SNAPSHOT | Repeatable Read | SNAPSHOT   | Serializable |
| ------------------------------------- | ---------------- | --------------------------- | ----------------------- | --------------- | ---------- | ------------ |
| Dirty Reads                           | Y                | N                           | N                       | N               | N          | N            |
| Unrepeatable Reads                    | Y                | Y                           | Y                       | N               | N          | N            |
| Phantom Reads                         | Y                | Y                           | Y                       | Y               | N          | N            |
| Update Conflicts                      | N                | N                           | N                       | N               | Y          | N            |
| Concurrency Model                     | pessimistic      | pessimistic                 | optimistic              | pessimistic     | optimistic | pessimistic  |

| Concurrency Anomaly | Description                                                                                                                                    | Solution                                                                                                                                      |
| ------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------- |
| Dirty Read          | a transaction reads uncommitted data from another transaction that later rolls back                                                            | isolation level > read uncommitted                                                                                                            |
| Unrepeatable Read   | a transaction reads the same data twice and gets different values because another transaction modified it (and committed) in-between reads     | isolation level > read committed (snapshot)                                                                                                   |
| Phantom Read        | a transaction executes the same SELECT query twice and get different value sets because another transaction inserted / deleted rows in-between | isolation level > repeatable read                                                                                                             |
| Deadlock            | a cycle of transactions waiting for one another to release a locked resource. prevents normal execution from continuing                        | establish an order in which resources are locked and stick with it                                                                            |
| Lost Update         | may only occur under SNAPSHOT isolation level.                                                                                                 | don't use snapshot? :)) <br>serializable isolation level really is the only way to keep snapshot's isolation level and avoid update conflicts |

Read Committed Snapshot works at command-level.