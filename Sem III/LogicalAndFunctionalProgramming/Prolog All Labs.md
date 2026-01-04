# Prolog All Labs
___
Class: [[LogicalAndFunctionalProgramming]]
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
```prolog
revl([], Col, Col):-!.
revl([H|T], Col, R):-revl(T, [H|Col], R).
revl(L, R):- revl(L, [], R).

%inc_l(L, R)
inc_l([], 1, [1]):-!.
inc_l(L, 0, L):-!.
inc_l([H|T], 1, [H2|R]):-
    H2 is mod(H + 1, 10),
    Carry is div(H + 1, 10),
    inc_l(T, Carry, R).
inc_l(L, R) :- inc_l(L, 1, R).

successor(L,R):-
    revl(L, L1),
    inc_l(L1, R1),
    revl(R1, R).
```
8.b. For a heterogeneous list, formed from integer numbers and lists of digits, determine the successors of the sublists 
```prolog
inc_het([], []).
inc_het([H|T], [H|R]):-
    number(H), !,
    inc_het(T, R).
inc_het([H|T], [S|R]):-
    successor(H, S),
    inc_het(T,R).
```

9.a. For a list of integer numbers, write a predicate to add a given value in the list after the 1st, 3rd, 7th and 15th elements (so on positions that are powers of 2 greater than 1)
```prolog
is_pw2(2):-!. %exclude 1 for the purpose of this ex
is_pw2(V):-
    0 =:= mod(V, 2),
    NV is div(V, 2),
    is_pw2(NV).

%append_pw2(L, V, Curr, R).
append_pw2(L, _, Curr, L) :- Curr > 16, !.
append_pw2([], _, _, []).
append_pw2([H|T], V,Curr, [V,H |R]):-
    is_pw2(Curr), !,
    C is Curr + 1,
    append_pw2(T, V, C, R).
append_pw2([H|T], V, Curr, [H|R]):-
    C is Curr + 1,
    append_pw2(T, V, C, R).

append_pw2(L,V, R) :- append_pw2(L,V, 1, R).
```
9.b. For a heterogeneous list, formed from integer numbers and lists of numbers, add in every sublist after the 1st, 3rd, 7th and 15th element the value found before the sublist in the heterogeneous list (the list always starts with a number and there aren't two consecutive list elements)
```prolog
% append_het(L, Prev, R)
append_het([], _, []).
append_het([H|T], _, [H|R]):-
    number(H), !,
    P is H,
    append_het(T, P, R).
append_het([H|T], Prev, [S|R]):-
    append_pw2(H, Prev, S),
    append_het(T, Prev, R).

append_het(L, R) :- append_het(L, -1, R).
```

10.a. For a list of integer numbers, define a predicate to write every prime number twice in the list 
```prolog
divisible(X, Y):- 0 is mod(X, Y).

iter_div(1,_):-!.
iter_div(X, S):-
    X > S,
    divisible(X, S), !.
iter_div(X, S):-
    X > S,
    S2 is S + 1,
    iter_div(X, S2).
iter_div(X) :- iter_div(X, 2).


prime(2):- !.
prime(X) :- not(iter_div(X)).

duplicate_primes([],[]).
duplicate_primes([H|T], [H, H|R]):-
    prime(H), !,
    duplicate_primes(T, R).
duplicate_primes([H|T], [H|R]):-
    duplicate_primes(T,R).
```
10.b. For a heterogeneous list, formed from integer numbers and lists of numbers, define a predicate to write in every sublist every prime number twice
```prolog
dup_het([],[]).
dup_het([H|T], [H|R]):-
    number(H), !,
    dup_het(T,R).
dup_het([H|T], [S|R]):-
    duplicate_primes(H,S),
    dup_het(T,R).
```

11.a. Replace all occurrences of an element from a list with another element e
```prolog
%repl(L, Old, New, R)
repl([],_,_,[]).
repl([Old|T], Old, New, [New|R]):-!,
    repl(T, Old, New, R).
repl([H|T], Old, New, [H|R]):-
    repl(T, Old, New, R).
```
11.b. For a heterogeneous list, formed from integer numbers and lists of numbers, define a predicate to determine the second greatest number of the list, and then to replace this value in each sublist with the maximum value of the sublist
```prolog
find_max([M], M).
find_max([H|T], M):-
    find_max(T, M),
    M > H, !.
find_max([H|_], H).

find_max_het([],0).
find_max_het([H|T], M):-
    not(number(H)), !,
    find_max_het(T, M).
find_max_het([H|T], M):-
    find_max_het(T, M),
    M > H, !.
find_max_het([H|_], H).

proc_het([], _, []).
proc_het([H|T], M, [H|R]):-
    number(H), !,
    proc_het(T, M, R).
proc_het([H|T], M, [S|R]):-
    find_max(H, V),
    repl(H, M, V, S),
    proc_het(T, M, R).

proc_het(L, R):-
    find_max_het(L, M),
    proc_het(L, M, R).
```

12.a. Define a predicate to add the divisors of a number after every element 
```prolog
is_divisor(X, Y) :- 0 is mod(X, Y).

get_divisors(1, _, []):-!.
get_divisors(X, X, []):-!.
get_divisors(X, Y, [Y|R]):-
    is_divisor(X, Y), !,
    Y1 is Y + 1,
    get_divisors(X, Y1, R).
get_divisors(X, Y, R):- 
    Y1 is Y + 1,
    get_divisors(X, Y1, R).

get_divisors(X, R):- get_divisors(X, 2, R).


%append_list(L1, L2, R)
append_list([], L2, L2):-!.
append_list([H|T], L2, [H|R]):-
    append_list(T, L2, R).

append_divisors([], []) :-!.
append_divisors([H|T], R):-
    get_divisors(H, D),
    append_list([H], D, Dv),
    append_divisors(T, R1),
    append_list(Dv, R1, R).
```
12.b. For a heterogeneous list, formed from integer numbers and lists of numbers, define a predicate to add the divisors of every element in every sublist (e.g. \[1,\[1,2,5,7],4,5,\[1,4,6],2] --> \[1,\[1,2,5,7], 4,5, \[1,4,2,6,2,3],2])
```prolog
app_div_het([], []).
app_div_het([H|T], [H|R]):-
    number(H), !,
    app_div_het(T, R).
app_div_het([H|T], [S|R]):-
    append_divisors(H, S),
    app_div_het(T, R).
```

13.a. Given a linear numerical list, write a predicate to remove all sequences of consecutive values (e.g. \[1,2,4,6,7,8,10] --> \[4,10])
```prolog
%rem_consec(list, remove_current_flag, result)
rem_consec([], _, []):-!.
rem_consec([E], 0, [E]):-!.
rem_consec([_], 1, []):-!.
rem_consec([H1, H2|T], 1, R):-
    H1_inc is H1 + 1,
    H2 =:= H1_inc, % H2 must also be removed
    rem_consec([H2|T], 1, R), !.
rem_consec([_, H2 | T], 1, R):-
    rem_consec([H2|T], 0, R). % H2 doesn't have to be removed
rem_consec([H1, H2|T], 0, R):-
    H1_inc is H1 + 1,
    H2 =:= H1_inc,  % new consecutive seq discovered
    rem_consec([H2|T], 1, R), !.
rem_consec([H1, H2|T], 0, [H1|R]):-
    rem_consec([H2|T], 0, R).

rem_consec(L, R):- rem_consec(L, 0, R).
```
13.b. Apply a on the sublists of a heterogeneous list 
```prolog
rem_consec_het([], []):-!.
rem_consec_het([H|T], [H|R]):-
    number(H), !,
    rem_consec_het(T, R).
rem_consec_het([H|T], [S|R]):-
    rem_consec(H, S),
    rem_consec_het(T, R).
```

14.a. Define a predicate to determine the longest sequences of consecutive even numbers (if more exist, return only one of them)
```prolog
rev([], Acc, Acc):-!.
rev([H|T], Acc, R):- rev(T, [H|Acc], R).
rev(L, R):- rev(L, [], R).

% helper
update_acc(Curr, CL, _, ML, Curr, CL):-
    CL > ML, !.
update_acc(_, _, Acc_Max, ML, Acc_Max, ML).

%max_even_consec(L, Acc_Curr, CL, Acc_Max, ML, R)

% stop if the list is empty
max_even_consec([], _, _, Acc_Max, _, Acc_Max):-!.

% if the current head of the list is odd, skip it
max_even_consec([H|T], _, _, Acc_Max, ML, R):-
    1 is mod(H, 2), !,
    max_even_consec(T, [], 0, Acc_Max, ML, R).

% now it's guaranteed that the head of the list is even
% if Acc_Curr is empty, add the head to the list
max_even_consec([H|T], [], 0, Acc_Max, ML, R):-
    update_acc([H], 1, Acc_Max, ML, Acc2, ML2),
    max_even_consec([H|T], [H], 1, Acc2, ML2, R).

% list has over 2 elements
max_even_consec([H1, H2 | T], Curr, CL, Acc_Max, ML, R):-
    H1_inc is H1 + 2,
    H2 is H1_inc, !, % curr can be updated
    CL2 is CL + 1,
    update_acc([H2|Curr], CL2, Acc_Max, ML, Acc_New, ML_New),
    max_even_consec([H2|T], [H2 | Curr], CL2, Acc_New, ML_New, R).
max_even_consec([_|T], _, _, Acc_Max, ML, R):-
    max_even_consec(T, [], 0, Acc_Max, ML, R).

max_even_consec(L, R) :- 
    max_even_consec(L, [], 0, [], 0, R_rev),
    rev(R_rev, R), !.
```
14.b. Replace every sublist in a heterogeneous list with the longest subsequence of even numbers from that sublist.
```prolog
repl_het([], []).
repl_het([H|T], [H|R]):-
    number(H), !,
    repl_het(T, R).
repl_het([H|T], [S|R]):-
    max_even_consec(H,S),
    repl_het(T,R).
```

15.a. Define a predicate to determine the predecessor of a number represented as digits in a list
```prolog
rev([], Acc, Acc):-!.
rev([H|T], Acc, R):- rev(T, [H|Acc], R).
rev(L, R):- rev(L, [], R).

pred_rev([0|T], [9|R]):-!,
    pred_rev(T, R).
pred_rev([H|T], [H_dec|T]):-
    H_dec is H - 1.

rem_leading_0([0|T], R):-!, rem_leading_0(T, R).
rem_leading_0([H|T], [H|T]).

predecessor([1], [0]):-!.
predecessor(L, R):-
    rev(L, L_rev),
    pred_rev(L_rev, R_rev),
    rev(R_rev, R_unprocessed),
	rem_leading_0(R_unprocessed, R).
```
15.b. Replace every sublist in a heterogeneous list with its predecessor
```prolog
repl_het_predecessor([],[]).
repl_het_predecessor([H|T], [H|R]):-
    number(H), !,
    repl_het_predecessor(T, R).
repl_het_predecessor([H|T], [P|R]):-
    predecessor(H, P),
    repl_het_predecessor(T, R).
```
## Lab 3 - Backtracking
- Write a predicate to generate the list of all subsets with all elements of a given list.
```prolog
% subsets(l1..ln) = 
% 	emptyset, n = 0
% 	l1 U subsets(l2..ln)
%	subsets(l2..ln)

subsets([], []).
subsets([H|T], [H|R]) :- subsets(T, R).
subsets([_|T], R) :- subsets(T, R).

allSubsets(L, S):-
    findall(R, subsets(L, R), S).
```
- A set of n points in a plan (represented using its coordinates) are given. Write a predicate to determine all subsets of collinear points.
```prolog

```
- The list a1... an is given. Write a predicate to determine all sublists strictly ascending of this list a. 
```prolog
% rev (l1..ln) = 
% 	empty set, n = 0 
%	rev(l2..ln) U l1 otherwise
rev([], Acc, Acc).
rev([H|T], Acc, R) :- rev(T, [H|Acc], R).
rev(L, R) :- rev(L, [], R).

% asc_subl(l1..ln, c1..ck) = 
%	c1..ck, n = 0
%	asc_subl(l2..ln, l1 U c1..ck), l1 > c1
% 	asc_subl(l2..ln, c1..ck)
asc_subl([], [E|Acc], R):- rev([E|Acc], R).
asc_subl([H|T], [], R):- asc_subl(T, [H], R).
asc_subl([H|T], [F|Acc], R):-
    H > F,
    asc_subl(T, [H, F | Acc], R).
asc_subl([_|T], Acc, R):- asc_subl(T, Acc, R).
asc_subl(L, R) :- asc_subl(L, [], R).

all_asc(L, S):-
    findall(R, asc_subl(L, R), S).
```
- Two integers, n and m are given. Write a predicate to determine all possible sequences of numbers from 1 to n, such that between any two numbers from consecutive positions, the absolute difference is., >= m. 
```prolog

```
- Generate the list of all arrangements of K elements of a given list. (Eg: \[2, 3, 4] K=2 => \[\[2,3], \[3,2], \[2,4], \[4,2], \[3,4], \[4,3]] (not necessary in this order)) 
```prolog

```
- A player wants to choose the predictions for 4 games. The predictions can be 1, X, 2. Write a predicate to generate all possible variants considering that: last prediction can’t be 2 and no more than two possible predictions X. 
```prolog

```
- Generate all strings of n parentheses correctly closed. 
```prolog

```
- Generate all permutation of N (N - given) respecting the property: for every 2<=i<=n exists an 1<=j<=i, so |v(i)-v(j)|=1. 
```prolog

```
- For a list a1... an with integer and distinct numbers, define a predicate to determine all subsets with sum of elements divisible with n. 
```prolog

```
- “Colouring” a map. n countries are given; write a predicate to determine all possibilities of colouring n countries with m colours, such that two adjacent countries not having the same colour. 
```prolog

```
- Generate all sub-strings of a length 2\*n+1, formed from values of 0, 1 or -1, so a1 = ..., a2n+1 = 0 and |a(i+1) - ai| = 1 or 2, for every 1 <= i <= 2n. (*in other words just don't have two adjacent numbers that are equal)*
```prolog
seq(-1).
seq(0).
seq(1).

%func(N, Acc, R)
func(0, Acc, Acc):-!.
func(N, [H|Acc], R):-
    not(H = 0),
    N1 is N - 1,
    func(N1, [0, H|Acc], R).
func(N, [H|Acc], R):-
    not(H = 1),
    N1 is N -1,
    func(N1, [1, H|Acc], R).
func(N, [H|Acc], R):-
    not(H = -1),
    N1 is N -1,
    func(N1, [-1, H|Acc], R).

helper(N, R):-
    seq(S),
    N1 is 2 * N,
	func(N1, [S], R).

getSubstr(N, S):-
    findall(R, helper(N, R), S).
```
- The list a1, ..., an is given and it consists of distinct integers. Write a predicate to determine all subsets with aspect of "mountain" (a set has a "mountain" aspect if the elements increase to a certain point and then decrease). 
```prolog

```
- Write a program to generate the list of all subsets of sum S with the elements of a list (S - given). (assuming strictly positive values)
```prolog
% sums(l1..ln, S, a1..ak) = 
%	l1 U a1..ak, S = l1 
%	sums(l2..ln, S - l1, l1 U a1..ak), S > l1
%	sums(l2..ln, S, a1..ak)

sums(_, 0, Acc, Acc).
sums([S|_], S, Acc, [S|Acc]).
sums([H|T], S, Acc, R) :- H < S, S1 is S - H, 
    sums(T, S1, [H|Acc], R).
sums([_|T], S, Acc, R) :- sums(T, S, Acc, R).
sums(L, S, R) :- sums(L, S, [], R).

allSubsetsSumS(L, S, R):-
    findall(T, sums(L, S, T), R).
```
- For a given n, positive, determine all decompositions of n as a sum of consecutive natural numbers.
```prolog
inbtw(X, Y, X) :- X =< Y.
inbtw(X, Y, R) :- X < Y, inbtw(X+1, Y, R).

consec_sum(N, N, [N]).
consec_sum(N, S, [S|R]) :- N > S, N1 is N - S, S1 is S + 1, consec_sum(N1, S1, R).

decomp(N, R):-
    StartCap is div(N, 2),
    between(1, StartCap, S),
    consec_sum(N, S, R).

find_all_decomp(N, S):-
    findall(R, decomp(N, R), S).
```