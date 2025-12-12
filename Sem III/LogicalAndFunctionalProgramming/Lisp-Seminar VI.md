---
Class: "[[LogicalAndFunctionalProgramming]]"
date: 2025-12-12
type: Seminar
---
# Lisp-Seminar VI


Perform the inorder traversal of a type 1 tree.

```lisp
;in(l1..ln)=
;    emptyset, if n = 0
;    l1 U in(l3..ln, c1..ck), l2 = 0 and k = 0	
;    l1 U in(c1 U 0 U l3..ln, c3..ck), l2 = 0, c2 = 1
;    l1 U c1 U in(l3..ln, c3..ck), l2 = 0, c2 = 2
;    in(l3..ln, l1 U l2 U c1..ck) otherwise

(defun in_order (l c)
  (cond 
    ((null l) nil)
    ((= (cadr l) 0)
      (cons (car l)
        (cond 
          ((null c) (in_order (cddr l) c))
          ((= (cadr c) 1) (in_order (cons(car c) (cons 0 (cddr l))) (cddr c)))
          (T (cons (car c) (in_order (cddr l) (cddr c))))
        )
      )
    )  
    (T (in_order (cddr l) (cons (car l) (cons (cadr l) c))))
  )
)
```

## Map Functions

A map function takes a function and a collection of arguments as parameters. It then applies the provided function on each element in the collection. Lastly, it aggregates the results in another list.


### MapCar 

### MapCat

### Exercises

>[!Question]
>Triple all the numeric atoms from a list
>(1 (a (3) 2) b) -> (3 (a (9) 6) b)

```
;triple(l)
;    emptyset, l is empty
;    3 * l, l is number
;    l, l is non-numeric atom
;    triple(l1) U triple(l2) U ... U triple(ln), otherwise (l = l1..ln)



```


