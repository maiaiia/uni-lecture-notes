---
Class: "[[Databases]]"
date: 2026-01-15
type:
---
# DBSeminar7 - Indexes (Part II)

## Indexed Views

### Restrictions 
1. set options
	1. ANSI_NULLS ON 
	2. ANSI_PADDING ON 
	3. ANSI_WARNINGS ON 
	4. ARITHABORT ON 
	5. CONCAT_NULL_YIELDS_NULL ON 
	6. NUMERIC_ROUNDABORD OFF 
	7. QUOTED_IDENTIFIER ON 
SET_ANSI_NULLS ON 

| OPTION                  | ON                                                                                                                      | OFF                                                                                                           |
| ----------------------- | ----------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------- |
| ANSI_NULLS              | col is NULL                                                                                                             | col = NULL                                                                                                    |
| ANSI_PADDING            | keep trailing space                                                                                                     | trailing spaces removed                                                                                       |
| ANSI_WARNINGS           | - warn when NULL in MIN, MAX, SUM<br>- err /o <br>- err if an inserted / updated value exceeds the datatype             | - no warning when NULL in MIN, MAX, SUM<br>- warning<br>- warning                                             |
| ARITHABORT              | arithmetic overflow => error + statement aborted                                                                        | arithmetic overflow => return NULL                                                                            |
| CONCAT_NULL_YIELDS_NULL | NULL + 'abc' = NULL                                                                                                     | NULL + 'abc' = 'abc'                                                                                          |
| NUMERIC_ROUNDABORT      | decimal truncations raise warnings                                                                                      | no warning for decimal truncations                                                                            |
| QUOTED_IDENTIFIER       | object names can be specified with double quotes, and strings with simple quotes <br>(e.g. CREATE TABLE "having" is OK) | strings can be defined with both single and double quotes, but object names can't be surrounded by any quotes |
2. object names - 2 part format 
3. WITH SCHEMABINDING (we bind the view with the underlying tables - prevent the user from dropping those tables)
4. SELECT statement
	- not allowed to use having, order by, outer joins, set operators (union, except, intersect), top, distinct, subsequent queries, min, max, avg, stdev, var, 
5. def of the view -> deterministic
6. used functions -> non-deterministic (getdate(), )
7. COUNT -> COUNT_BIG
8. sum(expr) -> sum(isnull(expr, 0))

#### exercise
Task: comply all the restrictions so that we can get the view materialised (i.e. stored on the disk)
```sql
CREATE VIEW viewSTM AS 
	SELECT 
		T.spyId, T.mid, 
		COUNT(*) no_tasks, 
		SUM(T.salary) sum_sal, AVG(T.salary) avg_sal,
		MIN(S.age) min_age, MAX(S.age) max_age
	FROM Spies S 
		FULL OUTER JOIN Tasks T ON S.id = T.spyId
		FULL OUTER JOIN Missions M ON M.mid = T.mid
	GROUP BY T.spyId, T.mid 
	HAVING COUNT(*) > 1 
	ORDER BY T.spyId, T.mid
```


```sql
ALTER VIEW viewSTM AS 
	WITH SCHEMABINDING
	SELECT 
		T.spyId, T.mid,
		COUNT_BIG(*) no_tasks,
		SUM(ISNULL(T.salary, 0)) avg_sal
		-- can't use avg, min, max
	FROM dbo.Spies S 
		INNER JOIN dbo.Tasks T ON S.id = T.spyID
		INNER JOIN Missions M ON M.mid = T.mid 
	GROUP BY T.spyId, T.mid
	-- can't use having 
	-- can't use order by
	
-- so far, the result is not materialised (stored on the disk)
-- in order for it to be materialised, we must create a unique clustered index

CREATE UNIQUE CLUSTERED INDEX IeCLviewSTM 
	ON viewSTM(spyId, mid)
-- now, the view is materialised
-- if we want, we may also add unclustered indexes
```

```sql
-- write a query in which the view is used 
SELECT *
	FROM viewSTM
	WHERE mid = 1 

-- execution plan: query optimiser will most likely expand the definition and use the clustered index on Spies, Missions and Tasks

SELECT * WITH(noexpand) -- by adding this option, the query optimiser will know not to expand the definition and use the previously created clustered index
	FROM viewSTM
WHERE mid = 1
```

## Fragmentation 
Types:
1. internal
2. extent
3. logical

In SQL server, in order to check physical fragmentation, 
```sql
dm_db_index_physical_stats
avg_fragmentation_in_percent - heap -> extent frag; cl.idx table -> logical frag.
avg_page_space_used_in_percent
```

In order to reduce fragmentation:
- heap: create a clustered index and drop it (when cli are created, the records are sorted and redistributes in the same area in memory)
- cl.idx table
	- frag between 5-30% --> reorganise the index (ALTER INDEX REORGANIZE - rearranges leaf pages)
	- frag > 30% --> drop the clustered index and create it again (all the records are redistributed and stored again) OR use ALTER INDEX REBUILD (the effect is the same)

it's also possible to specify the fill factor when creating an index 
```sql
CREATE ... INDEX ...
	WITH(FILLFACTOR = 70)
```
### Internal Fragmentation

Refers to the unused space between pages
![[DBinternalFragmentation]]

this is an inefficient use of cache memory 

### Extent Fragmentation
an extent is 8 contiguous data pages 

### Logical Fragmentation 
the next physical page is different than the next logical page 

if we don't have enough space to, say, add a new record in a sorted index, and we need to use a new page in order to do that in another part of the memory (*page split* - added page is called an *out-of-order page*)

### exercise

Task: count the number of reads, extent switches, disk space, avg_fragmentation in 

![[DBSeminar7 2026-01-15 10.58.36.excalidraw]]

| Example | Reads | Extent Switches | Disk Space | avg frag % | avg page space used % |
| ------- | ----- | --------------- | ---------- | ---------- | --------------------- |
| 1       | 2     | 0               | 14kb       | 0          | 100                   |
| 2       | 6     | 4               | 42kb       | >50%       | 33%                   |

![[DBSeminar7 2026-01-15 11.02.06.excalidraw]]

## T_SQL - Control of Flow Language 
- BEGIN...END
- RETURN
	- besides functions, it may also be used in 
		- stored procedures - must return an integer 
			- 0 -> stored proc was executed correctly
			- non-0 -> errors
		- statement blocks 
		- batches (two go statements)
- WHILE
- IF...ELSE
- BREAK
- CONTINUE
- TRY...CATCH
```sql
BEGIN TRY
...
...
END TRY 
BEGIN CATCH 
...
END CATCH
```
- THROW 
	- similar to RAISERROR 
```sql
THROW 51000, 'No spy found', 1 -- severity is always 16; user-defined err lvl > 50000 (before 50000 - already defined)
RAISERROR('No spy found', 15, 20) -- severity may be specified

--recap severities:
-- < 11 - warning 
-- >= 11 - error 
-- >= 16 - auto registered in logs 
-- 20-25 - fatal --> db connection closed 
```
- WAITFOR
	- can be used with DELAY or TIME
- GOTO label
	- move execution to a specific point in the program denoted by a label