---
Class: "[[Databases]]"
date:
type: Lecture
---
# LECTURE 2 - The Relational Model

This is the dominant model today. 

Data is organised as a set of **relations** (tables). Each relation has an **instance** (a table) and a **schema** (the table's column heads - (name, domain) pairs). 

>[!Definition]
> The **arity** (degree) of a relation is the number of column heads. 
> The **cardinality** of an instance is the number of tuples it contains.

In a relation, the values of an attribute are **atomic** and **scalar**. The records (rows) of the table are **not ordered** and **distinct**.

>[!Important]
>Although relations are defined as having distinct tuples, [[Databases and Database Management Systems|DBMS]]s allow tables to contain duplicates

## Integrity Constraints

These are conditions specified on the database schema, restricting the data that can be stored in the database. They are checked when the data is changed. Operations that violate the constraints are not allowed.

In some cases, instead of rejecting the operation (default behaviour), the DBMS will make additional changes to the data, so in the end all integrity constraints are satisfied.
### Domain constraints 

Conditions that must be satisfied by every relation instance: a column's values belong to its associated domain.
### Key constraints 
A constraint stating that a **subset of attributes** in a relation is a **unique identifier** for every tuple in the relation. 

>[!Definition]
>$K \subseteq \{A_1, A_2,\dots, A_k\}$ is a **key** for relation $R[A_1, A_2,\dots,A_n]$ if:
>- the attributes in $K$ can be used to identify every record in $R$
>- no subset of $K$ has this property

Two different records are not allowed to have identical values in all the fields that constitute a key, hence specifying one is a restriction for the database.

A relation can have *multiple keys*: one key is chosen as the **primary key**, while the others are considered **candidate keys**.

>[!Definition]
>A **superkey** is a set of fields that *contains the key* (e.g. a primary key + an additional column)

### Foreign Key constraints

These reinforce the fact that the values of some attributes in a relation *can appear* in another relation. The *data types* of the corresponding columns must be *compatible* (although the column names can be different).

Foreign key constraints can be used for [[Data Description Models#Binary relationships|1:n and m:n]] associations among entities. For m:n relationships, an additional table is needed.