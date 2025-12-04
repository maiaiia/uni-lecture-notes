---
Class: "[[Databases]]"
date: December 4th, 2025
---
# Seminar V - Indexes

- struct: stored on the disk
- optimise retrieved operations

```sql
CREATE [UNIQUE] [CLUSTERED | NONCLUSTERED]
INDEX <idx-name> ON 
<obj> (skcol1 [ASC | DESC], skcol2 [ASC | DESC], ...)
[INCLUDE (colA, colB, ...)]
[WHERE <filter-cond>]
[WITH (opt1, opt2,...)]
```

- `<obj>` can either be a table or a view
- `<skcol>` are search key columns
- the other columns added afterwards are non-key columns

>[!Info]
>If the CLUSTERED / UNCLUSTERED keyword is omitted, the index will be unclustered by default

## Characteristics
- CLUSTERED / NONCLUSTERED
- UNIQUE / NOT UNIQUE
- search key 
	- formed by either one or multiple columns
- non-key columns idx.
- idx on 
	- full table
	- filtered table
- the columns included in the search key could be either ascending or descending

### clustered tables
- at most one clustered index per table                                          
- the order in which the data rows are stored on the disk is given by the clustered index                                                 
- key columns should be:
	- as unique as possible
	- a small datatype (sorting is more efficient)
	  - shouldn't be frequently updated 
- has access to the full records from the table                
- table with a PK + the table doesn't already have a cl. idx + no mention of the nonclustered kword $\Rightarrow$ clustered index on PK columns
- B+ tree structure

![[clusteredIndex]]
### non-clustered tables
- at most 999 per table
- the non-clustered index order is independent on how the data is stored on the disk
- (key cols values, record id)
	- based on the record id, we'll be able to identify the full record
- 2 types of tables: 
	- heap table (without a clustered index)
	- clustered table

The RID represents different things depending on the type of the table:
- heap $\rightarrow$ no. page, no. record
- cl. table $\rightarrow$ cl. idx valu
![[ncl-index]]

## Exercises
1000 rows / table
- Ctrl + L

1. Cl index scan

```sql
SELECT * 
FROM Children
```

- by running this query, the query optimiser is doing an optimised clustered index scan

2. Clustered index seek
Instead of scanning the full index, just go and search the specified record

```sql
SELECT * 
FROM Children 
WHERE cid = 2287 -- the condition must involve the primary key column for a seek
```

3. Create a clustered index on the table LettersToSanta
```sql
SELECT *
FROM LettersToSanta
WHERE letterDate = '2024-11-25'
```

(if we execute this query and hit control L, we should see a table scan, because the table doesn't have an index associated with it)

```sql
-- create a clustered index
CREATE CLUSTERED INDEX letters_cl
ON LettersToSanta(letterDate)
```

now if we run the clustered index seek -- optimised

4. nonclustered index seek

```sql
SELECT P.quantity, P.pid
FROM Presents P
WHERE quantity > 100 
-- clustered index SCAN 

CREATE NONCLUSTERED 
	INDEX quantityidx
	ON Presents(quantity)
-- previous query will be a nonclustered index seek
```

5. nonclustered index scan

```sql
SELECT P.quantity, P.pid
FROM Presents P 
ORDER By quantity --order by will scan through the nonclustered index
```

6. Key Lookup

```sql
SELECT P.quantity, P.pid
FROM Presents P 
WHERE quantity > 100
-- so far, the query optimiser is performing a nonclustered index seek

SELECT * -- if we search for all the data, a key lookup will be performed instead
FROM Presents P 
WHERE quantity > 100
```

keep in mind that in the nonclustered index we cannot access the full tuple

here, the optimiser has 2 options:
- if we have a lot of unique values for the quantity (especially for equality conditions) / there are few values that match the condition, it'll do a **ncl index seek + key lookup**
- otherwise, it will do a **clustered index scan**

>[!Info]
>note that the key lookup is quite expensive, because it needs to go through multiple areas in memory


7. Unique index

```sql
SELECT cname, cid
FROM Children
WHERE cname = 'Diana'
-- at this point, the query will execute a clustered index scan

CREATE UNIQUE 
	INDEX nameIndex
	ON Children(cname)

-- after we create the index, the execution plan for the previous query will be a ncl unique index scan

```