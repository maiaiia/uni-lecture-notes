---
Class: "[[Databases]]"
date: 2025-12-04
type:
---
# Lab 10
## T1

```sql
INSERT INTO TestRuns(TestID, RunDate)
VALUES(@TestID, GETDATE())
```

```mermaid
erDiagram
	Tests ||--o{ TestTables : a
	Tables ||--o{ TestTables : a
	TestRuns ||--o{ Tests : a
	TestRunTables ||--o{ TestRuns : a
	TestRunTables ||--o{ Tables : a
	TestRunViews ||--o{ TestRuns : a

	Tests {
		int TestID PK
		varchar(50) Name
	}
	
	Tables {
		int TableID PK
		varchar(50) Name
	}
	
	Views {
		int ViewID PK
		varchar(50) Name
	}
	
	TestTables {
		int TestID PK
		int TableID PK
		int Position
		int NoOfRows
	}
	
	TestViews {
		int TestID PK
		int ViewID PK
	}
	
    TestRuns {
	    int TestRunID PK
	    varchar(2000) Description
        datetime StartAt
        datetime EndAt
    }
	
	TestRunTables {
		int testRunID PK
		int tableID PK
		datetibe StartAt
		datetime EndAt
	}
	
	TestRunViews{
		int TestRunID FK
		int viewID
		itn queryDuration
	}
	
```

## T2
Delete all the rows in a table below a certain index

```sql
DECLARE table_cursor CURSOR FOR 
SELECT t.TableName
FROM Tables t INNER JOIN TestTables tt on t.tableID = tt.tableID
WHERE tt.TestID = @TestID
ORDER BY tt.Position ASC

OPEN table_cursor 
FETCH NEXT FROM table_cursor INTO @TableName
SET @SQL = 'Delete' + @TableName
FETCH
CLOSE
```

One test: take a specific position in a table and delete everything below it; register the position and the number of rows below it

azure data factory, databricks, apache --> cloud tools --> check integrated cursors
pyspark

## T3
insert the rows back in the table

## T4

```sql

```

