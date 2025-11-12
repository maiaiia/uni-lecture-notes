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
2.b. Define a predicate to produce a list of pairs (atom n) from an initial list of atoms. In this initial list atom had n occurrences (e.g. numberatom(\[1,2,1,2,1,3,1], X) -> X = \[\[1,4],\[2,2],\[3,1]])
```prolog
remove_occ([], _, []).
remove_occ([H|T], H, R) :- !,remove_occ(T, H, R).
remove_occ([H|T], X, [H|R]) :- remove_occ(T, X, R).

count_occ([], _, 0).
count_occ([H|T], H, C) :- !, count_occ(T, H, C1), C is C1 + 1.
count_occ([_|T], X, C) :- count_occ(T, X, C).

number_atom([], []).
number_atom([H|T], [[H, C1]|X]):-
    count_occ(T, H, C),
    C1 is C + 1,
    remove_occ(T, H, R),
    number_atom(R, X).
```

3.a. Define a predicate to remove from a list all repetitive elements
```prolog
count_occ([], _, 0).
count_occ([H|T], H, C) :- !, count_occ(T, H, C1), C is C1 + 1.
count_occ([_|T], X, C) :- count_occ(T, X, C).

remove_occ([], _, []).
remove_occ([H|T], H, R) :- !,remove_occ(T, H, R).
remove_occ([H|T], X, [H|R]) :- remove_occ(T, X, R).

remove_repetitive([], []).
remove_repetitive([H|T], R):-
    count_occ(T, H, C), C > 0, !,
    remove_occ(T, H, R1),
    remove_repetitive(R1, R).
remove_repetitive([H|T], [H|R]):-
    remove_repetitive(T, R).
```
3.b. Remove all occurrence of a maximum value from a list of integer numbers
```prolog
find_max([], 0).
find_max([N], N).
find_max([H|T], R):-
    find_max(T, R),
    H < R, !.
find_max([H|_], H).

remove_occ([], _, []).
remove_occ([H|T], H, R) :- !,remove_occ(T, H, R).
remove_occ([H|T], X, [H|R]) :- remove_occ(T, X, R).

remove_max(L, R):-
    find_max(L, M),
    remove_occ(L, M, R).
```

4.a. Write a predicate to determine the difference of two sets
```prolog
in_set([H|_], H) :-!.
in_set([_|T], X) :- in_set(T, X).

set_dif([], _, []).
set_dif([H|T], S2, R):-
    in_set(S2, H), !,
    set_dif(T, S2, R).
set_dif([H|T], S2, [H|R]) :-
    set_dif(T, S2, R).
```
4.b. Write a predicate to add value 1 after every element from a list
```prolog
add_1([], []).
add_1([H|T], [H, 1|R]) :- add_1(T, R).
```

5.a. Write a predicate to compute the union of two sets.
5.b. Write a predicate to determine the set of all the pairs of elements in a list (e.g. \[a,b,c,d] -> \[\[a,b], \[a,c], \[a,d], \[b, c], \[b,d], \[c,d]])

6.a. Write a predicate to test if a list is a set 
6.b. Write a predicate to remove the first three occurrences of an element in a list. If the element occurs less than three times, all occurrences will be removed

7.a. Write a predicate to compute the intersection of two sets
7.b. Write a predicate to create a list (m..n) of all integer numbers from the interval \[m,n]

8.a. Write a predicate to determine if a list has even numbers of elements without counting the elements from the list
8.b. Write a predicate to delete first occurrence of the minimum number from a list

9.a. Insert an element on the position n in a list 
9.b. Define a predicate to determine the gcd of all numbers from a list

10.a. Define a predicate to test if a list of an integer elements has a valley aspect (a set has a valley aspect if its elements decrease up to a certain point, then they increase)
10.b calculate the alternate sum of a list's elements (l1 - l2 + l3)

11.a. Write a predicate to substitute an element from a list with another element in the list
11.b. Write a predicate to create the sublist (lm..ln) from the list (l1..lk)

12.a.Write a predicate to substitute in a list a value with all the elements of another list
12.b. Remove the n-th element of a list
```prolog
remove_nth([_|T], 1, T):-!.
remove_nth([H|T], C, [H|R]):-
    C1 is C - 1,
    remove_nth(T, C1, R).
```

13.a. Transform a list in a set, in the order of the last occurrences of elements (e.g. \[1,2,3,1,2] is transformed in \[3,2,1])
```prolog
in_set([H|_], H) :-!.
in_set([_|T], X) :- in_set(T, X).

setify([], []).
setify([H|T], R):-
    in_set(T, H), !,
    setify(T, R).
setify([H|T], [H|R]):-
    setify(T,R).
```
13.b. Define a predicate to determine the gcd of all numbers in a list
```prolog
gcd(X, 0, X) :-!.
gcd(X, Y, R) :- Z is mod(X,Y), gcd(Y, Z, R).

gcd_list([], 0).
gcd_list([H], H) :-!.
gcd_list([H|T], R):-
    gcd_list(T, R1),
    gcd(H, R1, R).
```

14.a. Write a predicate to test equality of two sets without using the set difference
```prolog
in_set([H|_], H) :-!.
in_set([_|T], X) :- in_set(T, X).

% test if S1 included in S2
set_incl([], _).
set_incl([H|T], S2):-
    in_set(S2, H),
    set_incl(T, S2).
   
set_eq(S1, S2):- 
    set_incl(S1, S2), 
    set_incl(S2, S1).
```
14.b. Write a predicate to select the nth element of a given list 
```prolog
select_nth([H|_], 1, H).
select_nth([_|T], C, R):-
    C1 is C - 1,
    select_nth(T, C1, R).

```

15.a. Write a predicate to transform a list in a set, considering the fist occurrence 
```prolog
remove_occ([], _, []).
remove_occ([H|T], H, R) :- !,remove_occ(T, H, R).
remove_occ([H|T], X, [H|R]) :- remove_occ(T, X, R).

setify([], []).
setify([H|T], [H|R]):-
    remove_occ(T, H, N),
    setify(N, R).
```
15.b. Write a predicate to decompose a list in a list respecting the following: \[list of even numbers, list of odd numbers] and also return the number of even and the number of odd numbers
```prolog
sep_odd_ev([],[],[],0,0).
sep_odd_ev([H|T], [H|E], O, CE, CO):-
    mod(H, 2) =:= 0, !,
    sep_odd_ev(T, E, O, CE1, CO),
    CE is CE1 + 1.
sep_odd_ev([H|T], E, [H|O], CE, CO):-
    sep_odd_ev(T, E, O, CE, CO1),
    CO is CO1 + 1.
```

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