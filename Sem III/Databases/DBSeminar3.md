# Seminar III - Procedures
___
Class: [[Databases]]
Type: Seminar
Tags: # 
Date: November 6th, 2025
___

## 

```sql
CREATE PROC MissionLocation(@DIFFICULTY INT)
AS 
	SELECT Location 
	FROM Missions
GO
```

```sql
ALTER PROC MissionLocation(@DIFFICULTY INT)
AS
	SELECT LOCATION
	FROM MISSIONS
	WHERE DIFFICULTY = @DIFFICULTY

GO
EXEC MissionLocation @DIFFICULTY = 5
```

```sql
CREATE PROC CountLocations(@difficulty INT, @count INT OUTPUT)
AS 
	SELECT @count = COUNT(LOCATION) 
	FROM missions
	WHERE DIFFICULTY = @difficulty
		
GO

DECLARE @result INT = 0
SET @RESULT = 0 
EXEC CountLocations @difficulty = 6, @count = @result
	
```

```sql
ALTER PROC CountLocations(@difficulty INT, @count INT OUTPUT)
AS BEGIN
	SELECT @count = COUNT(LOCATION) 
	FROM missions
	WHERE DIFFICULTY = @difficulty
	IF @count = 0
		RaiseError('No Locations', 10, 1)
END
GO

```

>[!Info]
>BEGIN / END are used if there are multiple statements in the body of the procedure

## RaiseError

RaiseError has the following parameters:
- message
- severity 
	- between 0-25
	- 0: no error has occurred 
	- 1-10: error message printed in black
	- 11-19: error message printed in red
	- 20-25: fatal errors; the db is automatically closed; needs special permissions
- state
	- integer between 0 and 255
	- used to identify different errors

```sql
BEGIN TRY
	RaiseError(...)
END TRY 
BEGIN CATCH
	PRINT ERROR_MESSAGE() --ERROR_STATE, ERROR_SEVERITY, ERROR_NUMBER
	
```

## Global Variables 

```sql 
PRINT 
	@@ ERROR       -- the error number for the last executed T-SQL statement
	@@ IDENTITY    -- last inserted identity value
	@@ ROWCOUNT    --number of rows affected by the last statement
	@@ SERVERNAME  --  
	@@ VERSION     -- 
	@@ SPID        -- 

```

## Dynamic Execution 
Enables us to execute strings as statements

```sql
-- EXEC(<cmd>)
-- e.g.
EXEC('select * from Spies')
```

```sql
DECLARE @cmd VARCHAR(MAX)
SET @cmd = 'SELECT * FROM Spies WHERE ID='
DECLARE @id VARCHAR(50)
SET @id = '10'

EXEC(@cmd + @id)
```

>[!Warning]
>this poses potential security problems: SQL injection

```sql
EXEC SP_EXECUTESQL N'SELECT * FROM Spies WHERE ID=@id',N'@id INT',@id=5
```


## The OUTPUT Clause 
```sql
UPDATE Tasks T 
SET T.salary = T.salary + 25 / 100 * T.salary 
OUTPUT 
	inserted.mid, inserted.spyId, deleted.salary, inserted.salary, GETDATE(), SUSER_SNAME() --returns the user who performs the update 
INTO LogTable --should already exist in the db and have the corresponding column types
WHERE mid=100
```

## Cursors 

- similar to an iterator
- used to access a table row by row 
- not efficient; use alternatives whenever possible

```sql
DECLARE <cursor_name> CURSOR FOR <select_statement>
OPEN --populates the cursor; the specified SELECT statement is executed 
FETCH [NEXT / PRIOR / FIRST / LAST / ABSOLUTE n(int) / RELATIVE n(int)]
CLOSE -- some resources are released, but not all of them
DEALLOCATE -- all resources are released
```

>[!Info]
>FETCH ABSOLUTE n 
>- n > 0 --> the nth row after the first one in the cursor
>- n < 0 --> the nth row before the last one in the cursor 
>- n = 0 --> no row
>
> same goes for FETCH RELATIVE n, but now we compute the position relatively to the current position of the cursor

>[!Tip] CLOSE vs DEALLOCATE
>CLOSE: the cursor can be re-opened and re-used
>DEALLOCATE: the only way to re-use the cursor is if it's redeclared

```sql
DELCARE @name VARCHAR(50), @dif INT
DECLARE mission_cursor CURSOR FOR
	SELECT name, difficulty 
	FROM Missions 
OPEN mission_cursor 
WHILE @@FETCHSTATUS = 0 
	BEGIN 
		FETCH mission_cusor INTO @name, @dif 
		PRINT @name + CAST(@dif AS VARCHAR(10))
	END		
CLOSE mission_cursor 	
DEALLOCATE mission_cursor
```
## Exercises 

1. Find the ids of the missions which have at least 1 task assigned for the spy with the id = 2, but those missions shouldn't have any tasks assigned for spy 1

```sql
SELECT mid 
FROM T
WHERE spyId = 2
EXCEPT
SELECT mid 
FROM T
WHERE spyID = 1
```