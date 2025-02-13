# Theory - Synopsis
___
## General
- order of precedence for connectives: $\neg  \land  \lor  \rightarrow  \leftrightarrow$
- [[clause]], [[cube]]
## Propositional Logic 
### Proof methods
- **semantic methods**: truth table, semantic tableau, CNF
- **syntactic methods**: resolution, definition of deduction, theorem & reverse theorem of deduction
>[!important] Theorem of deduction & its reverse
> *Theorem of deduction*: If $U_1,...,U_{n-1}, U_n\vdash  V$, then $U_1,...,U_{n-1}\vdash U_n \rightarrow V$
> *Reverse* : If $U_1,...,U_{n-1}\vdash U_n \rightarrow V$, then $U_1,...,U_{n-1}, U_n\vdash  V$
- **direct methods** (conclusion derived directly from the hypotheses): truth table, CNF, definition of deduction, theorem & reverse theorem of deduction 
- **refutation methods** (negate conclusion): resolution, semantic tableau
>[!important] Refutation theorem
> If $U_1,...,U_n\cup\{\neg V \}$ is inconsistent, then $U_1,...,U_n \vdash V$
## Predicate Logic 
>[!important] Soundness and completeness theorem
> *Soundness*: If $U_1, ..., U_n \vdash V$ then $U_1, ..., U_n \vDash V$
> *Compleness*: If $U_1, ..., U_n \vDash V$ then $U_1, ..., U_n \vdash V$
> *Soundness & Completeness* : $\vdash U \iff \vDash U$

**Theorem (Church)**: The problem of validity of a first-order formula is only *semi-decidable*. That is, if a procedure (*Proc*) is used to check the validity of a first-order formula *U*, we have the following cases:
1. If *U* is valid, then *Proc* ends with the corresponding answer 
2. If *U* is not valid, then *Proc* either ends with the corresponding answer or never stops
## Boolean Functions 


## Exam Requirements 
- Stating the theorem of soundness and completeness for every proof method 
Example:
1. Transform the formula U into its equivalent of dnf and cnf and decide the type of the formula
	- say what DNF and CNF are 
	- say that a formula is inconsistent iff the DNF of U has only inconsistent cubes 
	- a cube is inconsistent iff it contains 
	- a formula is consistent iff its CNF only has consistent clauses 
	- models are obtained from the DNF
	- anti-models are obtained from the CNF
2. Check the distributive property of the existential quantifier over conjunction using a syntactic proof method. The theorem of soundness and completeness of the method
3. or: a formula is a logical consequence if bla has a closed semantic table. explain why you apply alpha rules before beta rules and delta rules before gamma rules 


A2: Second axiom of propositional logic $$((U \rightarrow (V \rightarrow Z))) \rightarrow ((U\rightarrow V) \rightarrow (U \rightarrow Z))$$
A3: Third axiom of propositional logic (modum tollens) $$(U \rightarrow V) \rightarrow (\neg V \rightarrow \neg U)$$
Syllogism rule $$U \rightarrow V, V \rightarrow Z \vdash U \rightarrow Z$$
Permutation of the premises $$(U \rightarrow (V \rightarrow Z)) \rightarrow (V \rightarrow (U \rightarrow Z))$$
Reunion of the premises $$(U \rightarrow (V \rightarrow Z)) \rightarrow (U \land V \rightarrow Z)$$
Separation of the premises $$(U \land V \rightarrow Z) \rightarrow (U \rightarrow (V \rightarrow Z))$$
Distributivity