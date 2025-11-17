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