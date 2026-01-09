---
Class: "[[LogicalAndFunctionalProgramming]]"
date: 2026-01-09
type:
---
# Lisp-Seminar7


```lisp
; An n-ary tree is represented as a list 
; write a fuction that returns the path from the root to a given node. Use a map function

; path(l1..ln, node, c1..cm) = 
;   [], n = 0 
;   l1 U c1..cm, l1 = node
;   path(l2, node, l1 U c1..cm) U ... U path(ln, node, l1 U c1..cm) otherwise 

(defun path(l node &optional col)
  (cond
    ((null l) nil)
    ((equal (car l) node) (cons node col))
    (T (mapcan #'(lambda (st) (path st node (cons (car l) col))) (cdr l)))
  )
)
(print (path '(a (b (d) (e) (f)) (c (g (h) (i) (j)))) 'i ))
```

```lisp
; non-linear list (numerical and non-numerical atoms) 
; check if the sequence of numerical atoms from the odd levels of the list forms a zig-zag sequence

; `(10 21 (3 A (B ( 0 7 7) 1 77)) C (5 (D 54) 11 6) 89 F H)
; 10, 21, 1, 77, 54, 89


; flatten(x, level) = 
;   [x], x is a number and level is odd 
;   [], x is an atom 
;   flatten(x1, level + 1) U flatten(x2, level + 1) U .. U flatten(xn, level + 1) otherwise (x = x1..xn)

(defun flatten (x level) 
  (cond
    ((and (numberp x) (= (mod level 2) 1)) (list x))
    ((atom x) nil)
    (T 
      (mapcan #'(lambda (x) (flatten x (+ level 1))) x)
    )
  )
)

; zig_zag(l1..ln, asc) = 
;   T, n < 2 
;   zig_zag(l2..ln, 1), if asc == 0 and l1 > l2
;   zig_zag(l2..ln, 0), if asc == 1 and l1 < l2
(defun zig_zag (l asc)
  (cond
    ((null (cddr l)) T)
    ((and (= asc 0) (> (car l) (cadr l))) (zig_zag (cdr l) 1))
    ((and (= asc 1) (< (car l) (cadr l))) (zig_zag (cdr l) 0))
  )
)
(defun zig_zag_wr (l)
  (cond
    ((> (car l) (cadr l)) (zig_zag l 0))
    (T (zig_zag l 1))
  )
)

(defun main(l)
  (zig_zag_wr (flatten l 0))
)

(print (main '(10 21 (3 A (B ( 0 7 7) 1 77)) C (5 (D 54) 11 6) 89 F H)))
```
