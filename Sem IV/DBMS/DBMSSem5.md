---
Class: "[[DBMS]]"
date: 2026-05-05
type: Seminar
---
# Performance Timing in SQL Server 

1. Identify waits
2. Complete waits with queries 
3. Drill down to db / file level 
4. Investigate down to process level 
5. Find problematic queries

## 1. Identifying waits - sysdm_os_wait_stats
- wait type (locks, latches, network,, I/O, queue wait, external wait)
- waiting task count
- wait time in ms 
- max wait time in ms 
- signal wait time in ms 

## 2. sys.dm_os_performance_counter
- object name 
- counter name 
- instance name
- counter value 
- counter type - actual value / value divided by a base, cumulative counters, \[b1 t1 v1], \[b2 t2 v2]

## 3. sys.dm_io_virtual_file_stats
- params:
	- DBid --> DB_ID(...)
	- fileid --> FILE_IDEX(...)
- num_of_reads
- num_of_writes 
- num_of_bytes_read / written
- io_stall_read_ms / write_ms 
- io_stall

## 4. filter.on batches, procedures, queries 
- filter based on duration 
- sys.objects 
- string patterns

## 5. [[Indexes]] 
- clustered 
- non-clustered 
- unique
- not-unique
- single column
- multi-column
- covering (can prevent key lookups)
- indexed views
- indexes on computed columns 

Indexes can improve retrieval operations, filtering, sorting, grouping, join, deadlock avoidance. They can also improve performance for update operations in one to many relations.
Some disadvantages are: more memory, modifications on tables become slower (must update the indexes as well).


# Example 
```sql
DBCC DROPCLEANBUFFERS
DBCC FREEPROCCACHE
-- clear cached data
SET STATISTICS IO ON;
SET STATISTICS TIME ON;

SELECT * FROM Production.ProductDescription;

-- press ctrl l to get the execution plan

```