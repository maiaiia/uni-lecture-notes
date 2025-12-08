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
	Tables ||--o{ TestRunTables: fk
	TestRuns ||--o{ TestRunTables: fk
	TestRuns ||--o{ TestRunViews: fk
	Views ||--o{ TestRunViews: fk
	Tables ||--o{ TestTables: fk
	Tests ||--o{ TestTables: fk
	Tests ||--o{ TestViews: fk
	Views ||--o{ TestViews: fk

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
		int TestID PK, FK
		int TableID PK, FK
		int Position
		int NoOfRows
	}
	
	TestViews {
		int TestID PK, FK
		int ViewID PK, FK
	}
	
    TestRuns {
	    int TestRunID PK
	    varchar(2000) Description
        datetime StartAt
        datetime EndAt
    }
	
	TestRunTables {
		int TestRunID PK, FK
		int TableID PK, FK
		datetime StartAt
		datetime EndAt
	}
	
	TestRunViews{
		int TestRunID PK, FK
		int viewID PK, FK
		datetime StartAt
		datetime EndAt
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
