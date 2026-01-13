---
Class: "[[Databases]]"
date:
type: Lecture
---
# Functional Dependencies

## Relevant Concepts
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

## Simple Functional Dependency

>[!Definition] 
>Let $R[A_1,...,A_n]$ be a relation and $\alpha, \beta$ two subsets of attributes of $R$. The (simple or composite) attribute $\alpha$ **functionally determines** $\beta$ (notation $\alpha \rightarrow \beta$) $\iff$ every value of $\alpha$ in $R$ is associated with a precise, unique value for $\beta$. If an $\alpha$ value appears in multiple rows, each of these will contain the same value for $\beta$.
>$$\Pi_\alpha(r) = \Pi_\alpha(r') \rightarrow \Pi_\beta(r) = \Pi_\beta(r)$$
>
>here, $\alpha$ is the *determinant* and $\beta$ is the *dependent*

The functional dependency can be regarded as a property (restriction) that must be satisfied by the database throughout its existence.

If a relation contains a functional dependency, some associations among values will be stored multiple times $\Rightarrow$ data redundancy.
### example

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

### properties

>[!Definition] Armstrong's Axioms
>Let $\alpha, \beta, \gamma$ be subsets of attributes of $A$
>1. **reflexivity**: if $\beta \subseteq \alpha$, then $\alpha \rightarrow \beta$
>2. **augmentation**: if $\alpha \rightarrow \beta$, then $\alpha \gamma \rightarrow \beta \gamma$, where $\alpha \gamma = \alpha \cup \gamma$
>3. **transitivity**: if $\alpha \rightarrow \beta$ and $\beta \rightarrow \gamma$, then $\alpha \rightarrow \gamma$
>   
>   note that these rules are complete (they compute the closure of a set of functional dependencies) and sound (no erroneous functional dependencies can be derived)

The following rules can be derived from Armstrong's Axioms:
4. **union**: if $\alpha \rightarrow \beta$ and $\alpha \rightarrow \gamma$, then $\alpha \rightarrow \beta \gamma$
5. **decomposition**: if $\alpha \rightarrow \beta \gamma$, then $\alpha \rightarrow \beta$ and $\alpha \rightarrow \gamma$
6. **pseudo-transitivity**: if $\alpha \rightarrow \beta$ and $\beta \gamma \rightarrow \delta$, then $\alpha \gamma \rightarrow \delta$
7. 

Other properties:
-  if $K$ is a key, then $K \rightarrow \beta, \forall \beta$ a subset of $K$'s columns
-  if $\alpha \rightarrow \beta$ and $\alpha \subset \gamma$, then $\gamma \rightarrow \beta$

## Fully-Functional Dependency

>[!Definition] 
>Let $R[A_1,...,A_n]$ be a relation, and let $\alpha, \beta$ be two subsets of attributes of $R$. Attribute $\beta$ is **fully functionally dependent** on $\alpha$ if"
>- $\beta$ is functionally dependent on $\alpha$ (i.e. $\alpha \rightarrow \beta$)
>- $\beta$ is not functionally dependent on any proper subset of $\alpha$, i.e. $\forall \gamma \subset \alpha, \gamma \rightarrow \beta$ is not true

## Transitive Dependency

>[!Definition]
>An attribute $Z$ is **transitively dependent** on an attribute $X$ if $\exists Y$ s.t. $X \rightarrow Y, Y \rightarrow Z, Y\rightarrow X$ does not hold

## Multi-Valued Dependency

>[!Definition]
> Let $R[A]$ be a relation, with the set of attributes $A = \alpha \cup \beta \cup \gamma$. The **multi-valued dependency** $\alpha \rightrightarrows \beta$ (read $\alpha$ *multi-determines* $\beta$) is said to hold over $R$ if each value $u$ of $\alpha$ is associated with a set of values $v$ for $\beta$: $\beta(u) = \{v_1,v_2,\dots,v_n\}$, and this association holds regardless of the values of $\gamma$.
> 

In mathematical terms, $\forall w \in \Pi_\gamma(\sigma_{\alpha = u}(R)), \exists r_1\dots r_n$ such that $\Pi_\alpha(r_i) = u, \Pi_\beta(r_i) = v_i, \Pi_\gamma(r_i) = w$    

Or like in a way that is actually easy to understand:
If $\alpha \rightrightarrows \beta$ and the following rows exist:

| $\alpha$ | $\beta$ | $\gamma$ |
| -------- | ------- | -------- |
| u1       | v1      | w1       |
| u1       | v2      | w2       |
then the following rows must exist as well:

| $\alpha$ | $\beta$ | $\gamma$ |
| -------- | ------- | -------- |
| u1       | v1      | w2       |
| u1       | v2      | w1       |

>[!Property]
>Let $R[A]$ be a relation, $A = \alpha \cup \beta \cup \gamma$. If $\alpha \rightrightarrows \beta$, then $\alpha \rightrightarrows \gamma$.

## Join Dependency
>[!Definition]
>Let $R[A]$ be a relation and $R_i[\alpha_i], i \in \overline{1,m}$ the projections of $R$ on $\alpha_i$. $R$ satisfies the **join dependency** $* \{\alpha_1, \alpha_2, \dots, \alpha_m\}$ if $R = R_1 * R_2 * \dots * R_m$