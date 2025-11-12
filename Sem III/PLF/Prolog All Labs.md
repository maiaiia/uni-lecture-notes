# Prolog All Labs
___
Class: [[PLF]]
Type: 
Tags: # 
Date: November 12th, 2025
___

## Lab 1 
1.a. Write a predicate to determine the lowest common multiple of a list formed from integer numbers 

```prolog
gcd(X, 0, X) :-!.
gcd(X, Y, R) :- Z is mod(X,Y), gcd(Y, Z, R).

lcm(X, Y, R):-
    gcd(X, Y, D),
    R is X * Y / D.
```

1.b. Write a predicate to add a value v after 1st, 2nd, 4th, 8th element in a list
```prolog
add_pw2([], _, _, []).
add_pw2([H|T], V, C, [H,V|R]) :- check_pw2(C), !, C1 is C + 1, add_pw2(T, V, C1, R).
add_pw2([H|T], V, C, [H|R]) :- C1 is C + 1, add_pw2(T, V, C1, R).
    
add_pw2(L, V, R) :- 
    add_pw2(L, V, 1, R).
```

2.a. Write a predicate to remove all occurrences of a certain atom from a list
```prolog

```

2.b. Define a predicate to produce a list of pairs (atom n) from an initial list of atoms. In this initial list atom had n occurrences (e.g. numberatom(\[1,2,1,2,1,3,1], X) -> X = \[\[1,4],\[2,2],\[3,1]])

## Lab 2 


## Lab 3

15. For a given n, positive, determine all decompositions of n as a sum of consecutive natural numbers.
```prolog
inbtw(X, Y, X) :- X < Y+1.
inbtw(X, Y, R) :- X < Y, inbtw(X+1, Y, R).

consec_sum(N, N, [N]).
consec_sum(N, S, [S|R]) :- N > S, N1 is N - S, S1 is S + 1, consec_sum(N1, S1, R).

decomp(N, R):-
    between(1, N, S),
    consec_sum(N, S, R).
```