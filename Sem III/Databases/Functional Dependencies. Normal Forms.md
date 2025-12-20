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
>If a relation is not in normal form X, it can be decomposed into multiple relations that are in normal form X.

## Relevant Concepts
### Projection operator. Natural join
The projection operator is used to decompose a relation. It has an awful definition, but think of it as simply selecting a subset of columns from a table (cause that's what it basically is).

$$\Pi_\alpha(R) = \{r[\alpha]|r\in R\},$$ where 
- $R[A_1,A_2,\dots,A_n]$ is a relation
- $\alpha$ is a subset of attributes from $R$
- $r$ is the new relation (i think?)


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
### Repeating attributes

Attributes can either be *simple* or *composite* (a set of attributes - at least two - within a relation). 

In some applications, attributes (of either kind) can take on multiple values for a record in the relation. These are called **repeating attributes**.

Repeating attributes cannot be used in the relational model. Relations that have them can be decomposed into 2.

>[!Definition]
>Let $R[A]$ be a relation; $A$ - the set of attributes. Let $\alpha$ be a repeating attribute in $R$. If $K$ is a key in $R$, the two relations into which $R$ is decomposed are $$R'[K\cup\alpha]=\Pi_{K\cup\alpha}(R)$$ $$R''[A-\alpha]=\Pi_{A-\alpha}(R)$$

>[!Example]-
>Consider the relation $\text{Student[Name, BirthYear, Group, Course, Grade]}$
>
>| Name   | BirthYear | Group | Course                             | Grade |
>| ------ | --------- | ----- | ---------------------------------- | ----- |
>| Ioana  | 2000      | 921   | Databases<br>OOP <br>OS            | 10<br>9<br>8    |
>| Vasile | 2000      | 925   | Databases<br>OOP <br>OS <br>PLF | 10<br>9<br>7<br>8    |
>
> Here, the pair $\text{\{Course, Grade\}}$ is a composite repeating attribute. 
>
> The relation can be decomposed into $\text{GeneralData[Name, BirthYear, Group]}, \text{Results[Name, Course, Date]}$
> 
>| Name   | BirthYear | Group |
>| ------ | --------- | ----- |
>| Ioana  | 2000      | 921   |
>| Vasile | 2000      | 926   |
>
>
>| Name   | Course    | Grade |
>| ------ | --------- | ----- |
>| Ioana  | Databases | 10    |
>| Ioana  | OOP       | 9     |
>| Ioana  | OS        | 8     |
>| Vasile | Databases | 10    |
>| Vasile | OOP       | 9     |
>| Vasile | OS        | 7     |
>| Vasile | PLF       | 8     |

### Prime attributes

>[!Definition]
>An attribute $A$ is said to be *prime* if there is a key $K$ and $A \subseteq K$ ($K$ can be a composite key; $A$ itself can be a key). If an attribute isn't included in any key, it is said to be *non-prime*

### Functional dependency

>[!Definition] 
>Let $R[A_1,...,A_n]$ be a relation and $\alpha, \beta$ two subsets of attributes of $R$. The (simple or composite) attribute $\alpha$ **functionally determines** $\beta$ (notation $\alpha \rightarrow \beta$) $\iff$ every value of $\alpha$ in $R$ is associated with a precise, unique value for $\beta$. If an $\alpha$ value appears in multiple rows, each of these will contain the same value for $\beta$.
>$$\Pi_\alpha(r) = \Pi_\alpha(r') \rightarrow \Pi_\beta(r) = \Pi_\beta(r)$$
>
>here, $\alpha$ is the *determinant* and $\beta$ is the *dependent*

The functional dependency can be regarded as a property (restriction) that must be satisfied by the database throughout its existence.

If a relation contains a functional dependency, some associations among values will be stored multiple times $\Rightarrow$ data redundancy.
#### example

Consider the relation $\text{Exam[StudentName, Course, Grade, FacultyMember]}$

| Exam | StudentName  | Course            | Grade | FacultyMember |
| ---- | ------------ | ----------------- | ----- | ------------- |
| 1    | Pop Ioana    | Computer Networks | 10    | Matei Ana     |
| 2    | Vlad Ana     | Operating Systems | 10    | Simion Bogdan |
| 3    | Vlad Ana     | Computer Networks | 9     | Matei Ana     |
| 4    | Dan Andrei   | Computer Networks | 10    | Matei Ana     |
| 5    | Popescu Alex | Operating Systems | 9     | Simion Bogdan |
We see here that the functional dependency $\{\text{Course} \rightarrow \text{FacultyMember}\}$ must be satisfied.

Some problems arise:
- *wasting space*: the same associations are stored multiple times
- *update anomalies*: if the FacultyMember is changed for a specific course, the change must be carried out in all associations
- *insertion anomalies*: one cannot specify the FacultyMember for a course unless there's at least one student with a grade in said course
- *deletion anomalies*: when some records are deleted, data that is not intended to be removed can be deleted

The relation can be decomposed into the following two: $\text{Grades[Exam, StudentName, Course]}, \text{FacultyMembers[Course, FacultyMember]}$

| Exam | StudentName  | Course            | Grade |
| ---- | ------------ | ----------------- | ----- |
| 1    | Pop Ioana    | Computer Networks | 10    |
| 2    | Vlad Ana     | Operating Systems | 10    |
| 3    | Vlad Ana     | Computer Networks | 9     |
| 4    | Dan Andrei   | Computer Networks | 10    |
| 5    | Popescu Alex | Operating Systems | 9     |

| Course            | FacultyMember |
| ----------------- | ------------- |
| Computer Networks | Matei Ana     |
| Operating Systems | Simion Bogdan |
| Computer Networks | Matei Ana     |
| Computer Networks | Matei Ana     |
| Operating Systems | Simion Bogdan |
#### properties

1. if $K$ is a key, then $K \rightarrow \beta, \forall \beta$ a subset of $K$'s columns
2. *trivial functional dependency (reflexivity)*: if $\beta \subseteq \alpha$, then $\alpha \rightarrow \beta$ 
3. if $\alpha \rightarrow \beta$ and $\alpha \subset \gamma$, then $\gamma \rightarrow \beta$
4. *transitivity*: if $\alpha \rightarrow \beta$ and $\beta \rightarrow \gamma$, then $\alpha \rightarrow \gamma$
5. if $\alpha \rightarrow \beta$ and $\gamma$ a subset of $\{A_1,\dots,A_n\}$, then $\alpha \gamma \rightarrow \beta \gamma$, where $\alpha \gamma = \alpha \cup \gamma$

#### fully-functional dependencies

>[!Definition] 
>Let $R[A_1,...,A_n]$ be a relation, and let $\alpha, \beta$ be two subsets of attributes of $R$
## Normal Forms

### 1NF

>[!Definition]
>A relation is in the first normal form if it **doesn't have any repeating attributes**.
### 2NF

### 3NF

### BCNF 

### 4NF

### 5NF
