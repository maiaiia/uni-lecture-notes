---
Class: "[[LogicalAndFunctionalProgramming]]"
date: 2026-01-03
type:
---
# Past Exams
[2025](https://github.com/Oancea-Teodora/UBB-Computer-Science/tree/main/Second%20Year/Semester%201/Logical%20and%20Functional%20Programming/Subjects/2025%20Subjects)
[full subj](https://github.com/Oancea-Teodora/UBB-Computer-Science/tree/main/Second%20Year/Semester%201/Logical%20and%20Functional%20Programming/Subjects/2025%20Subjects)
[S1](https://github.com/Oancea-Teodora/UBB-Computer-Science/tree/main/Second%20Year/Semester%201/Logical%20and%20Functional%20Programming/Subjects/PLF%20Subjects/Prea%20multe%20subiecte%20pt%20a%20putea%20fi%20rezolvate)

**The Prolog problems** will be solved in SWI Prolog. You will explain the code, give the reasoning, predicates specification including the recursive formula, flow model, meaning of all variables and parameters.
**The Lisp problems** will be solved in Common Lisp. You will explain the code, give the reasoning, functions specification, meaning of all variables and parameters, the formula for recursion. The MAP problem implies writing a main an dan auxiliary function. This may be solved without using MAP functions (with a penalty).
## A1. 
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

```lisp
(defun Fct2 (F L)
  (cond
    ((null L) nil)
    (T 
      ((lambda (X)
        (cond
          (X (cons X (Fct F (cdr l))))
        )
      ) (funcall F(car l)))
    )
  )
)
; TODO - justify
```
#### 2.
Let L be a numerical list and consider the following PROLOG definition for the predicate `f(list, integer)`, with the flow model (i, o):
```prolog
f([], -1).
f([H|T],S) :- H>0, f(T, S1), S1 < H, !, S is H.
f([_|T], S) :- f(T, S1), S is S1.
```
Rewrite the predicate in order to have only one recursive call `f(T, S1)` in all clauses. You may write auxiliary predicates. You may not write a new sub-algorithm to achieve the same thing. Justify the answer.
```prolog
% my solution
f([],-1).
f([H|T], S):-
    f(T,S),
    (H =< 0 ; H =< S),!.
f([H|_], H).
```

```prolog
% another solution 
f([], -1).
f([H|T], S):-
	f(T, S1),
	compare(H, S1, S).
	
compare(H, X, H):-
	H > 0,
	H > X, !.
compare(_, X, X).
```
#### 3.
The LISP function G is defined by `(DEFUN G(L)(LIST (CAR L)(CAR L)))`. In order to rename the function G we execute `(SETQ Q 'G)` followed by `(SETQ P Q)`. What is the result of evaluating the form `(FUNCALL P '(A B C))`? Justify the answer.
`(A A )` TODO - justify
#### 4.
Consider the PROLOG predicate `f(list, integer)` with the flow model `(i, o)`.
```prolog
f([], 0).
f([H|T], S) :- f(T, S1), S1 is S-H.
```
What is the result of the evaluation `f([1,2,3,4,5,6,7,8],S)`? Justify the answer.

```
% (poor justification) 
% Prolog tries to bind unbound variables to whatever works so that predicates evaluate to true
% however, the is operator needs a bound value on the right hand side
% so the function will result in an error
```
### II.
For any given positive natural number N, generate all the sets of prime numbers that add up to N (including N, if applicable). Write the mathematical model, flow model, and the meaning of the variables for each predicate used. 
(Eg: N = 18 => \[\[2,3,13],\[2,5,11],\[5,13],\[7,11]])
```prolog
% rev(l1..ln) = 
%	[], n = 0 
%	rev(l2..ln) U l1 otherwise
% (i,o)
rev([], Acc, Acc).
rev([H|T], Acc, R):-rev(T,[H|Acc],R).
rev(L, R):-rev(L, [], R).

% checkPrime(l1..ln, E) = 
%	true, n = 0
%	false, E % l1 = 0 
%	checkPrime(l2..ln, E) otherwise
checkPrime([], _).
checkPrime([H|T], E):-
    not((E mod H) =:= 0),
    checkPrime(T,E).

% primes(N, C, a1..ak = []) = 
%	a1..ak, C > N
%	primes(N, C + 1, C U a1..ak), checkPrime(a1..ak, C)
%	primes(N, C+1, a1..ak) otherwise
% flow model : (i, o) (the accumulator is instantiated via a wrapper)
primes(N, C, Acc, Acc):- C > N, !.
primes(N, C, Acc, R):-
    checkPrime(Acc, C),!,
    C1 is C + 1,
    primes(N, C1, [C|Acc], R).
primes(N, C, Acc, R):-
    C1 is C + 1,
    primes(N, C1, Acc,R).
primes(N, R):-primes(N, 2, [], R).

% primeSum(N, p1..pn, CS, a1..an) =
%	p1 U a1..an, CS + p1 = N
%	primeSum(N, p2..pn, CS + p1, p1 U a1..an), CS + p1 < N
%	primeSum(N, p2..pn, CS, a1..an), CS < N
% (i, i, o)
primeSum(N, [P1|_], CS, A, [P1|A]):-
    CS2 is CS + P1,
    N is CS2, !.
primeSum(N, [P1|P2], CS, A, R):-
    CS2 is CS + P1,
    CS2 < N,
    primeSum(N, P2, CS2, [P1 | A], R).
primeSum(N, [_|P2], CS, A, R):-
    primeSum(N, P2, CS, A, R).
primeSum(N, P, R):-primeSum(N, P, 0, [],  R).

getPrimeSum(N, R):-
    primes(N, PRev),
    rev(PRev, P),
    primeSum(N, P, R).

main(N, S):-
    findall(R, getPrimeSum(N, R), S).
```
### III
An n-ary tree is represented in LISP as (root subtree1 subtree2 ...). Write a function to replace the nodes from the odd levels in the tree with a given value e. The level of the root is considered 0. **Use a MAP function**. Write the mathematical model and the meaning of all the parameters for each function used.

(Eg. for (a (b (g)) (c (d (e)) (f))) and e = h => (a (h (g)) (h (d (h)) (f)))

```lisp
; replaceOdd(tree, e, lvl) = 
;   e, tree is an atom and lvl is odd 
;   tree, tree is an atom 
;   replaceOdd(t1, e, lvl+1) U ... U replaceOdd(tn, e, lvl + 1) otherwise (tree = t1..tn)
; (i,i)
(defun replaceOdd(tree e &optional (lvl -1))
  (cond
    ((atom tree)
      (cond
        ((= (mod lvl 2) 1) e)
        (T tree)
      )
    )
    (T (mapcar (lambda (tree) (replaceOdd tree e (+ lvl 1))) tree))
  )
)
```
## A2

### I
#### 1. 
Consider the following function definition in LISP
```lisp
(defun f(l)
  (cond
    ((null l) 0)
    ((> (f (car l)) 2) (+ (car l)(f(cdr l))))
    (T (f (car l)))
  )
)
```
Rewrite it in order to have only one recursive call `(f (car L))`. Do not create global variables. Do not write a new sub-algorithm to achieve the same thing. Justify the answer.

```lisp
(defun f2(l)
  (cond
    ((null l) 0)
    (T 
      ((lambda (X)
        (cond
          ((> X 2) (+ (car l) X))
          (T X)
        )
      ) (f (car l)))
    )
  )
)
```
#### 2.
Let L be a numerical list and consider the following PROLOG definition for the predicate `f(list, integer)`, with the flow model (i, o):
```prolog
f([], 0).
f([H|T],S) :- f(T, S1), H < S1, !, S is H + S1.
f([_|T], S) :- f(T, S1), S is S1 + 2.
```
Rewrite the predicate in order to have only one recursive call `f(T, S1)` in all clauses. You mai write auxiliary predicates. You may not write a new sub-algorithm to achieve the same thing. Justify the answer.

```prolog
f([], 0).
f([H|T], S) :- f(T, S1), chooseS(H, S1, S).

chooseS(H, S1, S):-
	H < S1, !,
	S is H + S1.
chooseS(H, S1, S):-S is S1 + 2.
```
#### 3.
The LISP function F is defined by 
```lisp
(defun f(x &rest y)
  (cond
    ((NULL y) x)
    (T (APPEND x (MAPCAR #'CAR y)))
  )
)
```

What is the result of evaluating the form `(APPEND (f '(1 2))(f '(3 4) '(5 6) '(7 8)))`? Justify the answer.

```
; f '(1 2) returns '(1 2), since y is implicitly null 
; f '(3 4) '(5 6) '(7 8)
;     x is '(3 4), y is '((5 6) (7 8)) (since &rest indicates that the remaining arguments are packed in a list)
;    thus, mapcall calls car on (5 6) and (7 8) and concatenates the results using LIST -> (5 7). this is appended to '(3 4) --> (3 4 5 7)
; so, the result is (1 2 3 4 5 7)
```
#### 4.
Consider the PROLOG predicates `p(integer)`, `q(integer)`, `r(integer)` with the flow model `(o)` and the predicate `s`.

```prolog
p(1).
q(1).
r(1).
p(2).
q(2).
r(2).
s:-!, p(X), q(Y), r(Z), write(X), write(Y), write(Z), nl.
```

Give the result of the following goal: s. Justify the answer. 

```
the cut (!) operator is the first goal in the body of s, preventing backtracking to find alternative solutions, so we can conclude that s is deterministic. X, Y and Z are unbounded variables and they will take on the first value such that the predicates p, q and r are evaluated as true (so they all store 1). 

The result of the provided goal is 111.
```
### II.
Given a list of integers, generate all the sublists with odd lengths that have elements in strictly ascending order. Write the mathematical model, flow model, and the meaning of all the variables for each predicate used.

(Eg. L = \[2,4,1,6] => output: \[2], \[4], \[1], \[6], \[1,2,4], \[1,2,6], \[1,4,6], \[2,4,6]) (not necessarily in this order)
### III
A non-linear list is given. Write a LISP function to return the initial list in which the atoms from the level k from the initial list have been replaced with 0 (the superficial level is considered 1). **Use a MAP function**. Write the mathematical model and the meaning of all parameters for each function used. 

(Eg. for (a (1 (2 b)) (c (d)))) and a) k = 2 => (a (0) (2 b)) (0 (d))) or b) k = 1 => (0 (1 (2 b)) (c (d))) or c) k = 4 => original list.

## B

### I
#### 1. 
Consider the following function definition in LISP
```lisp
(defun f(l)
  (cond
    ((null l) nil)
    ((listp (car l))(append (f (car l)) (f (cdr l)) (car (f (car l)))))
    (T (list (car l)))
  )
)
```
Rewrite it in order to have only one recursive call `(f (car L))`. Do not create global variables. Do not write a new sub-algorithm to achieve the same thing. Justify the answer.
```lisp
(defun f(l)
  (cond
    ((null l) nil)
    (T ( (lambda (v) 
      (cond
        ((listp (car l)) (append v (f (cdr l)) (car v)))
        (T (list (car l)))
      )
    ) (f (car l))))
  )
)

```
#### 2.
Consider the following PROLOG definition for the predicate `f(integer, integer)` with the flow model `(i, o)`
```prolog
f(0, 0):-!.
f(I, Y):- J is I - 1, f(J, V), V > 1, !, K is I - 2, Y is K.
f(I, Y):-J is I - 1, f(J, V), Y is V + 1.
```
Rewrite the predicate in order to have only one recursive call `f(J, V)` in all clauses. You mai write auxiliary predicates. You may not write a new sub-algorithm to achieve the same thing. Justify the answer.
```prolog
f(0, 0):-!.
f(I, Y):- J is I - 1, f(J, V), aux(V, I, Y).

aux(V, I, Y):-
    V > 1, !, 
    Y is I - 2.
aux(V, _, Y):-
    Y is V + 1.
```
#### 3.
The LISP function F is defined by 
```lisp
(defun f(X &optional Y)
  (cond
    ((null Y) (cdr X))
    (T (cons (car X) Y))
  )
)
```

What is the result of evaluating the form `(APPEND (f '(1 2))(f '(3 4) '(5 6)))`? Justify the answer.

```lisp
(defun f(X &optional Y)
  (cond
    ((null Y) (cdr X))
    (T (cons (car X) Y))
  )
)
(print (APPEND (f '(1 2))(f '(3 4) '(5 6))))

; f '(1 2) --> (2)
; f '(3 4) '(5 6) --> X is '(3 4), Y is '(5 6) --> (3 5 6)
; result of append is (2 3 5 6)
```
#### 4.
Consider the PROLOG predicate `p(integer)`  with the flow model `(i)`.

```prolog
p(100).
p(N) :- write(N), N1 is N - 1, p(N1).
```

Give the result of the following goal: `p(0)`. Justify the answer. 

As long as p is not 100, the predicate won't evaluate to true. since we start from 0 and decrease N, it will never reach 100. thus, the goal results in an infinite loop (0-1-2-3... is displayed)
### II.
Chairs must be arranged for a show. There are red chairs and yellow chairs. One row contains 5 chairs. Find all the possible arrangements of chairs on a row, knowing that there can be at most 3 yellow chairs on a row. Write the mathematical model, flow model, and the meaning of all variables for each predicate used. 

```prolog
% setChairs(N, YC) = 
%	[], if N = 0 
%	'y' U setChairs(N - 1, YC + 1), N > 0, YC < 3
%	'r' U setChairs(N - 1, YC), N > 0
setChairs(0, _, []).
setChairs(N, YC, ['y'|R]):-
    N > 0, YC < 3,
    N1 is N - 1, YC1 is YC + 1,
    setChairs(N1, YC1, R).
setChairs(N, YC, ['r'|R]):-
    N > 0,
    N1 is N - 1,
    setChairs(N1, YC, R).
setChairs(R):-
    setChairs(5, 0, R).

main(S):-
    findall(R, setChairs(R), S).
```
### III
Write a LISP function to substitute an element e with another element e1 at any odd level from a nonlinear list (The superficial level is considered 1). **Use a MAP function**. Write the mathematical model and the meaning of all parameters for each function used.

(Eg. for (1 d (2 d (d))), e = d and e1 = f, the list is (1 f (2 d (f))))
```lisp
; subsOdd(l, e, e1, oddl) = 
;   e1, l = e and oddl = 1 
;   e, l is an atom 
;   subsOdd(l1, e, e1, 1 - oddl) U subsOdd(l2, e, e1, 1 - oddl) U ... U subsOdd(ln, e, e1, 1 - odd) otherwise (l = l1..ln)

(defun subsOdd(l e e1 &optional (oddl 0))
  (cond
    ((and (equal l e) (equal oddl 1)) e1)
    ((atom l) l)
    (T (mapcar #'(lambda (l) (subsOdd l e e1 (- 1 oddl))) l))
  )
)
```
## C 
### I 
#### 1
Consider the following function definition in LISP
```lisp
(defun f(n)
  (cond
    ((= n 1) 1)
    ((> (f (- n 1)) 2) (- n 2))
    ((> (f (- n 1)) 1) (f (- n 1)))
    (T (- (f (- n 1)) 1))
  )
)
```

Rewrite the definition in order to avoid the repeated call (f(- n 1)). Do NOT redefine the function. Do NOT use SET, SETQ, SETF. Justify your answer.

```lisp
(defun f2(n)
  (cond
    ((= n 1) 1)
    (T ((lambda (v)
      (cond
        ((> v 2) (- n 2))
        ((> v 1) (f (- n 1)))
        (T (- v 1))
      )
    ) (f (- n 1)))
    )
  )
)
```
#### 2
Given a numerical linear list, write a SWI-Prolog program that returns (in a list of pairs) all possible partitions of the initial list in two sublists, such that all elements of the sublists are relatively prime numbers (all elements of the first sublist are relatively prime and all elements of the second list are relatively prime). To avoid generating the same partition twice (ex: \[A, B] and \[B, A]), the first sublist will contain at most the same number of elements as the second sublist. For example, for the list \[3, 5, 7, 9], the result will be (not necessarily in this order): \[\[\[5, 3], \[9, 7]], \[\[7, 3], \[9, 5]], \[\[3], \[9, 7, 5]], \[\[9, 5], \[7, 3]], \[\[9, 7], \[5, 3]], \[\[9], \[7, 5, 3]]].

#### 3
For a given value N, generate the list of all permutations with elements N, N+1, ..., 2\*N-1 with the property that the absolute difference between two consecutive values from the permutation is <=2. Write the mathematical models and flow models for the predicates used.
```prolog
validE(N, E):-
    N =< E,
    N1 is N * 2 - 1,
    E =< N1.
diff(2).
diff(1).
diff(-1).
diff(-2).
% -2, -1, +1, +2

seq(N, C, C):-
    C =< N.
seq(N, C, R):-
    C1 is C + 1,
    C1 =< N,
    seq(N, C1, R).
seq(N, R):-
    N1 is N * 2 - 1,
    seq(N1, N, R).

inList([H|_], H):-!.
inList([_|T], E):-inList(T,E).

% genPerm (N, L, Acc, R)
genPerm(N, N, Acc, Acc).
genPerm(N, L, [H|T], R):-
    diff(D),
    C is H + D,
    validE(N,C),
    not(inList(T, C)),
    L1 is L + 1,
    genPerm(N, L1, [C,H|T], R).
genPerm(N, R):-
    seq(N, F),
    genPerm(N, 1, [F], R).
    
main(N,S):-
    findall(R, genPerm(N, R), S).
    
```
#### 4
Given a nonlinear list, write a Lisp function to replace the numerical values on odd levels and greater than a given value k to their natural predecessor. The superficial level is assumed 1. A MAP function shall be used. Example for the list (1 s 4 (3 f (7))) and a) k=0 the result is (0 s 3 (3 f (6))) b) k=8 the result is (1 s 4 (3 f (7)))

```lisp
; replPred(l, k, level) = 
;   emptyList, l is empty 
;   l - 1, l is a number and level is 1 
;   l, l is an atom
;   replPred(l1, k, 1 - level) U ... U replPred(ln, k, 1 - level) otherwise (l = l1..ln)
;(level is actually a flag that flips between 0 and 1, indicating if we're on an even or an odd level)

(defun replPred(l k &optional (level 0)) 
  (cond
    ((null l) nil)
    ((and (and (numberp l) (= level 1)) (< l k) ) (- l 1))
    ((atom l) l)
    (T (mapcar (lambda (l) (replPred l k (- 1 level)))l))
  )
)
```

## MISC 

(L 4) Definiti o functie care, dintr-o lista de atomi, produce o lista de perechi (atom n), unde atom apare in lista initiala de n ori.

(L 25) Un arbore binar se memoreaza (radacina (lista-subarbore-1) (lista-subarbore-2)). Sa se determine lista nodurilor de pe nivelul k din arbore. Nivelul radacinii se considera 0. 

(L 27) Sa se scrie o functie care sterge primul, al 2-lea, al 4-lea, al 8-lea, ... element al unei liste liniare.

(L 29) Se da o lista neliniara. Sa se stearga toti atomii numerici care apar de un numar par de ori in lista. 


(P15) Write a predicate to compute the difference of two numbers, each written as a list, without transforming the list into a number.

(P 37) Write a predicate to compute the sum of a number in the list representation (without converting the list into a number) and a certain digit 