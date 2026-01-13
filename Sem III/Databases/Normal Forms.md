---
Class: "[[Databases]]"
date:
type: Lecture
---
# Normal Forms
## Introduction 
Ideally, database design should be carried out in such a manner that subsequent queries and operations are performed as smoothly as possible, i.e.
- no additional tests are required when changing data
- operations can be performed through SQL statements alone

These conditions can be easily met when relations satisfy certain conditions (i.e. they are in a certain **normal form**).

![[normal_forms]]
One of the main issues that normal forms tackle is **data redundancy**. 

>[!Important]
>If a relation is not in normal form X, it can be decomposed into multiple relations that are in normal form X.

## Types

### 1NF

>[!Definition]
>A relation is in the first normal form if it doesn't have any [[Functional Dependencies#Repeating attributes|repeating attributes]].
### 2NF

>[!Definition]
>A relation is in the second normal form if:
>1. It is in the first normal form and
>2. every (simple or composite) non-prime attribute is [[Functional Dependencies#Fully-Functional Dependency|fully functionally dependent]] on every key of the relation

Note that a relation that is in 1NF, but not 2NF, must have a composite key and a functional dependency $\alpha \rightarrow \beta$, where $\alpha$ is a proper subset of the key and $\beta$ is a non-prime attribute. This dependency can be eliminated if $R$ is decomposed into the following 2 relations: $\Pi_{\alpha \cup \beta}(R)$, $\Pi_{A-B}(R)$.
### 3NF

>[!Definition]
>Definition 1:
>A relation is in 3NF if it is in 2NF and no [[Functional Dependencies#Prime attributes|non-prime attribute]] is [[Functional Dependencies#Transitive Dependency|transitively dependent]] on any key in the relation.
>
>Definition 2:
>A relation $R$ is in 3NF if, for every non-trivial [[Functional Dependencies#Functional Dependencies#Simple Functional Dependency|functional dependency]] $X \rightarrow A$ that holds over $R$:
>- $X$ is a [[The Relational Model#^superkeydb|superkey]] or
>- $A$ is a prime attribute

### BCNF 

>[!Definition]
>A relation is in the Boyce-Codd normal form if every determinant of a functional dependency is a key (only non-trivial functional dependencies are considered)
### 4NF

>[!Definition]
>A relation $R$ is in 4NF if, for every [[Functional Dependencies#Multi-Valued Dependency|multi-valued dependency]] $\alpha \rightrightarrows \beta$ that holds over $R$, one of the statements below is true:
>- $\beta \subseteq \alpha$ or $\alpha \cup \beta = R$ (the dependency is trivial)
>- $\alpha$ is a [[The Relational Model#^superkeydb|superkey]]

- if $R[\alpha, \beta, \gamma]$ and $\alpha \rightrightarrows \beta$ with $R$ not in 4NF, $R$ is decomposed into the following relations:
	- $R_1[\alpha, \beta] = \Pi_{\alpha \cup \beta}(R)$
	- $R_2[\alpha, \gamma] = \Pi_{\alpha \cup \gamma}(R)$
### 5NF

>[!Definition]
>Relation $R$ is in 5NF if every non-trivial [[Functional Dependencies#Join Dependency |join dependency]] is implied by the candidate keys in $R$.
>
>JD $* \{\alpha_1, \dots, \alpha_m\}$ on $R$ is 
>- trivial if at least one $\alpha_i$ is the set of all attributes of $R$.
>- implied by the candidate4 keys of $R$ if each $\alpha_i$ is a superkey in $R$


