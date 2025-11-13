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
remove_occ([], _, []).
remove_occ([H|T], H, R) :- !,remove_occ(T, H, R).
remove_occ([H|T], X, [H|R]) :- remove_occ(T, X, R).
```
2.b. Define a predicate to produce a list of pairs (atom n) from an initial list of atoms. In this initial list atom had n occurrences (e.g. numberatom(\[1,2,1,2,1,3,1], X) -> X = \[\[1,4],\[2,2],\[3,1]])
```prolog
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
```prolog
in_set(H, [H|_]) :-!.
in_set(X, [_| T]) :- in_set(X, T).

setunion([], S2, S2).
setunion([H|T], S2, R) :-
    in_set(H, S2), !,
    setunion(T, S2, R).
setunion([H|T], S2, [H|R]):- setunion(T, S2, R).
```
5.b. Write a predicate to determine the set of all the pairs of elements in a list (e.g. \[a,b,c,d] -> \[\[a,b], \[a,c], \[a,d], \[b, c], \[b,d], \[c,d]])
```prolog
% make pairs with X and all elements from Y
make_pair(_, [], []).
make_pair(X, [H|T], [[X,H]|R]):-
    make_pair(X, T, R).

all_pairs([], []).
all_pairs([H|T], R):-
    make_pair(H,T,X),
    all_pairs(T,Y),
    setunion(X,Y,R).
```

6.a. Write a predicate to test if a list is a set 
```prolog
in_set(H, [H|_]) :-!.
in_set(X, [_| T]) :- in_set(X, T).

test_set([]).
test_set([H|T]):-not(in_set(H,T)),test_set(T).
```
6.b. Write a predicate to remove the first three occurrences of an element in a list. If the element occurs less than three times, all occurrences will be removed
```prolog
remove_three(L, _, 0, L).
remove_three([],_, _, []).
remove_three([H|T], H, C, R):-
    C1 is C - 1,
    remove_three(T,H,C1,R),!.
remove_three([H|T],V,C,[H|R]):-
    remove_three(T,V,C,R),!.
remove_three(L,V,R) :- remove_three(L,V,3,R).
```

7.a. Write a predicate to compute the intersection of two sets
```prolog
in_set(H, [H|_]) :-!.
in_set(X, [_| T]) :- in_set(X, T).

set_intersect([],_,[]).
set_intersect([H|T], S2, [H|R]) :-
    in_set(H, S2), !,
    set_intersect(T,S2,R).
set_intersect([_|T], S2, R):-
    set_intersect(T,S2,R).
```
7.b. Write a predicate to create a list (m..n) of all integer numbers from the interval \[m,n]
```prolog
interval_list(M, M, [M]):-!.
interval_list(N, M, [N|R]):-
    N < M, 
    N1 is N + 1,
    interval_list(N1,M,R).
```

8.a. Write a predicate to determine if a list has even numbers of elements without counting the elements from the list
```prolog
even_len([]).
even_len([_,_|T]):-even_len(T).
```
8.b. Write a predicate to delete first occurrence of the minimum number from a list
```prolog
find_min([M],M).
find_min([H|T], R):-
    find_min(T,R),
    H > R, !.
find_min([H|_],H).
    
delete_first([],_,[]).
delete_first([H|T],H,T):-!.
delete_first([H|T], X, [H|R]):-
    delete_first(T, X, R).

delete_first_min(L, R):-
    find_min(L, M),
    delete_first(L, M, R).
```

9.a. Insert an element on the position n in a list 
```prolog
insert_nth([], N, N, V, [V]):-!.
%insert_nth([],_,_,_,[]). -- if position is out of bounds, return false
insert_nth([H|T], N, N, V, [V,H|T]):-!.
insert_nth([H|T], N, C, V, [H|R]):-
    C1 is C + 1,
    insert_nth(T,N,C1,V,R).

insert_nth(L, N, V,R) :- insert_nth(L,N,1,V,R).
```
9.b. Define a predicate to determine the gcd of all numbers from a list
```prolog
gcd(X, 0, X) :-!.
gcd(X, Y, R) :- Z is mod(X,Y), gcd(Y, Z, R).

gcd_list([], 0).
gcd_list([H], H) :-!.
gcd_list([H|T], R):-
    gcd_list(T, R1),
    gcd(H, R1, R).
```

10.a. Define a predicate to test if a list of an integer elements has a valley aspect (a set has a valley aspect if its elements decrease up to a certain point, then they increase)
```prolog
isV([H1,H2|T]):- H1 < H2, inc([H2|T]), !.
isV([H1,H2|T]):- H1 > H2, isV([H2|T]), !.

inc([]).
inc([_]).
inc([H1,H2|T]):- H1 < H2, inc([H2|T]), !.

valley([H1,H2,H3|T]):-H1>H2, isV([H1,H2,H3|T]).
```
10.b calculate the alternate sum of a list's elements (l1 - l2 + l3)
```prolog
alt_sum([],0).
alt_sum([H|T],S):-
    alt_sum(T,S2),
    S is H - S2.
```

11.a. Write a predicate to substitute an element from a list with another element in the list
??? what
11.b. Write a predicate to create the sublist (lm..ln) from the list (l1..lk)
```prolog
sublist([_|T], S, E, C, R):-
    C < S, !, C1 is C + 1,
    sublist(T, S, E, C1, R).
sublist([H|T], S, E, C, [H|R]):-
    S =< C, C =< E, !,
    C1 is C + 1,
    sublist(T, S, E, C1, R).
sublist(_, _, _, _, []).% :- E < C.

sublist(L, S, E, R) :- sublist(L, S, E, 1, R).
```

12.a.Write a predicate to substitute in a list a value with all the elements of another list
```prolog
%unify(L1, L2, R)
unify([],L2,L2).
unify([H|T], L2, [H|R]):-unify(T,L2,R).

%subs(L1,V,L2,R)
subs([], _, _, []).
subs([V|T], V, L2, R):-!,
    subs(T,V,L2,R2),
    unify(L2,R2,R).
subs([H|T],V,L2,[H|R]):- subs(T,V,L2,R).
```
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

1.a. Sort a list with removing the double values (e.g. \[4, 2, 6, 2, 3, 4] --> \[2,3,4,6])
```prolog
%rem_val(L, V, R)
rem_val([], _, []).
rem_val([V|T], V, R) :-!, rem_val(T, V, R).
rem_val([H|T], V, [H|R]):- rem_val(T,V,R).

%find_min(L, M)
find_min([M], M).
find_min([H|T], M):-
    find_min(T, M),
    M < H, !.
find_min([H|_], H).

sort_no_dup([],[]).
sort_no_dup(L, [M|R]):-
    find_min(L, M),
    rem_val(L, M, R1),
    sort_no_dup(R1,R), !.
```
1.b. For a heterogeneous list, formed from integer numbers and lists of numbers, write a predicate to sort every sublist with removing the doubles. (e.g. \[1,2,\[4,1,4],3,6,\[7,10,1,3,9],5,\[1,1,1],7] -->\[1,2,\[1,4],3,6,\[1,3,7,9,10],5,\[1],7])
```prolog
sort_no_dup_het([],[]).
sort_no_dup_het([H|T], [H|R]):-
    number(H), !,
    sort_no_dup_het(T,R).
sort_no_dup_het([H|T], [S|R]):-
    sort_no_dup(H, S),
    sort_no_dup_het(T,R).
```

2.a Sort a list with keeping double values in the result
```prolog
find_min([M], M).
find_min([H|T], M):-
    find_min(T, M),
    M < H, !.
find_min([H|_], H).

%rem_first_occ(L, E, R)
rem_first_occ([], _, []).
rem_first_occ([H|T], H, T):-!.
rem_first_occ([H|T], E, [H|R]):-rem_first_occ(T,E,R).

%sort_dup(L, R)
sort_dup([],[]):-!.
sort_dup(L, [M|R]):-
    find_min(L, M),
    rem_first_occ(L, M, R1),
    sort_dup(R1, R), !.
```
2.b. For a heterogeneous list, formed from integer numbers and lists of numbers, write a predicate to sort every sublist, keeping the doubles 
```prolog
%sort_dup_het(L, R)
sort_dup_het([],[]):-!.
sort_dup_het([H|T], [H|R]):-
    number(H), !,
    sort_dup_het(T,R).
sort_dup_het([H|T], [S|R]):-
    sort_dup(H, S),
    sort_dup_het(T,R).
```

3.a. Merge two sorted lists with removing the double values 
```prolog
% assuming L1 and L2 are sorted
merge_nodup([], L2, L2):-!.
merge_nodup(L1, [], L1):-!.
% make sure to also remove the duplicates within the sorted lists
merge_nodup([H,H|T], L, R):-!, merge_nodup([H|T], L, R).
merge_nodup(L, [H,H|T], R):-!,merge_nodup(L,[H|T], R).
merge_nodup([H|T1], [H|T2], R):-!, merge_nodup([H|T1], T2, R).
merge_nodup([H1|T1], [H2|T2], [H1|R]):- 
    H1 < H2, !, 
    merge_nodup(T1, [H2|T2], R).
merge_nodup(L, [H|T], [H|R]):-
    merge_nodup(L, T, R).
```
3.b. For a heterogeneous list, formed from integer numbers and lists of numbers, merge all sublists with removing the double values (e.g. \[1,\[2,3],4,5,\[1,4,6],3,\[1,3,7,9,10],5,\[1,1,11],8] --> \[1,2,3,4,6,7,9,10,11])
```prolog
merge_het([],[]).
merge_het([H|T], R):-
    number(H), !,
    merge_het(T,R).
merge_het([H|T], R):-
    merge_het(T, R1),
    merge_nodup(H, R1, R).
```

4.a. Write a predicate to determine the sum of two numbers written in list representation
```prolog
rev([], Col, Col).
rev([H|T], Col, Res):-rev(T, [H|Col], Res).
rev(L, R):- rev(L, [], R).

inc_lr([], [1]).
inc_lr([9|T], [0|R]):-!, inc_lr(T, R).
inc_lr([H|T], [H2|T]):- H2 is H + 1.

%addlr(L1,L2,Carry,Res)
addlr([],[],0, []).
addlr([],[],1,[1]).
addlr([], L, 0, L).
addlr(L,[],0,L).
addlr(L, [], 1, R):-inc_lr(L, R).
addlr([],L,1,R):-inc_lr(L,R).
addlr([H1|T1], [H2|T2], Carry, [S|R]):-
    S is H1 + H2 + Carry,
    S < 10, !,
    addlr(T1, T2, 0, R).
addlr([H1|T1], [H2|T2], Carry, [S|R]):-
    S is mod(H1 + H2 + Carry, 10),
    addlr(T1,T2, 1, R).

addlr(L1,L2,R):-addlr(L1,L2,0,R).

addl(L1, L2, R):-
    rev(L1, RL1),
    rev(L2, RL2),
    addlr(RL1, RL2, R2),
    rev(R2, R), !.
```
4.b. For a heterogeneous list, formed from integer numbers and lists of digits, write a predicate to compute the sum of all numbers represented as sublists 
```prolog
add_het([], [0]).
add_het([H|T], R):-
    number(H), !,
    add_het(T,R).
add_het([H|T], R):-
    add_het(T, R1),
    addl(H, R1, R).
```


5.a. Substitute all occurrences of an element of a list with all the elements of another list (already done)
```prolog
%unify(L1, L2, R)
unify([],L2,L2).
unify([H|T], L2, [H|R]):-unify(T,L2,R).

%subs(L1,V,L2,R)
subs([], _, _, []).
subs([V|T], V, L2, R):-!,
    subs(T,V,L2,R2),
    unify(L2,R2,R).
subs([H|T],V,L2,[H|R]):- subs(T,V,L2,R).

```
5.b. For a heterogeneous list, formed from integer numbers and lists of numbers, replace in every sublist all occurrences of the first element from the sublist with a new given list (e.g. \[1,\[4,1,4],3,6,\[7,10,1,3,9],5,\[1,1,1],7] and \[11,11] --> \[1,\[11,11,1,11,11],3,6,\[11,11,10,1,3,9],5,\[11,11,11,11,11,11],7])
```prolog
sub_first([H|T], L2, R):-
    subs([H|T], H, L2, R).

%subs_het(L, L2, R).
subs_het([], _, []).
subs_het([H|T], L2, [H|R]):-
    number(H), !,
    subs_het(T, L2, R).
subs_het([H|T], L2, [S|R]):-
    sub_first(H, L2, S),
    subs_het(T, L2, R).
```

6.a. Determine the product of a number represented as digits in a list and a number
```prolog
rev([], Col, Col).
rev([H|T], Col, R):-rev(T, [H|Col], R).
rev(L, R) :- rev(L, [], R).

%prod_revl(L, Mult, Carry, R)
prod_revl([], _, 0, []):- !.
prod_revl([], _, Carry, [Carry]).
prod_revl([H|T], Mult, Carry, [M|R]):-
    M is mod(H * Mult + Carry, 10),
    C2 is div(H * Mult + Carry, 10),
    prod_revl(T, Mult, C2, R).
prod_revl(L, Mult, R) :- prod_revl(L, Mult, 0, R).

prodl(L, Mult, R):-
    rev(L, LRev),
    prod_revl(LRev, Mult, R1),
    rev(R1, R).
```
6.b. For a heterogeneous list, formed from integer numbers and lists of numbers, write a predicate to replace every sublist with a list of the positions of the maximum element from that sublist (solution below - 7)

7.a. Determine the positions of the maximal element of a linear list 
```prolog
find_max([M], M).
find_max([H|T], M):-
    find_max(T, M),
    H < M, !.
find_max([H|_], H).

%get_pos(L, V, C, R)
get_pos([], _, _, []).
get_pos([V|T], V, C, [C|R]):-!,
    C1 is C + 1,
    get_pos(T, V, C1, R).
get_pos([_|T], V, C, R):-
    C1 is C + 1,
    get_pos(T, V, C1, R).
get_pos(L, V, R) :- get_pos(L, V, 1, R).

get_pos_max(L, R):-
    find_max(L, M),
    get_pos(L, M, R).
```
7.b. For a heterogeneous list, formed from integer numbers and lists of numbers, replace every sublist with the positions of the maximum element from that sublist 
```prolog
repl_het([],[]).
repl_het([H|T], [H|R]):-
    number(H), !,
    repl_het(T, R).
repl_het([H|T], [S|R]):-
    get_pos_max(H,S),
    repl_het(T,R).
```

8.a. Determine the successor of a number represented as digits in a list
8.b. For a heterogeneous list, formed from integer numbers and lists of digits, determine the successors of the sublists 

9.a. For a list of integer numbers, write a predicate to add a given value in the list after the 1st, 3rd, 7th and 15th elements (so on positions that are powers of 2 greater than 1)
9.b. For a heterogeneous list, formed from integer numbers and lists of numbers, add in every sublist after the 1st, 3rd, 7th and 15th element the value found before the sublist in the heterogeneous list (the list always starts with a number and there aren't two consecutive list elements)

10.a. For a list of integer numbers, define a predicate to write every prime number twice in the list 
10.b. For a heterogeneous list, formed from integer numbers and lists of numbers, define a predicate to write in every sublist every prime number twice

11.a. Replace all occurrences of an element from a list with another element e
11.b. For a heterogeneous list, formed from integer numbers and lists of numbers, define a predicate to determine the second greatest number of the list, and then to replace this value in each sublist with the maximum value of the sublist

12.a. Define a predicate to add the divisors of a number after every element 
12.b. For a heterogeneous list, formed from integer numbers and lists of numbers, define a predicate to add the divisors of every element in every sublist (e.g. \[1,\[1,2,5,7],4,5,\[1,4,6],2] --> \[1,\[1,2,5,7], 4,5, \[1,4,2,6,2,3],2])

13.a. Given a linear numerical list, write a predicate to remove all sequences of consecutive values (e.g. \[1,2,4,6,7,8,10] --> \[4,10])
13.b. Apply a on the sublists of a heterogeneous list 

14.a. Define a predicate to determine the longest sequences of consecutive even numbers (if more exist, return one of them only)
14.b. Replace every sublist in a heterogeneous list as stated in a.

15.a. Define a predicate to determine the predecessor of a number represented as digits in a list
15.b. Replace every sublist in a heterogeneous list with its predecessor
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