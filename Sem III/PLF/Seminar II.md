# Seminar II
___
Class: [[PLF]]
Type: 
Tags: # 
Date: October 23rd, 2025
___

## From a list of numbers, erase the unique values $[1,1,2,4,2,7] \rightarrow [1,1,2,2]$

### 1. find the number of occurrences of a number in a list
```prolog
% countOcc(l1..ln, e) = 
% 	0, n = 0 
% 	1 + countOcc(l2..ln, e) if l1 = e
% 	countOcc(l2..ln, e) otherwise
% countOcc(i, i, o)

countOcc([], _, 0). % countOcc(L, _, C):-L=[], C is 0.
countOcc([Elem|T],Elem,Count):- countOcc(T, Elem, Count1), Count is Count1 + 1.
countOcc([H|T], Elem, Count):- H =\= Elem, countOcc(T, Elem, Count).

```

>[!Tip]
>if a clause containing `!` is evaluated as true, stop backtracking to a different branch (pruning)

```prolog
% countOcc(l1..ln, e) = 
% 	0, n = 0 
% 	1 + countOcc(l2..ln, e) if l1 = e
% 	countOcc(l2..ln, e) otherwise
% countOcc(i, i, o)

countOcc([], _, 0). % countOcc(L, _, C):-L=[], C is 0.
countOcc([Elem|T],Elem,Count):-!, countOcc(T, Elem, Count1), Count is Count1 + 1.
countOcc([_|T], Elem, Count):- countOcc(T, Elem, Count).
```

### 2. function to eliminate unique values
```prolog
% elimUniq(l1..ln, l1..lm) = 
%	[], n = 0 	
% 	l1 U elimUniq(l2..ln,l1..lm) if countOcc(l1..lm, l1) > 1
%	elimUniq(l2..ln,l1..lm) otherwise
% elimUniq(i,i,0) 

elimUniq([],_,[]).
elimUniq([H|T], L, [H|R]):-countOcc(L, H, Count), Count > 1, elimUniq(T, L, R).
elimUniq([H|T], L, R):- countOcc(L, H, Count), Count =:= 1, elimUniq(T, L, R).
elimUnique(L, R) :- elimUniq(L, L, R).
```


## Tail Recursion and Collector Variables
>[!Info] Tail Recursion
> the last recursive call is always at the end (tail) of the clause
> it's used to optimise stack usage 

write a tail recursive clause equivalent to `countOcc([Elem|T],Elem,Count):-!, countOcc(T, Elem, Count1), Count is Count1 + 1.` 

this can be done via a **collector variable**!

```prolog
tailCountOcc([], _, Col, Col).
tailCountOcc([Elem|T],Elem,Col, Res):-Col1 is Col + 1, tailCountOcc(T, Elem, Col1, Res).
tailCountOcc([H|T], Elem, Col, Res):- H =\= Elem, tailCountOcc(T, Elem, Col, Res).
tailCountOcc(L, Elem, Res) :- tailCountOcc(L, Elem, 0, Res).
```

## Reverse the elements of  a list

```prolog
rev([], Col, Col).
rev([H|T], Col, Res):-rev(T, [H|Col], Res).
rev(L, R):-rev(L, [], R).
```

## Write a predicate to test the equality of two sets without using the set difference

>[!info]
>$A = B \iff A \subseteq B$ and $B \subseteq A$
>

(assume the input is a set!)

```prolog
% A = B if A is a subset of B and B is a subset of A
%
% find(l1..ln, elem) = 
% 	False, if n = 0	
% 	True, if l1 = elem
%	find(l2..ln, elem) otherwise
% find(i,i)

find([Elem|_], Elem).
find([H|T], Elem):-H=\=Elem, find(T, Elem).

% subset(l1..ln, s1..sm) = //test if S is subset of l
% 	True, if m = 0 
% 	False, if not find(l1..ln, s1)
%	find(l1..ln, s2..sm) otherwise

subset(_, []).
subset(L, [H|T]):-find(L,H),subset(L,T).

% equalSets(l1..ln,s1..sm) = 
%	subset(l1..ln, s1..sm), subset(s1..sm,l1..ln)
%

equalSets(L,S):-subset(L,S), subset(S,L).
```