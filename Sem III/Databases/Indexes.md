---
Class: "[[Databases]]"
date:
type: Lecture
---
# Indexes

## Introduction
Indexes are auxiliary data structures stored on the disk, associated with a table or a view. They speed up operations which can't be efficiently carried out given the files' organisation. They enable the retrieval of the ids of records that meet a selection condition.

Indexes have an associated **search key**, which is a set of one or more attributes of the indexed file (different from the key that identifies records). An index speeds up queries with equality / range selection conditions on the search key.

Indexes also contain **entries**, which are records in the index, thus enabling the retrieval of records with a given search key value.

Some organisation techniques (access methods) are:
- B+ trees 
- hash-based structures

>[!Info]
>When data is changed in a file, all indexes associated with that file are updated.

>[!Tip]
>Try to keep the *index size* as small as possible, as indexes are brought into the main memory for searches.

## Data Entries
There are 3 alternatives on how data entries in an index may be stored:
1. the actual data record with the desired search key value
2. a \<k, rid\> pair (rid - id of a data record, k - search key value)
3. a \<k, rid_list\> pair (the list contains the ids of data records with s.k.v k)

Alternative 1:
- the [[The Physical Structure of Databases#Files of Records|file of data records]] doesn't need to be stored in addition to the index
- the index can be seen as a special file organisation 
- there may be at most one such index / collection of records (to avoid data redundancy)

Alternatives 2 and 3:
- data entries point to corresponding data records
- in general, the size of an entry is much smaller than the size of the entire record
- a3 is more compact than a2, but can contain variable-length records
- there may be multiple indexes of this type on a collection of records
- these entries are independent of the file organisation

## Index Characteristics

Indexes can have the following characteristics:
- clustered / non-clustered
- unique / non-unique
	- A unique index guarantees that the search key contains no duplicate values. Uniqueness is useful information for the query optimiser. 
- search key can be either a single column or multi-column
- the columns can either be key or non-key 
- the order of the columns in the index can ascending on descending (if clustered)
- non-clustered indexes can either be full-table or filtered

### Clustered & Unclustered Indexes

> [!Definition]
>  A **clustered index** is an index where the order of the data records is close to / the same as the order of the data entries.
>  
>  An **unclustered index** is an index structure that is not clustered. It's 

In practice, *clustered indexes use alternative 1 for data entries*, and *unclustered indexes use 2 and 3*.
A collection of records may have at most one clustered index and several (999) unclustered indexes.
#### clustered indexes
Data pages in a clustered index always include *all the columns* in the table/
Clustered indexes are organised as [[Tree-Structured Indexing#B+ Trees|B+ Trees]].

When creating a primary key on a table, if a clustered index is not defined and a non-clustered index is not specified, a *unique clustered index* is created on the fields of the primary key.

### Key / Non-Key Index Columns
Key columns are those included in the search key, whereas non-key columns are specified afterwards in the INCLUDE clause, when creating a non-clustered index %%obviously; clustered indexes already include all columns%%
```sql
CREATE INDEX Index_Name 
	ON Schema_Name.Table_Name(Column) -- key index column
	INCLUDE (ColumnA, ColumnB, ColumnC) -- non-key index columns
```

Including non-key index columns helps in creating **covering indexes**

>[!Definition]
>A **covering index** is an index that contains all the columns that are necessary in a query

### Filtered Indexes 
This is an optimisation upon non-clustered indexes. Queries can be used in order to select only some entries from a certain subset of data. This helps with:
- better query performance
- maintenance cost
- storage cost
### Primary & Secondary Indexes

>[!Definition]
>A **primary** index is an index whose search key includes the primary key.
>
>A **secondary index** is an index that is not primary.
>
>A **unique index** is an index whose search key contains a candidate key.

By definition, the only indexes that may contain duplicates (data entries with the same search key value) are secondary indexes.
## Implementations
### [[Tree-Structured Indexing]]

### [[Hash-Based Indexing]]

## Algorithms 
### Table scan
- many operators require a full scan of the entire table
- sloooow
### Index Scan 
- used when evaluating $\sigma_C(R)$, where condition $C$ is of the form:
	- $A < v, A \leq v, A > v, A \geq v$, $A$ IS NULL, $A$ IS NOT NULL (index built for a key A)
	- all the previous and $A = v$ (index built on a non-key field A)
- to get the records from the relation, some blocks can be read multiple times
### Index Seek 
- when searching for a key value $K_0$ using a condition of the form $K = K_0$
- it's used when examining an index (stored as a B-tree, B+ tree) created:
	- via a key constraint 
	- with the CREATE INDEX statement 

>[!Tip]
>Note that $K$ can be either a simple or a composite key

### Key Lookup 
- Similar to a clustered index seek (*seek with lookup*), but Key Lookup may specify an additional PRE-FETCH argument instructing the execution engine to pre-fetch more keys in the clustered index
- these are expensive (used when a small percentage of the table fits the Where clause)
- a key lookup occurs when data is found in a non-clustered index, but additional data is needed from the clustered index to satisfy the query and therefore a lookup occurs.

>[!Warning]
>Key lookups are expensive because they require an additional operation to find the data and may also require additional I/O.

Key lookups can be handled using *covering indexes* or by using the INCLUDE clause in the create index statement.