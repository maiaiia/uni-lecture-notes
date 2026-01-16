---
Class: "[[Databases]]"
date:
type: Lecture
---
# Indexes

## Introduction
Indexes are auxiliary data structures that speed up operations which can't be efficiently carried out given the files' organisation. They enable the retrieval of the rids of records that meet a selection condition.

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

## Clustered & Unclustered Indexes

> [!Definition]
>  A **clustered index** is an index where the order of the data records is close to / the same as the order of the data entries.
>  
>  An **unclustered index** is an index that is not clustered. 

In practice, clustered indexes use alternative 1 for data entries, and unclustered indexes use 2 and 3. A collection of records may have at most one clustered index and several unclustered indexes.

## Primary & Secondary Indexes

>[!Definition]
>A **primary** index is an index whose search key includes the primary key.
>
>A **secondary index** is an index that is not primary.
>
>A **unique index** is an index whose search key contains a candidate key.

By definition, the only indexes that may contain duplicates (data entries with the same search key value) are secondary indexes.

## [[Tree-Structured Indexing]]

## [[Hash-Based Indexing]]