# Introduction to Relational Databases
___
Class: [[Databases]]
Type: Lecture
Tags: # 
Date: October 1st, 2025
___

## Data Description Models
>[!Definition] Data Description Model
>Set of *concepts and rules* used to model data; such concepts describe
>- the structure of the data
>- consistency constraints
>- relationships with other data

The **schema** of the database (the data structure or template)
- data structures used to describe a collection of data stored in a database
- data in the collection: an *instance* of the schema

>[!Example]- Examples
>- entity-relationship
>- relational
>- network
>- hierarchical
>- object-oriented
>- noSQL
>- semistructured (XML)
### Relational Model

- **relation**: the main concept used to describe data
- schema:
	- the relation's name
	- for each field: name and type

### Entity-Relationship Models

- **semantic**, more abstract, high-level model
- a design in such a model is subsequently expressed in terms of the database management system's model
- main concepts: entities, attributes, relationships
	- **entity**: a piece of data, described by attributes
	- **entity set** (class / entity schema): entities with the same structure
	- **attribute**: name, domain of possible values, conditions to check correctness
	- **key**: 
		- a restriction defined on an entity set
		- set of attributes with distinct values in the entity set's instances
	- **relationship**
		- specifies an association among entities
		- descriptive attributes can be used
	- **relationship set**
		- describes all relationships with the same structure

>[!Definition] Schema of the model
>The schema of the model is the set of *entity sets* and *relationship sets*

#### binary relationships
These are relationships between two entity sets (say T1 and T2). The types of binary relationships are:
- **1:1**
	- one T1 entity can be associated with one T2 entity at most (and vice-versa)
- **1:n**
	- one T1 entity can be associated with any number of T2 entities
	- one T2 entity can only be associated with one T1 entity at most
- **m:n**
	- one T1 entity can be associated with any number of T2 entities (and vice-versa)

>[!Info]
>binary relationships are considered as *restrictions* in the database; when the db is changed, the system checks whether the relationship is of the specified type

## Databases 
A **database** contains:
- the database schema
	- description of data structures 
- a collection of data
	- instances of the schema
- various components:
	- views, procedures, functions, roles, users

data definition: kept in the database dictionary
data management: operations (insertion, deletion, update) and querying


### Database Management Systems
A **database management system** (DBMS) is a set of programs that are used to manage a database

>[!Example]- Examples
>Oracle, DB2, SQL, MySQL


