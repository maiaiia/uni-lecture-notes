# Abstract Data Types
___
Class: [[DataStructures&Algorithms]]
Type: Lecture
Tags: #datatype
Date: February 26th, 2025
___

## Def
An **Abstract Data Type** (ADT) is a [[data type]] having the following two properties:
1. the *objects* from the domain of the ADT are specified independently of their representation 
2. the *operations* of the ADT are specified independently of their implementation
The *domain* of and ADT describe what elements belong to the ADT 
The set of all operations for and ADT is called its *interface*. It contains the *signature* of the operations, together with the *input data*, *results*, *preconditions* and *postconditions* 

### Example

![[Date Example]]
The advantage of using a clear interface is that modifications performed upon an ADT don't change the way the ADT is used (i.e. the implementation of other code which uses it)


## Container ADTs 

### Def 
A *container* is a collection of data which allows the addition and removal of elements 

### Examples
- lists
- dictionaries (python) / maps 
- multi-maps 
- stacks 
- queues 
- priority queues 
- some sorted variations of the aforementioned containers