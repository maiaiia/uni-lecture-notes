---
Class: "[[Databases]]"
date:
type: Lecture
aliases:
  - DBMS
---
# LECTURE 1 - Databases and Database Management Systems

A **database** contains:
- the database schema
	- description of data structures used to model the data
	- kept in a database dictionary
- a collection of data (instances of the schema)
- various components: views, procedures, functions, roles, users

There is a separation between:
- [[DDL]] - **data definition** (kept in the database dictionary)
- [[DML]] - **data management** (insert / delete / update operations) and querying

A database is managed using a DBMS (database management system)  %%crazy%%

The entire database system is described by the database and the system used to manage it.

## ANSI-SPARC Architecture

*American National Standards Institute - Standards Planning and Requirements Committee* 

This is a three-level architecture for a database system, used by the main management systems. It includes 
- the **conceptual** structure (i.e. the [[Data Description Models#^dbschema |database schema]])
- **external structures**: describes the data structures used by a certain user program
- the **physical (internal) structure**: describes the storage structures (*files*, *indexes*)

![[ansi-sparc]]

Thanks to  the 3 levels of abstraction, this architecture ensures both *logical* and *physical* data independence. 

- **logical data independence**:
	- programs using data from the database are not affected by changes in the conceptual structure %%analogy with interfaces in Java -- many analogies with OOP concepts here%%
- **physical data independence**:
	- applications are insulated from changes in the physical structure of the data
	- for instance, files (such as indexes) can be added for optimisation purposes, since user's programs don't check the files (i.e. the physical structure) directly

## DBMS Functions
1. **definition** - definition language / dedicated applications that generate DDL commands
2. **management** - insert, update, delete, query (DML)
3. **administration** - database access authorisation, usage monitoring, performance monitoring and optimisation
4. **protection** of the database - *confidentiality* (protection against unauthorised data access), *integrity* (protection against inconsistent changes)

## DBMS Architecture
![[dbms-architecture]]


