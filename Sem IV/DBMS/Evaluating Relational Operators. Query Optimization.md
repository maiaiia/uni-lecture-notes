---
Class: "[[DBMS]]"
date:
type:
---
# Evaluating Relational Operators. Query Optimization

Ref: [[Relational Algebra]], [[Indexes]]

## Overview

The query optimizer takes an SQL query Q as input and outputs an efficient execution plan for evaluating it.

![[query-optimizer-simplified]]
Algorithms for operators are based on *3 techniques*:
1. iteration:
	- examine iteratively:
		- all tuples in input relations OR
		- data entries in indexes, provided they contain all the necessary fields ([[Indexes#Data Entries|data entries]] are smaller than data records) 
2. indexing:
	- used when the query contains a selection condition or a join condition
	- examine only the tuples that meet the condition, using an index
3. partitioning
	- partition the tuples
	- decompose the operation into a collection of cheaper operations on partitions
	- partitioning techniques: sorting, hashing

### Access paths
>[!Definition] 
>An **access path** is a way of retrieving tuples from a relation

This can be done via either a file scan or an index $I$ + a matching selection condition $C$.
- $C$ matches the index $\iff$ $I$ can be used to retrieve just the tuples satisfying $C$
- if a relation $R$ has an index $I$ that matches selection condition $C$, then there are at least 2 access paths for $R$ (file scan; index)

In other words:
>[!Tip]
>Let condition $C := \text{attr op value, op}\in \{<, \leq, -, \geq, \neq, >\}$ . Then condition $C$ *matches* index $I$ if:
>- the search key of $I$ is $\text{attr}$ and
>	- $I$ is a tree index OR
>	- $I$ is a hash index and $\text{op}$ is $=$



