# CHEAT_SHEET_PROLOG
___
Class: [[PLF]]
Type: Cheat Sheet
___

|     Symbol      | Use                                                                                                                                                                            |
| :-------------: | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
|       =:=       | Arithmetic Equal                                                                                                                                                               |
|       is        | - Numeric Assignment (for unbounded variables)<br>- Numeric Comparison (for bounded variables)                                                                                 |
|        =        | String / Vector Assignment                                                                                                                                                     |
|    `is_list`    | Check if something is a list                                                                                                                                                   |
|    `number`     | Check if something is a number                                                                                                                                                 |
|     `atom`      | Check if something is an atom                                                                                                                                                  |
|     `trace`     | See step by step execution                                                                                                                                                     |
|       `!`       | Used for pruning (if everything in a clause before the `!` operator is evaluated as true, stop backtracking to a different branch)                                             |
|     \[H\|T]     | Split a list into the first element and the rest of the list (T can be empty)                                                                                                  |
| `\+` or `not()` | Negate a predicate                                                                                                                                                             |
|    `findall`    | - Find all the solutions of a predicate (great for backtracking)<br>- e.g. `findall(R, p(3,R), Out)` will find all `R`'s that are solutions of `p(3,R)` and load them in `Out` |

## Misc

### Reverse a list
This is a good example of how accumulators are used 
```prolog
rev([], Acc, Acc).
rev([H|T], [])
```