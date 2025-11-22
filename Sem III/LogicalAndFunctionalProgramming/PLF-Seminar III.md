# Seminar III
___
Class: [[LogicalAndFunctionalProgramming]]
Type: Seminar
Tags: # 
Date: October 31st, 2025
___

## 1. 
You are given a heterogeneous list, made of numbers and lists of numbers. You have to remove the odd numbers from the sub lists that have a mountain aspect (a list has a mountain aspect if it consists of an increasing sequence of numbers, followed by a decreasing sequence of numbers)

E.g. \[1,2,\[1,2,3,2],6,\[1,2],\[1,4,5,6,7,1],\[8,2]] --> \[1,2,\[2,2],6,\[1,2],\[4,6],\[8,2]]

```prolog
% isM (l1, l2, ..., ln)
%	false, []
%	desc(l2,...,ln), l1 > l2
%	isM(l2,l3,...,ln), l1 < l2
%
isM([H1, H2|T]):-H1>H2,desc([H2|T]).
isM([H1|[H2|T]]):- H1 < H2, isM([H2|T]).

% desc(l1l2..ln)
%	T, n >= 1
% 	desc(l2..ln), l1 > l2
desc([]).
desc([_]).
desc([H1,H2|T]):- H1 > H2, desc([H2|T]).

% mountain(l1..ln)
%	isM(l1..ln), n >=3 and l1 < l2
mountain([H1,H2,H3|T]):-H1<H2, isM([H1,H2,H3|T]).

% remove(l1,l2..,ln)
% 	[], n = 0
% 	l1 U remove(l2..ln), l1 is even
%	remove(l2..ln), l1 is odd

%rem_odd(L, Ret)

rem_odd([],[]).
rem_odd([H|T], [H|R]):- H mod 2 =:= 0, !, rem_odd(T, R).
rem_odd([_|T], R):-rem_odd(T,R).

% main(l1..ln)
%	emptyset, n == 0
% 	rem_odd(l1) U main(l2..ln) l1 is a list and mountain(l1)
% 	l1 U main(l2..ln) otherwise

main([], []).
main([H|T], [Tmp|R]):- is_list(H), mountain(H),!, rem_odd(H, Tmp), main(T,R).
main([H|T], [H|R]):-main(T,R).

```


`is_list`, `number`, `atom` (atom is whatever's neither a list nor a number)

`\+` or `not()` -- negate

## 2. 

How many ways of arranging N pairs of parentheses are there? (show them)

```prolog
% p(T, L, R)
%	emptyset, L + R = N, L = R
%	')' U p(N, L, R - 1), L  > R, R > 0 
%	'(' U p(N, L - 1, R) L > 0

p(N,L,L,Col,Col):- L =:= N div 2.
p(N,L,R,Col,Res):-L > R, R1 is R+1,p(N,L,R1,['('|Col],Res).
p(N,L,R,Col,Res):-L<N,L1 is L+1,p(N,L1,R,[')'|Col],Res).
p(N,R):-N1 is N * 2,p(N1,0,0,[],R).
```

`findall()` --> `findall(R,p(3,R),Out)` (find all `R`'s which are solutions to `p(3,R)` and load them in `Out`).


