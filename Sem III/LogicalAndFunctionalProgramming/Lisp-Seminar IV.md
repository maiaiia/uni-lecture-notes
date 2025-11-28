# Seminar IV
___
Class: [[LogicalAndFunctionalProgramming]]
Type: 
Tags: # 
Date: November 28th, 2025
___

Lisp is a functional programming.

A function that modifies something beyond its scope is called a secondary-role function.

The functional programming paradigm implies no secondary effects

Function calls --> prefix order
(+ 1 2 3)

- make smth exempt from evaluation using apostrophes: `(print '(1 2 3))`
- get the head of a list (equivalent to prolog's \[H|T]): `car(1 2 3)`
- get the tail of a list: `cdr '(1 2 3)`

syntactic sugar: get the 2nd elem of a list: `cadr`; 3rd: `caddr`, 2nd to last: `cddr` etc (limit up to 4). Equivalent to combinations of `car` and `cdr`

- add an element to the head of a list: `cons`
- add an element to the tail of a list: `append` (can't use this on the final exam!! write one instead)

keyword to define a function `defun`
case switch: `cond`
true `T`, false `NIL`
lisp doesn't have a keyword for return --> if a condition is true, whatever's evaluated is returned

- = forces numeric evaluation 
- `equal` works for all kinds of comparisons


e.g. for append:
```lisp
( defun my_append (l1 l2)
  (cond 
    ;(condition action) 
    ;(T default_action)
    
    ((null l1) l2)
    ((null l2) l1)
    (T (cons (car l1) (my_append (cdr l1) l2)))
  )
)
```


given a heterogeneous list and a number, print all atoms at a specific level in that list
e.g: (get_from_level '(1 2 '(3 '(4) 5) '('(6))) 2) -> '(3 5)

```lisp


```