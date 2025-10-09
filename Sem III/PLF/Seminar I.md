# Seminar I
___
Class: [[PLF]]
Type: 
Tags: # 
Date: October 9th, 2025
___

## Theory
Logical and Functional programming both fall under the *declarative* programming paradigm. It's centered around defining some rules used to get to a solution. The programming language follows said rules to reach the solution.

(another paradigm - the most used one - is the imperative paradigm; mind that both paradigms can be present in a programming language)

- stop condition
- recursive relationship  

>[!Important]
>If a clause is missing, false is returned implicitly
## Prolog stuff
in prologue we don't define functions, but rather predicates (they always return a boolean)

prologue solves stuff using backtracking. when it finds a solution, it stops and returns true. the next keyword allows going from clause to clause.

so `false` means all clauses have been explored. `true` means one clause has returned true (but not necessarily all were evaluated)

unbounded variables are variables which have not been assigned a value
### Commands and Whatever
arithmetic equal: `=:=`
trace - see step by step execution
`is` operator: *numeric* assignation (if a variable is unbounded) and *numeric comparison* (if a variable is bounded)
`=` operator: *string* / *vector* assignation
`[]` : empty list
## Exercises
1. Write a function that returns true if its first digit is even, and false if at least one is odd

>[!Info] Mathematical Model
>$f(N) = \begin{cases}N \% 2 == 0, N < 10 \\ f(N / 10) \text{ otherwise} \end{cases}$

```prolog
%
% f(N) = 
%	N % 2 == 0, N < 10
%	f(N/10), otherwise

f(N):-N < 10, N mod 2 =:= 0.
f(N):-N >= 10, N1 is N div 10, f(N1).
```

2. Check if a number's first digit is either `4` or `7`

```prolog
% g(N) = 
%	N == 4 or N == 7, N < 10
%	(N % 10 == 4 or N % 10 == 7, N >= 10

g(N):-N is 4.
g(N):-N is 7.
g(N):-N>=10, N1 is N div 10, g(N1).
```

or, equivalently
```prolog
% g(N) = 
%	N == 4 or N == 7, N < 10
%	(N % 10 == 4 or N % 10 == 7, N >= 10

g(4).
g(7).
g(N):-N>=10, N1 is N div 10, g(N1).
```

so note that `g(N):-N is 4.` and `g(4).` are equivalent, but not with `g(N):-N =:= 4.` (the latter cannot be used for unbounded variable assignation)

3. function that adds all elements of a list

```prolog
% h(l1,...,ln) = 
% 	0, n == 0
% 	l1 + h(l2,...,ln) otherwise


```
