# CHEAT_SHEET_PROLOG
___
Class: [[PLF]]
Type: Cheat Sheet
___

|     Symbol      | Use                                                                                                                                                                             |
| :-------------: | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
|       =:=       | Arithmetic Equal                                                                                                                                                                |
|       is        | - Numeric Assignment (for unbounded variables)<br>- Numeric Comparison (for bounded variables)                                                                                  |
|        =        | String / List Assignment                                                                                                                                                        |
|    `is_list`    | Check if something is a list                                                                                                                                                    |
|    `number`     | Check if something is a number                                                                                                                                                  |
|     `atom`      | Check if something is an atom                                                                                                                                                   |
|     `trace`     | See step by step execution                                                                                                                                                      |
|       `!`       | Used for pruning (if everything before `!` is true, stop backtracking to a different branch)                                                                                    |
|     \[H\|T]     | Split a list into the first element and the rest of the list (T can be empty)                                                                                                   |
| `\+` or `not()` | Negate a predicate                                                                                                                                                              |
|    `findall`    | - Find all the solutions of a predicate (great for backtracking)<br>- e.g. `findall(R, p(3,R), Out)` will find all `R`'s that are solutions of `p(3,R)` and store them in `Out` |

The **flow model** of a predicate is used to indicate how said predicate is intended to be called; `i` denotes an input variable and `o` denotes an output.

**Wrappers** are useful for hiding the implementation of a predicate, initialising certain variables with default values upon the first call and generally making things cleaner.

## Tips
- Doing something like `p(X+1)` is generally a bad idea
	- `X+1` is not properly evaluated and if X is, say, 1, `p(1+1)` will be called (instead of `p(2)`, as any sane individual would expect). Prolog is disgusting.
	- do this instead: `X1 is X + 1, p(X1)` (this works because `is` forces arithmetic evaluation)
	- this mistake has wasted so much of my time 
- Less or equal is =< for no reason other than to be annoying
## Examples

### [[Prolog All Labs]]
### Reversing a list
This is a good example of how accumulators and wrappers are used 
```prolog
% rev(l1..ln) =  
%     [], if n == 0
%     rev(l2..ln) U [l1] otherwise
% rev(i, o) --> flow model

rev([], Acc, Acc).
rev([H|T], Acc, R):- rev(T, [H|Acc], R).
rev(L, R) :- rev(L, [], R). %wrapper
```

### Sorting a list
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

### Set Intersection
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

### Set Union
```prolog
in_set(H, [H|_]) :-!.
in_set(X, [_| T]) :- in_set(X, T).

setunion([], S2, S2).
setunion([H|T], S2, R) :-
    in_set(H, S2), !,
    setunion(T, S2, R).
setunion([H|T], S2, [H|R]):- setunion(T, S2, R).
```

### Set Difference
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

### Merging 2 sorted lists and removing duplicates
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

BONUS: merge all the sublists of a heterogeneous list
```prolog
merge_het([],[]).
merge_het([H|T], R):-
    number(H), !,
    merge_het(T,R).
merge_het([H|T], R):-
    merge_het(T, R1),
    merge_nodup(H, R1, R).
```