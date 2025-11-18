# Seminar I
___
Class: [[PLF]]
Type: Seminar
Tags: # 
Date: October 9th, 2025
___

## Theory
Logical and Functional programming both fall under the *declarative* programming paradigm. It's centred around defining some rules used to get to a solution. The programming language follows said rules to reach the solution.

(another paradigm - the most used one - is the imperative paradigm; mind that both paradigms can be present in a programming language)


- stop condition
- recursive relationship  

>[!Important]
>If a clause is missing, false is returned implicitly
## Prolog stuff
in prolog we don't define functions, but rather predicates (that always return a boolean)

prolog solves stuff using backtracking. when it finds a solution, it stops and returns true. the next keyword allows going from clause to clause.

so `false` means all clauses have been explored. `true` means one clause has returned true (but not necessarily all were evaluated)

unbounded variables are variables which have not been assigned a value
### Commands and Whatever
- arithmetic equal: =:=
- `trace` - see step by step execution
- `is` operator: *numeric* assignment (if a variable is unbounded) and *numeric comparison* (if a variable is bounded)
- = operator: *string* / *vector* assignment
- `[]` : empty list
- `[H|T]`:  split a list into the first element and the rest of the list
## Exercises
1. Write a function that returns true if a number's first digit is even, and false otherwise

>[!Info] Mathematical Model
>$f(N) = \begin{cases}N \% 2 == 0, N < 10 \\ f(N / 10) \text{ otherwise} \end{cases}$

```
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

so note that `g(N):-N is 4.` and `g(4).` are equivalent, but not with `g(N):-N =:= 4.` (the latter cannot be used to assign unbounded variables the value 4)

3. function that computes the sum of all elements of a list

```prolog
% h(l1,...,ln) = 
% 	0, n == 0
% 	l1 + h(l2,...,ln) otherwise
% h(i,i), h(i,o) - flow model

h(L, Res):-L = [], Res is 0.
h([H|T], Res):-h(T, Res1), Res is Res1 + H.

```

4. return a list of all the divisors of a number

```prolog
% i(N, D) = 
% 	[], D >= N
% 	[D] U i(N, D + 1), D < N and N % D == 0
% 	i(N, D + 1), otherwise
% i(i, i,o)

i(N, D, []):-D>=N.
i(N, D, Res):-D < N, N mod D =:= 0, D1 is D + 1, i(N, D1, Res1), Res = [D | Res1].
i(N, D, Res):-D < N, N mod D =\= 0, D1 is D + 1, i(N, D1, Res).

% i(i,o)
i(N, Res):-i(N,2,Res). %wrapper function
```
