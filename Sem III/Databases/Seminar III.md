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
OUTPUT inserted.mid, inserted.spyId, deleted.salary, inserted.salary,
GETDATE(), SUSER_NAME()
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