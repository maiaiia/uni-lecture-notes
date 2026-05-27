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

Read Committed Snapshot works at command-level.