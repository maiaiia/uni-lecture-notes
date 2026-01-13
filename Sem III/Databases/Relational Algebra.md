---
Class: "[[Databases]]"
date:
type: Lecture
---
# Relational Algebra

## Operators

|  Symbol  |   Meaning    |
| :------: | :----------: |
| $\sigma$ |    SELECT    |
|  $\pi$   |   PROJECT    |
|    \*    | NATURAL JOIN |

### $\pi$ - Projection operator
The projection operator is used to decompose a relation. It has an awful definition, but think of it as simply selecting a subset of columns from a table (cause that's what it basically is).

$$\Pi_\alpha(R) = \{r[\alpha]|r\in R\},$$ where 
- $R[A_1,A_2,\dots,A_n]$ is a relation
- $\alpha$ is a subset of attributes from $R$
- $r$ is the new relation (i think?)

### * - Natural join
>[!Definition]
>The **natural join** of two relations $R[\alpha, \beta]$ and $S[\beta, \gamma]$, where $\alpha \cap \gamma = \emptyset$ is the relation $$R * S[\alpha, \beta, \gamma] = \{\Pi_\alpha(r), \Pi_\beta(r), \Pi_\gamma(s) | r \in R, s \in S, \Pi_\beta(r) = \Pi_\beta(s)\}$$

In other words, create a new entry for every match on $\beta$ with the corresponding values in the $\alpha$ and $\gamma$ rows. Or just a cross product between $R$ and $S$, but $\beta$ is included only once.

A relation can be decomposed into multiple new relations $R_\overline{1,m}$ . The decomposition is *good* if $R = R_1 * R_2 * \dots * R_m$, i.e. no data is added / lost through decomposition / composition.

#### example - BAD decomposition

Let the original relation be

| LearningContracts | Student | FacultyMember | Course |
| ----------------- | ------- | ------------- | ------ |
| r1                | s1      | f1            | c1     |
| r2                | s2      | f2            | c2     |
| r3                | s1      | f2            | c3     |
and two new relations $SF\text{[Student, FacultyMember]}$, $FC[\text{FacultyMember, Course}]$.

Using the $\Pi$ and $*$ operators, the following values are obtained for the two projections and their natural join 

| $SF$ | Student | FacultyMember |
| ---- | ------- | ------------- |
| r1   | s1      | f1            |
| r2   | s2      | f2            |
| r3   | s1      | f2            |

| $FC$ | FacultyMember | Course |
| ---- | ------------- | ------ |
| r1   | f1            | c1     |
| r2   | f2            | c2     |
| r3   | f2            | c3     |

| $SF * FC$ | Student | FacultyMember | Course |
| --------- | ------- | ------------- | ------ |
| r1        | s1      | f1            | c1     |
| r2        | s2      | f2            | c2     |
| ?         | s2      | f2            | c3     |
| ?         | s1      | f2            | c2     |
| r3        | s1      | f2            | c3     |

The decomposition is not good, since the $SF * FC$ relation contains extra records
