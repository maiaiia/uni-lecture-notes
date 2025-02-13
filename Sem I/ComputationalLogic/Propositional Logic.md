# Propositional Logic
Class: [[ComputationalLogic]]
Type: Lecture + Seminar
Tags: # 
Date: October 17th 2024
Teacher: [[Mihaela Lupea]]

Notes:
## [[Connectives]]

## [[Reasoning Modelling]]

## Semantic Concepts
### $\vDash$ - logical consequence
latex code: \vDash
- $\vDash U$: semantic validity
- $U \vDash V$ if *all models of U are also models of V* 
### $\equiv$ - logical equivalence
latex code : \equiv
- $U \equiv V$ if $U$ and $V$ have *identical truth tables*
### $\vdash$ - syntactic consequence
latex code: \\vdash
- $\vdash U$: syntactic validity
$U1,U2,...,Un \vdash V \iff U1\land U2 \land ... \land Un \land \neg V$ has a closed semantic table associated with it

>[!important] Soundness and completeness theorem
> *Soundness*: If $\vdash U$ then $\vDash U$
> *Compleness*: If $\vDash U$ then $\vdash U$
> *Soundness & Completeness* : $\vdash U \iff \vDash U$
## Logical equivalences
### De Morgan laws
- $\neg (U \land V) \equiv \neg U \lor \neg V$
- $\neg (U \lor V) \equiv \neg U \lor \neg V$
### Absorption laws
- $U \land (U \lor V) \equiv U$
- $U \lor (U \land V) \equiv U$ 
### Misc
- $U \rightarrow V \equiv \neg U \lor V$
- $U \leftrightarrow V \equiv (U \rightarrow V)\land(V \rightarrow U)$

## Exercises
1. Check the following properties for $\downarrow$ , $\uparrow$, $\oplus$ using the truth table method 
(for every exercise, mention that THEORETICAL ASPECTS: $U \equiv V$ if the truth tables (TT) of U and V are identical)
  $$p \uparrow (q \lor r) \equiv (p \uparrow q) \land(p \uparrow r), where \uparrow = \neg (p \land q)$$

| p   | q   | r   | q ∨ r | p ↑ (q ∨ r) | p ↑ q | p ↑ r | a ∧ b |
| --- | --- | --- | ----- | ----------- | ----- | ----- | ----- |
| T   | T   | T   | T     | F           | F     | F     | F     |
| T   | T   | F   | T     | F           | F     | T     | F     |
| T   | F   | T   | T     | F           | T     | F     | F     |
| T   | F   | F   | F     | T           | T     | T     | T     |
| F   | T   | T   | T     | T           | T     | T     | T     |
| F   | T   | F   | T     | T           | T     | T     | T     |
| F   | F   | T   | T     | T           | T     | T     | T     |
| F   | F   | F   | F     | T           | T     | T     | T     |
$$p \rightarrow q \vDash (q \rightarrow r) \rightarrow (p \rightarrow q \lor r)$$

| p   | q   | r   | p $\rightarrow$ q | q $\rightarrow$ r | q $\lor$ r | p $\rightarrow$ (q $\lor$ r) | (q$\rightarrow$ r )$\rightarrow$ (p $\rightarrow$ (q $\lor$ r) |
| --- | --- | --- | ----------------- | ----------------- | ---------- | ---------------------------- | -------------------------------------------------------------- |
| T   | T   | T   | T                 | T                 | T          | T                            | T                                                              |
| T   | T   | F   | T                 | F                 | T          | T                            | T                                                              |
| T   | F   | T   | F                 | T                 | T          | T                            | T                                                              |
| T   | F   | F   | F                 | T                 | F          | F                            | F                                                              |
| F   | T   | T   | T                 | T                 | T          | T                            | T                                                              |
| F   | T   | F   | T                 | F                 | T          | T                            | T                                                              |
| F   | F   | T   | T                 | T                 | T          | T                            | T                                                              |
| F   | F   | F   | T                 | T                 | F          | T                            | T                                                              |

