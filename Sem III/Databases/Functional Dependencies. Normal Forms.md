---
Class: "[[Databases]]"
date:
type: Lecture
---
# Functional Dependencies. Normal Forms

Ideally, database design should be carried out in such a manner that subsequent queries and operations are performed as smoothly as possible, i.e.
- no additional tests are required when changing data
- operations can be performed through SQL statements alone

These conditions can be easily met when relations satisfy certain conditions (i.e. they are in a certain **normal form**).

![[normal_forms]]
One of the main issues that normal forms tackle is **data redundancy**. 

>[!Important]
>If a relation is not in normal form X, it can be decomposed into mu