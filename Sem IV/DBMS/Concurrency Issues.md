---
Class: "[[DBMS]]"
date: 2026-04-29
type: SelfStudy
---
# Concurrency Issues

## 1. Lost Updates 
When multiple transactions try to access and modify the same data.

## 2. Dirty Reads 
When one transaction tries to read uncommitted data

| T1    | T2     |
| ----- | ------ |
| R(A)  |        |
| W(A)  |        |
|       | R(A)   |
|       | W(A)   |
|       | Commit |
| R(B)  |        |
| W(B)  |        |
| Abort |        |
Note how T2 applied changes on top of the ones performed by T1 and modified the data according to them.
## 3. Unrepeatable Reads 
When one transaction reads some data twice, but said data is modified by a different transaction in between reads.

| T1     | T2     |
| ------ | ------ |
| R(A)   |        |
|        | R(A)   |
|        | W(A)   |
|        | Commit |
| R(A)   |        |
| W(A)   |        |
| Commit |        |

## 4. Phantom Reads 
Occurs when the 'where' clause of a select statement returns different results within the same transaction



(WR, RW, WW, )


