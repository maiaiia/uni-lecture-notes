# Theorems Of Deduction
___
Class: [[ComputationalLogic]]
Type: 
Tags: # 
Date: October 24th 2024
Teacher: [[Mihaela Lupea]]
___

Notes:

## Exercises
- it's important to first find the main implication(s)
if (....)

if $\vdash (p\rightarrow r) \rightarrow ((p\land r \rightarrow q) \rightarrow (p \rightarrow q))$

	Step 1. We apply the reverse of the theorem of deduction to obtain the initial deduction 
then $(p\rightarrow r) \vdash ((p\land r \rightarrow q) \rightarrow (p \rightarrow q))$ 
then $p\rightarrow r, (p\land r \rightarrow q) \vdash (p \rightarrow q)$
then $p\rightarrow r, (p\land r \rightarrow q), p \vdash q$ (\*)

	Step 2. We prove (\*)
f1: $p \rightarrow q$
f2: $p \land q \rightarrow q$ 
f3: p

	Step 3: Theorem of deduction 
if $p \rightarrow r, p \land r \rightarrow q, p \vdash q$
then $p \rightarrow r, p \land r \rightarrow q \vdash p \rightarrow q$
then  $p \rightarrow r \vdash (p \land r \rightarrow q) \rightarrow (p \rightarrow q)$
then $\vdash T1: (p \rightarrow r) \rightarrow (p \land r \rightarrow q) \rightarrow (p \rightarrow q)$
	

