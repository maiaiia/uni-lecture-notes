# Formulas
___
Class: [[ ComputationalLogic]]
Type: 
Tags: # 
Date: October 28th 2024
___
## Definition
A *well formed propositional formula* $U(p_1,...,p_n) \in F_p$ is a combination of propositional variables and [[Connectives|connectives]]

## Interpretations
An *interpretation* of a formula $U(p_1,...,p_n)$ is a function $i:\{p_1,...,p_n\}\rightarrow\{T,F\}$
- Any formula with $n$ propositional variables can have $2^n$ interpretations
- Interpretations assign truth values to propositional variables and, using the semantics of the connectives, evaluate formulas, assigning truth values to them

### Types of interpretations
**Models**:  $i:\{p_1, ..., p_n\} \rightarrow \{T, F\}$ is a model if $i(U) = T$
**Anti-Models**:  $i:\{p_1, ..., p_n\} \rightarrow {T, F}$, is an anti-model if $i(U) = F$

## Properties 
A formula is
- **consistent** (satisfiable), if it has at least one model
- **contingent**, if it has at least 1 model and at least 1 anti-model
- **inconsistent**, if it has anti-models only
- **valid / a tautology**, denoted by $\vDash$, if it has models only
![[SemanticConcepts]]
## Sets of formulas
The set $\{U_1,...,U_n\}$ is 
- *consistent* if $U_1\land ... \land U_n$ is consistent
- *inconsistent* if  $U_1\land ... \land U_n$ is inconsistent 
The formula $V$ is a *logical consequence* of  $U_1\land ... \land U_n$ ($U_1,...,U_n\vDash V$) if $\forall i$ where $i(U_1\land ... \land U_n)=T$ we have $i(V) = T$ 
- here, $U_1,...,U_n$ are called *premises* / *hypotheses*, and $V$ is called a *conclusion* 
## Normal Forms
A formula is in
- **DNF** (disjunctive normal form) if it is written as a disjunction of [[cube|cubes]]
	- a formula in DNF is inconsistent $\iff$ all its cubes are inconsistent
- **CNF** (conjunctive normal form): a conjunction of [[clause|clauses]]
	- a formula in CNF is valid $\iff$ all the clauses are tautologies 

Thus, the DNF of a propositional formula provides all its *models*, whereas the CNF provides all *anti-models*
## Theorems
- $U \vDash V \iff \neg U$ is inconsistent
- $U \vDash V \iff \vDash U \rightarrow V \iff \{U,\neg V\}$ is inconsistent 
- $U \equiv V \iff \vDash u \leftrightarrow V$
- $U_1,...,U_n\vDash V \iff \vDash U_1\land...\land U_n \rightarrow V$ 
## Exercises
 1. $$ U_7 = p \rightarrow (p \lor r) \land q$$

| nr  | p   | q   | r   | p $\land$ r | $(p \land r )\lor q$ | $p \rightarrow (p \land r) \lor q$ |
| --- | --- | --- | --- | ----------- | -------------------- | ---------------------------------- |
| 1   | T   | T   | T   | T           | T                    | T                                  |
| 2   | T   | T   | F   | F           | T                    | T                                  |
| 3   | T   | F   | T   | T           | T                    | T                                  |
| 4   | T   | F   | F   | F           | F                    | F                                  |
| 5   | F   | T   | T   | F           | T                    | T                                  |
| 6   | F   | T   | F   | F           | T                    | T                                  |
| 7   | F   | F   | T   | F           | F                    | T                                  |
| 8   | F   | F   | F   | F           | F                    | T                                  |
$i_4$ - anti-model
the rest are models
$\Rightarrow$ U is contingent

2. Transform $U_7$ into CNF and DNF. Use one of the forms to prove $U_7$ is a tautology
$$
U_7 = (p \rightarrow (q \land r)) \rightarrow ((p \rightarrow q) \land (p \rightarrow r))
$$ Steps:
1. U $\rightarrow$ V $\equiv$ $\neg U  \lor V$
$$U_7 \equiv \neg((p \rightarrow (q \land r)) \lor ((p \rightarrow q) \land (p \rightarrow r))) \equiv \neg(\neg p \lor (q \land r))\lor i give up<3 $$  

$$(p \rightarrow (q \leftrightarrow r)) \rightarrow ((p \rightarrow q) \leftrightarrow (p \rightarrow r)) $$

| p   | q   | r   | $q \leftrightarrow r$ | $p \rightarrow (q \leftrightarrow r)$<br>(c) | $p \rightarrow q$<br>(a) | $p \rightarrow r$<br>(b) | $a \leftrightarrow b$<br>(d) | c $\rightarrow$ d |
| --- | --- | --- | --------------------- | -------------------------------------------- | ------------------------ | ------------------------ | ---------------------------- | ----------------- |
| T   | T   | T   |                       |                                              |                          |                          |                              |                   |
| T   | T   | F   |                       |                                              |                          |                          |                              |                   |
| T   | F   | T   |                       |                                              |                          |                          |                              |                   |
| T   | F   | F   |                       |                                              |                          |                          |                              |                   |
| F   | T   | T   |                       |                                              |                          |                          |                              |                   |
| F   | T   | F   |                       |                                              |                          |                          |                              |                   |
| F   | F   | T   |                       |                                              |                          |                          |                              |                   |
| F   | F   | F   |                       |                                              |                          |                          |                              |                   |

3. find all models of the following formula:
$$U_7 = (q \lor r \rightarrow p ) \rightarrow (p \rightarrow r) \land q$$
$U_7 = (q \lor r \rightarrow p) \rightarrow (p \rightarrow r) \land q \Leftrightarrow (\neg (q \lor r) \lor p) \rightarrow (\neg p \lor r) \land q \Leftrightarrow \neg (\neg (q \lor r) \lor p) \lor ( \neg p \lor r )) \land q$
$\Leftrightarrow ((q \lor r) \land \neg p) \lor ( \neg p \lor r )) \land q \Leftrightarrow \underline{(q \land \neg p)} \lor (r \land \neg p) \lor \underline{(\neg p \land q)} \lor (r \land q) \Leftrightarrow (q \land \neg p) \lor (r \land \neg p) \lor(r \land q)$
$\Rightarrow$ we have reached DNF with 3 cubes $\Rightarrow$ for this formula to be true, at least one cube must be true 
I) $(q \land \neg p)$ - true $\Rightarrow$ q = T, p = F $\Rightarrow$ 2 models ($i_1$: q = T, p = F, r = T $i_2$: q = T, p = F, r = F) and just compute all valid tuples (p, q, r)

4. $$U = (p \rightarrow_1 (q \rightarrow_2 r)) \land \neg (q \rightarrow_3 (p \rightarrow_4 r)) \equiv_{2,4} (p \rightarrow_1 (\neg q \lor r)) \land \neg (q \rightarrow_3 (\neg p \lor r)) \equiv $$
$$\equiv_{1,2} (\neg p \lor (\neg q \lor r)) \land \neg ( \neg q \lor(\neg p \lor r)) \equiv_{DeMorgan's} (\neg p \lor \neg q \lor r) \land \neg ( \neg q \lor(\neg p \lor r))$$

!! poza galere continua