---
Class: "[[Databases]]"
date:
type: Lecture
---
# Relational Algebra
## Operators

|          Symbol          |             Meaning             | Equivalent Statement                                       |
| :----------------------: | :-----------------------------: | ---------------------------------------------------------- |
|      $\sigma_C(R)$       |             SELECT              | `SELECT * FROM R WHERE C`                                  |
|     $\pi_\alpha(R)$      |             PROJECT             | `SELECT DISTINCT a FROM R`                                 |
|     $R_1 \times R_2$     |          CROSS-PRODUCT          | `SELECT * FROM F1 CROSS JOIN R2`                           |
|      $R_1\cup R_2$       |              UNION              | `SELECT * FROM R1 UNION SELECT * FROM R2`                  |
|      $R_1 \cap R_2$      |          INTERSECTION           | `SELECT * FROM R1 INTERSECT SELECT * FROM R2`              |
|       $R_1 - R_2$        |         SET-DIFFERENCE          | `SELECT * FROM R1 EXCEPT SELECT * FROM R2`                 |
| $R_1 \otimes_\theta R_2$ | CONDITION JOIN / <br>THETA JOIN | `SELECT * FROM R1 INNER JOIN R2 ON THETA`                  |
|       $R_1 * R_2$        |          NATURAL JOIN           | `SELECT * FROM R1 NATURAL JOIN R2`                         |
|   $R_1 \ltimes_C R_2$    |         LEFT OUTER JOIN         | `SELECT * FROM R1 LEFT OUTER JOIN R2 ON C`                 |
|   $R_1 \rtimes_C R_2$    |        RIGHT OUTER JOIN         | `SELECT * FROM R1 RIGHT OUTER JOIN R2 ON C`                |
|    $R_1 \Join_C R_2$     |         FULL OUTER JOIN         | `SELECT * FROM R1 FULL OUTER JOIN R2 ON C`                 |
|      $R_1 \rhd R_2$      |         LEFT SEMI JOIN          | (none - returns the tuples in R1 that are used in R1 * R2) |
|      $R_1 \lhd R_2$      |         RIGHT SEMI JOIN         | (none - returns the tuples in R2 that are used in R1 * R2) |
|      $R_1 \div R_2$      |            DIVISION             |                                                            |
|          $\rho$          |        RENAMING OPERATOR        |                                                            |
### $\sigma$ - Selection operator

The actual notation is $\sigma_C(R)$, and it returns the records in $R$ that satisfy condition $C$
### $\pi$ - Projection operator
The projection operator is used to decompose a relation. It has an awful definition, but think of it as simply selecting a subset of columns from a table (cause that's what it basically is).

$$\Pi_\alpha(R) = \{r[\alpha]|r\in R\},$$ where 
- $R[A_1,A_2,\dots,A_n]$ is a relation
- $\alpha$ is a subset of attributes from $R$
- $r$ is the new relation (i think?)

### $\times$ - Cross-product 
$R_1 \times R_2$ - returns every tuple $r_1$ in $R_1$ concatenated with every tuple $r_2$ in $R_2$

### $\cup, \cap, \setminus$  
>[!Important]
>Note that these operators ELIMINATE DUPLICATES
>There are alternatives that don't (e.g. UNION ALL)

### $\otimes_\theta$ - Condition Join
>[!Definition]
>$R_1 \otimes_\theta R_2 = \sigma_\theta(R_1 \times R_2)$
### * - Natural join
>[!Definition]
>The **natural join** of two relations $R[\alpha, \beta]$ and $S[\beta, \gamma]$, where $\alpha \cap \gamma = \emptyset$ is the relation $$R * S[\alpha, \beta, \gamma] = \{\Pi_\alpha(r), \Pi_\beta(r), \Pi_\gamma(s) | r \in R, s \in S, \Pi_\beta(r) = \Pi_\beta(s)\}$$

The union of the attributes of the two relations (attributes with the same name in $R$ and $S$ appear only once in the result)

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

### Division
$R_1[\alpha], R_2[\beta], \beta \subset \alpha$
The resulting relation's schema is $\alpha - \beta$, and the tuples are all the records $r \in R_1 \div R_2$ where $\forall r_2 \in R_2, \exists r_1 \in R_1$ s.t. 
- $\pi_{\alpha - \beta}(r_1) = r$
- $\pi_\beta(r_1)=r_2$
i.e. a record $r$ belongs to the result if in $R_1$ $r$ is concatenated with every record in $R_2$

### $\rho$ - Renaming Operator
$\rho(R'(A_1 \rightarrow A_1', \dots, A_k \rightarrow A_k'), E)$
- E - relational algebra expression 
- the result, $R'$, has the same tuples as the result of $E$
- attributes $A_1, \dots, A_k$ are renamed to $A_1',\dots,A_k'$  respectively

## Independent Subsets of Operators
A subset of operators $M$ is independent if, for each of its operators $op$, there exists a relation that can be obtained using it (possibly besides other operators), but cannot be obtained with the operators of $M - \{op\}$.

For instance, for the query language with operators $\{\sigma, \pi, \times, \cup, -, \cap, \otimes, *, \ltimes, \rtimes, \Join, \lhd, \rhd, \div\}$, an independent set of operators is $\{\sigma, \pi, \times, \cup, -\}$.

## Statements 
| Statement                                       | Meaning                                |
| ----------------------------------------------- | -------------------------------------- |
| $:=$                                            | assignment                             |
| $\delta$                                        | eliminating duplicates from a relation |
| $S_\text{list}(R)$                              | sorting records in a relation          |
| $\gamma_\text{\{list1\} group by \{list2\}}(R)$ | grouping                               |