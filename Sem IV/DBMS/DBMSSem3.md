---
Class: "[[DBMS]]"
date: 2026-03-31
type:
---
# Seminar 3 - Transactions. Concurrency Control in SQL Server
## Overview

>[!Definition] Transaction
>A group of multiple statements which are executed as a single unit

Transactions must respect the **ACID** properties
- **Atomicity** - either all operations are performed or none of them are
- **Consistency** - database consistency (rule compliance) is preserved, i.e. the statements in the transaction don't violate any rules
- **Isolation** - a transaction shouldn't interfere with other transactions
- **Durability** - After the transaction commits, we know that the data is persisted on the disk

## SQL Stuff

```sql
BEGIN TRANSACTION [NAME] --or BEGIN TRAN [NAME]
COMMIT TRAN
ROLLBACK TRAN
@@TRANCOUNT -- number of active transactions
```

transactions may be 
- either *local* or *distributed*
- nested

```sql
BEGIN TRAN T1
	...
	BEGIN TRAN T2
	...
	COMMIT TRAN T2 
	...
ROLLBACK TRAN T1 --note that the 2nd transaction is also rollbacked
```


transactions can have savepoints
```SQL
BEGIN TRAN T1 
	...
	SAVE TRANSACTION SavePoint123
	...
	ROLLBACK TRAN SavePoint123
```

## Concurrency Issues

- **Lost Updates**: when multiple transactions try to access the same data
- **Dirty Reads**: when one transaction tries to read uncommitted data
- **Non-repeatable Reads**: some data is read, then another transaction modifies it and commits, and then the initial transaction tries to read said data again 
- **Phantom Reads**: occurs when a select with a 'where' condition is executed at the same time as a different transaction, which inserts new data matching the where condition

### Locks
- managed by the **Lock Manager**

The main lock types are:
- **Shared Locks** (S) - required for *read operations* 
- **Exclusive Locks** (E) - required for *update operations*
- **Update Locks** (U) - used to *prevent deadlocks* 

>[!Important]
>There may be multiple shared locks acquired at the same time. 
>There may only be one exclusive lock acquired at any time. In this case, no shared locks are allowed.

granularities: row / key, page, table, extent (8 contiguous data pages), database

Other types of locks:
- Intent - IX, IS, SIX (shared and exclusive)
- Schema
	- Sch-M (prevents concurrent access to a table)
	- Sch-S (prevents the user from modifying the schema - table structure, constraints, yada yada)
- Bulk Update - used to insert a lot of data at once
- Key Range Locks - used to prevent phantom reads, will lock based on the where condition
- connection to db: Shared_Transaction_Workspace
## Transaction Isolation Levels
- **READ UNCOMMITTED** 
	- no shared locks are acquired during read operations
- **READ COMMITTED** (default)
	- shared locks are acquired for read operations and released when the read operation ends
- **REPEATABLE READ**
	- shared locks are acquired for read operations and released when the transaction ends
- **SERIALIZABLE** (highest isolation level)
	- shared locks are acquired and released when the transaction ends
	- key range locks are also used to prevent phantom reads
- **SNAPSHOT** 
	- for backups
	- used to cache the data from the db
	- read only

All transaction isolation levels acquire X locks for write operations and release them when the transaction ends.

Can the concurrency problem below be replicated under the given isolation level?

| Concurrency Problem \ Isolation Level | Chaos (no locks) | Read Uncommitted | Read Committed | Repeatable Read | Serializable |
| ------------------------------------- | ---------------- | ---------------- | -------------- | --------------- | ------------ |
| Lost Updates                          | Y                | N                | N              | N               | N            |
| Dirty Reads                           | Y                | Y                | N              | N               | N            |
| Unrepeatable Reads                    | Y                | Y                | Y              | N               | N            |
| Phantom Reads                         | Y                | Y                | Y              | Y               | N            |

## Deadlocks
- SQL Server - deadlock detection (wait for graph)
- SET LOCK_TIMEOUT 
- SET DEADLOCK_PRIORITY LOW / NORMAL / HIGH  (or an integer between 1 to 10)
	- a higher priority increases the chances that a transaction will be prioritised over another (i.e. the one with the highest priority will be executed successfully and the other transaction will be rolled back)

the sql server will choose a deadlock victim which will be rolled back (so that the other one may be executed successfully)

## Examples
Below are some examples of concurrency issues (and how to solve them)
### Dirty Reads

```sql
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
BEGIN TRAN 
	SELECT * FROM Spies
	WAITFOR DELAY '00:00:10'
	SELECT * FROM Spies
COMMIT TRAN
```

```sql
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
BEGIN TRAN 
	UPDATE Spies 
	SET codeName = ' NO NO NO '
	WHERE id = 8 
	WAITFOR DELAY '00:00:10'
ROLLBACK TRAN

-- solution: set transaction isolation level to read committed
```

### Unrepeatable reads
```sql
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
BEGIN TRAN
	SELECT * FROM Spies
	WAITFOR DELAY '00:00:10'
	SELECT * FROM Spies
COMMIT TRAN

SET TRANSACTION ISOLATION LEVEL READ COMMITTED
BEGIN TRAN
	UPDATE Spies 
	SET codeName = ' NO NO NO '
	WHERE id = 8 
	WAITFOR DELAY '00:00:10'
COMMIT TRAN

-- the solution for unrepeatable reads is setting the transaction isolation level to repeatable read
```

### Phantom reads
```sql
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
BEGIN TRAN 
	SELECT * FROM Spies 
	WHERE age > 20
	WAITFOR DELAY '00:00:10'
	SELECT * FROM Spies 
	WHERE age > 20	
COMMIT TRAN

SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
BEGIN TRAN 
	INSERT INTO Spies(id, realName, codeName, age, height, weight)
	VALUES ('10', 'Violeta', 'ViciousVio', 22, 1.65, 55)
	WAITFOR DELAY '00:00:10'
COMMIT TRAN
-- the solution for phantom reads is setting the transaction isolation level to serializable
```

### Deadlocks
```sql
BEGIN TRAN 
	UPDATE Spies 
		SET age = age + 1 
		WHERE age = 21
	WAITFOR DELAY '00:00:10'
	UPDATE Missions 
		SET description = 'Lorem ipsum no more'
		WHERE mid = 100
COMMIT TRAN

BEGIN TRAN 
	UPDATE Missions 
		SET description = 'super secret'
		WHERE mid = 200
	WAITFOR DELAY '00:00:10'
	UPDATE Spies 
		SET age = age + 1 
		WHERE age = 22
COMMIT TRAN
```