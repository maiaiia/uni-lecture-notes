---
Class: "[[DBMS]]"
date: 2026-04-21
type: Seminar
---
# Multiversioning

- sp_lock
- sys.din_tran_locks
- sys.din_tran_active_transactions 
- SQL Server Profiler 

## Resource types 

- RID: physical
- key
- page
- table, view
- file
- db
- metadata
- application
- HoBT - heap or B-tree

## Multi-versioning
W: every time you want to modify an object, it is first copied, and then modified (the copy is unaltered)
R: read a version of the object

## RLV (Row Level Versioning)

Every time a row gets updated, a copy is made and then it is updated
![[RLV]]
- all previous versions are stored in tempdb


### Isolation Levels
- Read Committed Snapshot Isolation 
```sql
ALTER DATABASE DBbame SET READ_COMMITTED_SNAPSHOT ON;
```

consistency 

-  Full Snapshot Isolation
```sql
ALTER DATABASE DBname SET ALLOW_SNAPSHOT_ISOLATION ON;
```


| Isolation Level                   | Command                                                | Consistency       | Update Conflict              |
| --------------------------------- | ------------------------------------------------------ | ----------------- | ---------------------------- |
| Read Committed Snapshot Isolation | ALTER DATABASE DBbame SET READ_COMMITTED_SNAPSHOT ON;  | command level     | handled automatically        |
| Full Snapshot Isolation           | ALTER DATABASE DBname SET ALLOW_SNAPSHOT_ISOLATION ON; | transaction level | needs to be handled manually |
%%consistency -- which data can be read (version before last command / last transaction)%%

under both isolation levels, no page or row locks are acquired
acquire Sch-S locks (table)
Sch-S prevent DDL on the table (i.e. you are not allowed to alter the table, drop / create columns / indexes, or change the schema in any way)

### Advantages 
- deadlock avoidance
- positive impact on indexes and triggers
- increased concurrency level

### Drawbacks
- additional storage + management
- write operations become slower (the object must first be copied and then modified)
- read operations may also become slower depending on which version is accessed 
- manages to solve write conflicts, however 2 writes aren't allowed
### Indexes and RLV
- before RLV - cl and uncl. idx: table becomes unaccessible
- after RLV  - indexes can be rebuilt online 

```sql
CREATE INDEX ...
WITH ONLINE = ON
```

### Triggers RLV 
- inserted table 
- deleted table 

before RLV, the transaction log was parsed to create deleted  + inserted
after RLV: RLV is used, since it's more efficient 

### Misc?
```sql
SET QUERY_GOVERNOR_COST_LIMIT value --(seconds)
```

### Commands to See Log Information
DBCC LOG (DBname, 0-4)
DBCC LOGINFO 
DBCC SQLPERF (LOGSPACE)


### Concurrency Models 
- optimistic (no exclusive locks)
- pessimistic (assume read conflicts can happen often)

read uncommitted is pessimistic


| Concurrency Problem \ Isolation Level | Read Uncommitted | Read Committed<br>(default) | Read Committed SNAPSHOT | Repeatable Read | SNAPSHOT   | Serializable |
| ------------------------------------- | ---------------- | --------------------------- | ----------------------- | --------------- | ---------- | ------------ |
| Dirty Reads                           | Y                | N                           | N                       | N               | N          | N            |
| Unrepeatable Reads                    | Y                | Y                           | Y                       | N               | N          | N            |
| Phantom Reads                         | Y                | Y                           | Y                       | Y               | Y          | N            |
| Update Conflicts                      | N                | N                           | N                       | N               | N          | N            |
| Concurrency Model                     | pessimistic      | pessimistic                 | optimistic              | pessimistic     | optimistic | pessimistic  |


```sql
-- replicating update conflicts 
-- script 1
ALTER DATABASE sem_2025_2026 
SET ALLOW_SNAPSHOT_ISOLATION ON;

SET TRANSACTION ISOLATION LEVEL SNAPSHOT; 

BEGIN TRAN 
	WAITFOR DELAY '00:00:10'
	UPDATE TABLE Spies SET realName = 'newRealName'
	WHERE id = 1
COMMIT TRAN

--script 2
ALTER DATABASE sem_2025_2026 
SET ALLOW_SNAPSHOT_ISOLATION ON;

SET TRANSACTION ISOLATION LEVEL SNAPSHOT; 

BEGIN TRAN 
	UPDATE TABLE Spies SET realName = 'differentName'
	WHERE id = 1
	WAITFOR DELAY '00:00:10'
COMMIT TRAN

-- if we execute both scripts at the same time, an update conflict error is shown
```

## Pivots
```sql
-- pivot 
SELECT * FROM Grades;
-- original columns are gid, student, course, grade 
-- we want to get student, WEB, DBMS
-- via a pivot 
-- (i.e. get the maximum grade that each student got for these 2 subjects)

SELECT student, WEB, DBMSs
FROM (
	SELECT student, course, grade 
	FROM Grades
) AS PivotData
PIVOT (MAX(grade) FOR course IN (WEB, DBMSs)) AS PivotTable

```

```sql
--unpivot 
SELECT * FROM Attendances 
-- aid student WEB DBMS AI => student course noAt

SELECT student, course, noAtt
FROM (
	SELECT Student, WEB, DBMSs, AI
	FROM Attendances
) AS UnpivotData 
UNPIVOT(noAtt for course in (WEB, DBMS, AI)) AS UnpivotTable

```

```sql
UPDATE Grades 
SET grade = 10 
OUTPUT inserted.gid, inserted.student, inserted.course, deleted.grade, inserted.grade, getdate(), suser_sname()
INTO GradesChanges
WHERE id = 6


SELECT * FROM GradesChanges --previously created log table

```