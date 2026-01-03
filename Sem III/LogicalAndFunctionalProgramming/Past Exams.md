---
Class: "[[LogicalAndFunctionalProgramming]]"
date: 2026-01-03
type:
---
# Past Exams
[2025](https://github.com/Oancea-Teodora/UBB-Computer-Science/tree/main/Second%20Year/Semester%201/Logical%20and%20Functional%20Programming/Subjects/2025%20Subjects)

(L 4) Definiti o functie care, dintr-o lista de atomi, produce o lista de perechi (atom n), unde atom apare in lista initiala de n ori.

(L 25) Un arbore binar se memoreaza (radacina (lista-subarbore-1) (lista-subarbore-2)). Sa se determine lista nodurilor de pe nivelul k din arbore. Nivelul radacinii se considera 0. 

(L 27) Sa se scrie o functie care sterge primul, al 2-lea, al 4-lea, al 8-lea, ... element al unei liste liniare.

(L 29) Se da o lista neliniara. Sa se stearga toti atomii numerici care apar de un numar par de ori in lista. 


(P15) Write a predicate to compute the difference of two numbers, each written as a list, without transforming the list into a number.

(P 37) Write a predicate to compute the sum of a number in the list representation (without converting the list into a number) and a certain digit 

## A1. 
**The Prolog problems** will be solved in SWI Prolog. You will explain the code, give the reasoning, predicates specification including the recursive formula, flow model, meaning of all variables and parameters.
**The Lisp problems** will be solved in Common Lisp. You will explain the code, give the reasoning, functions specification, meaning of all variables and parameters, the formula for recursion. The MAP problem implies writing a main an dan auxiliary function. This may be solved without using MAP functions (with a penalty).

### I
#### 1. 
Consider the following function definition in LISP
```lisp
(defun Fct (F L)
  (cond
    ((null L) nil)
    ((funcall F(car L)) (cons (funcall F (car L)) (Fct F (cdr L))))
  )
)
```
Rewrite it in order to have only one recursive call `(funcall F (car L))`. Do not create global variables. Do not write a new sub-algorithm to achieve the same thing. Justify the answer.

#### 2.
Let L be a numerical list and consider the following PROLOG definition for the predicate `f(list, integer)`, with the flow model (i, o):
```prolog
f([], -1).
f([H|T],S) :- H>0, f(T, S1), S1 < H, !, S is H.
f([_|T], S) :- f(T, S1), S is S1.
```
Rewrite the predicate in order to have only one recursive call `f(T, S1)` in all clauses. You mai write auxiliary predicates. You may not write a new sub-algorithm to achieve the same thing. Justify the answer.

#### 3.
The LISP function G is defined by `(DEFUN G(L)(LIST (CAR L)(CAR L)))`. In order to rename the function G we execute `(SETQ Q 'G)` followed by `(SETQ P Q)`. What is the result of evaluating the form `(FUNCALL P '(A B C))`? Justify the answer.

#### 4.
Consider the PROLOG predicate `f(list, integer)` with the flow model `(i, o)`.
```prolog
f([], 0).
f([H|T], S) :- f(T, S1), S1 is S-H.
```
What is the 