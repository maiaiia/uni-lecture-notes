# Seminar IV
___
Class: [[LogicalAndFunctionalProgramming]]
Type: 
Tags: # 
Date: November 28th, 2025
___

Lisp is a functional programming language.

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
;my_append(l1..ln, m1..mk) = 
;   m1..mk, if n == 0 
;   l1..ln, if k == 0 
;   l1 U my_append(l2..ln, m1..mk)
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

(defun get_from_level (l level)
  (cond 
    ((or (null l) (= level 0)) nil)
    ((and (= level 1) (not (listp (car l))))
      (cons (car l)(get_from_level (cdr l) level))
    )
    ;((= level 1)
    ;  (get_from_level (cdr l) level)
    ;)
    ((and (> level 1) (listp (car l)))
      (my_append 
        (get_from_level(car l) (- level 1)) 
        (get_from_level (cdr l) level)
      )
    )
    (T (get_from_level (cdr l) level))
  )
)
```


```lisp
; write a function to replace each sublist of a list with its last element:
;   e.g. (a (b c) (d (e (f)))) --> (a c f)
;
; get_last(l1..ln) = 
;   l1, n == 1 and is_atom(l1)
;   get_last(l1), n == 1 and not is_atom(l1)
;   get_last(l2..ln) otherwise
;
; replaceWithLast(l1..ln) = 
;   [], n == 0
;   l1 U replaceWithLast(l2..ln), atom(l1)
;   get_last(l1) U replaceWithLast(l2..ln) otherwise   
;

( defun get_last
  (cond 
    ((null l) nil)
    ((and (atom (car l)) (null (cdr l)))(car l))
    ((null (cdr l)) get_last(car l))
    (T (get_last (cdr l)))
  )
)

(defun replaceWithLast (l)
  ( cond 
    ((null l) nil)
    ((atom (car l)) (cons (car l))(replaceWithLast (cdr l)))
    (T (cons  (get_last (car l)) (replaceWithLast (cdr l))))
  )

)
```