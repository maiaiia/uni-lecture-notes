---
Class: "[[LogicalAndFunctionalProgramming]]"
date: 2025-12-29
type:
---
# Lisp All Labs

## Lab 4
1.a. Write a function to return the n-th element of a list, or NIL if such an element does not exist.
```lisp
; find_nth(l1..lk, n) = 
;   NIL, k == 0 
;   l1, n == 1 
;   find_nth(l2..lk, n - 1) otherwise

(defun find_nth (l n)
  (cond 
    ((null l) NIL)
    ((eq n 1) (car l))
    (T (find_nth (cdr l) (- n 1)))
  )
)
```
1.b. Write a function to check whether an atom E is a member of a list which is not necessarily linear
```lisp
; find_e (l1..ln e)
;   NIL, n = 0 
;   T, l1 = e 
;   find_e (l2..ln, e), l1 is an atom 
;   find_e(l1, e) or find_e(l2..ln, e), l1 is a list 

(defun find_e (l e)
  (cond 
    ((null l) NIL)
    ((atom (car l))
      (cond 
        ((equal (car l) e) T)
        (T (find_e (cdr l) e))
      )
    )
    ((find_e (cdr l) e) T)
    (T (find_e (car l) e))
  )
)
```
1.c. Write a function to determine the list of all sublists of a given list, on any level. A sublist is either the list itself, or any element that is a list, at any level.
```lisp
; myAppend (l1..ln, a1..ak) = 
;   a1..ak, n = 0 
;   l1..ln, k = 0 
;   {l1} U myAppend(l2..ln, a1..ak) otherwise

(defun myAppend (l a)
  (cond
    ((null l) a)
    ((null a) l)
    (T (cons (car l) (myAppend (cdr l) a)))
  )
)

; get_sublists (l1..ln flag) = 
;   NIL, n = 0 
;   (l1..ln) U get_sublists(l1..ln, 1), flag = 0 
;   get_sublists(l2..ln, 1), l1 is an atom 
;   (get_sublists(l1, 0)) U get_sublists(l2..ln, 1) otherwise

(defun get_sublists (l flag)
  (cond 
    ((null l) NIL) 
    ((equal flag 0) (cons l (get_sublists l 1)))
    ((atom (car l)) (get_sublists (cdr l) 1))
    (T (myAppend (get_sublists (car l) 0) (get_sublists (cdr l) 1)))
  )
)

(print (get_sublists '(1 (3 (4)) (6 7) 8 (9) 10) 0))
```
1.d. Write a function to transform a linear list into a set
```lisp
; setify (l1..ln) = 
;   NIL, n = 0
;   setify(l2..ln), find_e(l2..ln, l1)
;   l1 U setify(l2..ln) otherwise 

(defun setify (l)
  (cond
    ((null l) NIL)
    ((find_e (cdr l) (car l)) (setify (cdr l)))
    (T (cons (car l) (setify (cdr l))))
  )
)
```

---

2.a. Write a function to return the product of two vectors
```lisp
; dotprod(l1..ln v1..vn) = 
;   0, n = 0 
;   l1 * v1 + dotprod(l2..ln, v2..vn) otherwise

(defun dotprod (l v) 
  (cond 
    ((null l) 0)
    (T (+ (* (car l) (car v)) (dotprod (cdr l) (cdr v))))
  )
)
```
2.b. Write a function to return the depth of a list
```lisp
; listDepth(l1..ln curr) = 
;   curr, n = 0
;   listDepth(l2..ln, curr), l1 is an atom
;   max(listDepth(l1, curr +1), listDepth(l2..ln, curr)) otherwise

(defun listDepth(l curr)
  (cond
    ((null l) curr)
    ((atom (car l)) (listDepth (cdr l) curr))
    (T (max (listDepth (car l) (+ curr 1)) (listDepth (cdr l) curr)))
  )
)
```
2.c. Write a function to sort a linear list without keeping the double values
```lisp
; getMin(l1..ln) = 
;   l1, n = 1 
;   min(l1, getMin(l2..ln)) otherwise
(defun getMin (l)
  (cond
    ((null (cdr l)) (car l))
    (T (min (car l) (getMin (cdr l))))
  )
)

; removeValue (l1..ln, e) = 
;   null, n = 0 
;   removeValue(l2..ln, e), l1 = e 
;   l1 U removeValue(l2..ln, e), otherwise
(defun removeValue (l e)
  (cond
    ((null l) NIL)
    ((= (car l) e) (removeValue (cdr l) e))
    (T (cons (car l) (removeValue (cdr l) e)))
  )
)

; sortNoDup (l1..ln) = 
;   null, n = 0 
;   getMin(l1..ln) U removeValue(l1..ln, getMin(l1..ln)) otherwise
(defun sortNoDup (l)
  (cond 
    ((null l) NIL)
    (T 
      (let ((m (getMin l)))
        (cons m (sortNoDup (removeValue l m)))
      )
    )
  )
)
```
2.d. Write a function to return the intersection of two sets
```lisp
; find (l1..ln, e) = 
;   NIL, n = 0 
;   T, l1 = e 
;   find (l2..ln, e) otherwise 

(defun findVal(l e)
  (cond 
    ((null l) NIL)
    ((= (car l) e) T)
    (T (findVal (cdr l) e))
  )
)

; setIntersect(l1..ln, s1..sk) = 
;   NIL, n = 0
;   {l1} U setIntersect(l2..ln, s1..sk), find(s1..sk, l1)
;   setIntersect(l2..ln, s1..sk) otherwise 
(defun setIntersect(l s)
  (cond 
    ((null l) NIL)
    ((findVal s (car l)) (cons (car l) (setIntersect (cdr l) s)))
    (T (setIntersect (cdr l) s))
  )
)
```

---

3.a. Write a function that inserts in a linear list a given atom A after the 2nd, 4th, 6th, ... element
```lisp
; insertEven (l1..ln e flag)
;   NIL, n = 0 
;   {l1, e} U insertEven(l2..ln), flag = 1 
;   {l1} U insertEven(l2..ln) otherwise 

(defun insertEven (l e &optional (flag 0))
  (cond 
    ((null l) NIL)
    ((= flag 1) (cons (car l) (cons e (insertEven (cdr l) e 0))))
    (T (cons (car l) (insertEven (cdr l) e 1)))
  )
)
```
3.b. Write a function that returns all atoms in a given list, in reverse order (e.g. (((A B C) D) E) returns (E D C B A))
```lisp
(defun myAppend (l a)
  (cond
    ((null l) a)
    ((null a) l)
    (T (cons (car l) (myAppend (cdr l) a)))
  )
)

; getAtomsReverse (l1..ln) = 
;   NIL, n = 0
;   getAtomsReverse(l2..ln) U {l1}, l1 is an atom 
;   getAtomsReverse(l2..ln) U getAtomsReverse(l1), otherwise

(defun getAtomsReverse (l)
  (cond 
    ((null l) NIL)
    ((atom (car l)) (myAppend (getAtomsReverse (cdr l)) (list (car l))))
    (T (myAppend (getAtomsReverse (cdr l)) (getAtomsReverse (car l))))
  
  )
)
```
3.c. Write a function that returns the greatest common divisor of all numbers in a non-linear list 
```lisp
; gcd (x y) = 
;   x, y = 0 
;   gcd (y, x % y) otherwise

(defun myGcd (x y)
  (cond
    ((= y 0) x)
    (T (myGcd y (mod x y)))
  )
)

; nonLinearGcd(l1..ln) = 
;   0, n = 0
;   myGcd(l1, nonLinearGcd(l2..ln)), l1 is a number 
;   myGcd(nonLinearGcd(l1), nonLinearGcd(l2..ln)) otherwise 

(defun nonLinearGcd (l)
  (cond
    ((null l) 0)
    ((atom (car l)) (myGcd (car l) (nonLinearGcd (cdr l))))
    (T (myGcd (nonLinearGcd (car l)) (nonLinearGcd (cdr l))))
  )
)
```
3.d. Write a function that determines the number of occurrences of a given atom in 
a non-linear list
```lisp
; countOcc (l1..ln e) =
;   0, n = 0 
;   1 + countOcc(l2..ln, e), l1 = e
;   countOcc(l2..ln, e), l1 is an atom 
;   countOcc(l1, e) + countOcc(l2..ln, e) otherwise 

(defun countOcc (l e)
  (cond
    ((null l) 0)
    (T (+ (countOcc (cdr l) e)
      (cond
        ((equal (car l) e) 1)
        ((atom (car l)) 0)
        (T (countOcc (car l) e))
      )
    ))))
```

---

4.a. Write a function to return the sum of two vectors
```lisp
(defun vecSum (v s)
  (cond 
    ((null v) NIL)
    (T (cons (+ (car v) (car s)) (vecSum (cdr v) (cdr s))))
  )
)

```
4.b. Write a function that returns all atoms in a given list, maintaining the order (3.b. same order)
```lisp
(defun myAppend (l a)
  (cond
    ((null l) a)
    ((null a) l)
    (T (cons (car l) (myAppend (cdr l) a)))
  )
)

; getAtoms (l1..ln) = 
;   NIL, n = 0
;   {l1} U getAtomsReverse(l2..ln), l1 is an atom 
;   getAtoms(l1) U getAtoms(l2..ln), otherwise

(defun getAtoms (l)
  (cond 
    ((null l) NIL)
    ((atom (car l)) (cons (car l) (getAtoms (cdr l))))
    (T (myAppend (getAtoms (car l)) (getAtoms (cdr l))))
  )
)
```
4.c. Write a function that inverts continuous sequences of atoms in a given list (e.g. (a b c (d (e f) g h i)) returns (c b a (d (f e) i h g)) )
```lisp
(defun myAppend (l a)
  (cond
    ((null l) a)
    ((null a) l)
    (T (cons (car l) (myAppend (cdr l) a)))
  )
)

; reverseCont (l1..ln, acc = ()) = 
;   acc, n = 0 
;   reverseCont(l2..ln, {l1, acc}), l1 is an atom 
;   acc U reverseCont(l1, ()) U reverseCont(l2, ()) otherwise

(defun reverseCont (l &optional (acc ()))
  (cond 
    ((null l) acc)
    ((atom (car l)) (reverseCont (cdr l) (cons (car l) acc)))
    (T (myAppend acc (cons (reverseCont (car l) ()) (reverseCont (cdr l)()))))
  )
)
```
4.d.  Write a function that returns the maximum value of the numerical atoms from a list, at the superficial level (i'm assuming the atoms in the main list?)
```lisp
; max0 (l1..ln) = 
;   -INF, n = 0
;   max0(l2..ln), l1 is not a number
;   max(l1, max0(l2..ln)) otherwise 

(defun max0 (l)
  (cond 
    ((null l) -999)
    ((numberp (car l)) (max (car l) (max0 (cdr l))))
    (T (max0 (cdr l)))
  )
)
```

---

5.a. Write the n-th element of a linear list twice (e.g. (10 20 30 40 50) and n = 3 will return (10 20 30 30 40 50))
```lisp
; doubleNth(l1..lk, n) = 
;   NIL, k = 0 
;   {l1} U l1..lk, n = 1 
;   l1 U doubleNth(l2..lk, n - 1) otherwise 

(defun doubleNth (l n)
  (cond
    ((null l) NIL)
    ((= n 1) (cons (car l) l))
    (T (cons (car l) (doubleNth (cdr l) (- n 1))))
  )
)
```
5.b. Write a function to return the association (?) of two vectors (e.g. (A B C) x (X Y Z) returns ((A, X) (B, Y) (C Z))
```lisp
; associate (v1..vn, s1..sn) = 
;   null, n = 0 
;   ((v1, s1)) U associate(v2..vn, s2..sn) otherwise

(defun associate (v s)
  (cond 
    ((null v) nil)
    (T (cons (cons (car v) (list(car s))) (associate (cdr v) (cdr s))))  
  )
)
```
5.c. Write a function to determine the number of sublists in a given list, on any level (e.g. (1 2 (3 (4 5) (6 7)) 8 (9 10)) will return 5)
```lisp
; countSublists (l1..ln)
;   1, n = 0
;   countSublists(l2..ln), l1 is an atom 
;   countSublists(l1) + countSublists(l2..ln) otherwise 

(defun countSublists (l)
  (cond
    ((null l) 1)
    (T (+ (countSublists (cdr l))
      (cond 
        ((atom (car l)) 0)
        (T (countSublists (car l)))
      )
    ))
  )
)
```
5.d. Write a function that returns the number of all numerical atoms in a list at level 0.
```lisp
; countNumericalZero (l1..ln)
;   0, n = 0 
;   1 + countNumericalZero(l2..ln), l1 is a number
;   countNumericalZero(l2..ln) otherwise 

(defun countNumericalZero (l)
  (cond
    ((null l) 0)
    (T (+ (countNumericalZero (cdr l))
      (cond
        ((numberp (car l)) 1)
        (T 0)
      )
    ))
  )
)
```

---

6.a. Write a function to test wether a list is linear
```lisp
; isLinear(l1..ln)
;   T, n = 0 
;   NIL, l1 is not an atom 
;   isLinear(l2..ln) otherwise 

(defun isLinear (l)
  (cond 
    ((null l) T)
    ((not(atom (car l))) NIL)
    (T (isLinear (cdr l)))
  )
)
```
6.b. Write a function to replace the first occurrence of an element E in a given list with another element O
```lisp
; replaceFirst (l1..ln, e, o)
;   NIL, n = 0 
;   {o} U l2..ln, l1 = e
;   {l1} U replaceFirst(l2..ln, e, 0) otherwise 

(defun replaceFirst (l e o)
  (cond
    ((null l) NIL)
    ((eq (car l) e) (cons o (cdr l)))
    (T (cons (car l) (replaceFirst (cdr l) e o)))
  )
)
```
6.c. Write a function to replace each sublist of a list with its last atomic element
```lisp
; findLastAtom (l1..ln last)
;   last, n = 0
;   findLastAtom(l2..ln, l1), l1 is an atom
;   findLastAtom(l2..ln, findLastAtom(l1)) otherwise 

; nil is an atom btw
(defun findLastAtom(l &optional (last NIL))
  (cond
    ((null l) last)
    ((atom (car l)) (findLastAtom (cdr l) (car l)))
    (T (findLastAtom (cdr l) (findLastAtom (car l) last)))
  )
)

; replaceSublists(l1..ln)
;   NIL, n = 0 
;   {l1} U replaceSublists(l2..ln), l1 is an atom 
;   findLastAtom(l1) U replaceSublists(l2..ln) otherwise 

(defun replaceSublists (l)
  (cond
    ((null l) NIL)
    ((atom (car l)) (cons (car l) (replaceSublists (cdr l))))
    (T (cons (findLastAtom (car l)) (replaceSublists (cdr l))))
  )
)
```
6.d. Write a function to merge two sorted lists without keeping double values 
```lisp
; assuming there are no duplicates in l and s
; megeNoDup (l1..ln, s1..sk) = 
;   s1..sk, n = 0
;   l1..ln, k = 0
;   l1 U mergeNoDup(l2..ln, s2..sk), s1 = l1
;   l1 U mergeNoDup(l2..ln, s1..sk), l1 < s1
;   s1 U mergeNoDup(l1..ln, s2..sk) otherwise
(defun mergeNoDup (l s)
  (cond
    ((null l) s)
    ((null s) l)
    ((eq (car l) (car s)) (cons (car l) (mergeNoDup (cdr l) (cdr s))))
    ((< (car l) (car s)) (cons (car l) (mergeNoDup (cdr l) s)))
    (T (cons (car s) (mergeNoDup l (cdr s))))
  )
)
```

---

7.a. Write a function to eliminate the n-th element of a linear list
```lisp
(defun removeNth (l n)
  (cond
    ((null l) nil)
    ((= n 1) (cdr l))
    (T (cons (car l) (removeNth (cdr l) (- n 1))))
  )
)
```
7.b. Write a function to determine the successor of a number represented digit by digit as a list, without transforming the representation of the number from list to number.
```lisp
; reverseList(l1..ln) = 
;   nil, n = 0 
;   reverseList(l2..ln) U l1 otherwise
(defun reverseList (l &optional (acc ()))
  (cond 
    ((null l) acc)
    (T (reverseList (cdr l) (cons (car l) acc)))
  )
)

; successorReversed(l1..ln) = 
;   1, n = 0
;   (l1+1)..ln, l1 < 9
;   0 U successorReversed(l2..ln) otherwise
(defun successorReversed (l)
  (cond
    ((null l) (list 1))
    ((< (car l) 9) (cons (+ 1 (car l)) (cdr l)))
    (T (cons 0 (successorReversed (cdr l))))
  )
)

; successor (l1..ln) = 
; reverseList(successorReversed(reverseList(l1..ln)))
(defun successor (l)
  (reverseList(successorReversed(reverseList l)))
)
```
7.c. Write a function to return the set of all atoms in a non-linear list (no duplicate values)
```lisp
(defun inSet(l e)
  (cond
    ((null l) NIL)
    ((eq (car l) e) T)
    (T (inSet (cdr l) e))
  )
)

(defun atomSet (l &optional (acc ()))
  (cond
    ((null l) acc)
    ((atom (car l))
      (cond
        ((inSet acc (car l)) (atomSet (cdr l) acc))
        (T (atomSet (cdr l) (cons (car l) acc)))
      )
    )
    (T 
      (let 
        ((newAcc (atomSet (car l) acc)))
        (atomSet (cdr l) newAcc)
      )
    )
  )
)
```
7.d. Write a function to test whether a linear list is a set
```lisp
(defun testSet (l)
  (cond
    ((null l) T)
    ((inSet (cdr l) (car l)) NIL)
    (T (testSet (cdr l)))
  )
)
```

---

8.a. Write a function to return the difference of two sets
```lisp
(defun inSet(l e)
  (cond
    ((null l) NIL)
    ((eq (car l) e) T)
    (T (inSet (cdr l) e))
  )
)

(defun setDiff(l s )
  (cond
    ((null l) NIL)
    ((inSet s (car l)) (setDiff (cdr l) s))
    (T (cons (car l) (setDiff (cdr l) s)))
  )
)
```
8.b. Write a function to reverse a list with all its sublists, on all levels
```lisp
; reverseList(l1..ln) = 
;   nil, n = 0 
;   reverseList(l2..ln) U l1, l1 atom
;   reverseList(l2..ln) U reverseList(l1) otherwise
(defun reverseList (l &optional (acc ()))
  (cond 
    ((null l) acc)
    ((atom (car l)) (reverseList (cdr l) (cons (car l) acc)))
    (T (reverseList (cdr l) (cons (reverseList (car l) ()) acc)))
  )
)
```
8.c. Write a function that returns a list of the first elements in each list that has an odd number of elements (both atoms and sublists)
```lisp
; getFirstOddLength (l1..ln, cnt, first) = 
;   first, if n = 0 and cnt is odd 
;   getFirstOddLength(l2..ln, cnt + 1, newFirst) U 
;     emptyset, if l1 is an atom 
;     getFirstOddLength(l1, 0, NIL) otherwise
; where newFirst is l1 if cnt = 0 and first otherwise
(defun getFirstOddLength (l &optional (cnt 0) (first NIL))
  (cond
    ((null l)
      (cond
        ((= (mod cnt 2) 1) (list first))
        (T ())
      )
    )
    (T 
      ( let 
        ((newFirst (cond
          ((= cnt 0) (car l))
          (T first)
        )))
        ( myAppend 
          (getFirstOddLength (cdr l) (+ 1 cnt) newFirst)
          (cond
            ((atom (car l)) ())
            (T (getFirstOddLength (car l)))
          )
        )
      )
    )
  )
```
8.d. Write a function to return the sum of all numerical atoms in a list at the superficial level
```lisp
(defun sum0 (l)
  (cond
    ((null l) 0)
    ((numberp (car l)) (+ (car l) (sum0(cdr l))))
    (T (sum0 (cdr l)))
  )
)
```

---

9.a. Write a function that merges two sorted linear lists and keeps duplicates
```lisp
; merge (l1..ln s1..sk) = 
;   s1..sk, n = 0 
;   l1..ln, k = 0 
;   l1 U merge(l2..ln, s1..sk), l1 < s1
;   s1 U merge(l1..ln, s2..sk) otherwise 

(defun mergeLists(l s) 
  (cond
    ((null l) s)
    ((null s) l)
    ((< (car l) (car s)) (cons (car l) (mergeLists (cdr l) s)))
    (T (cons (car s) (mergeLists l (cdr s))))
  )
)
```
9.b. Write a function that replaces an element E with all the elements of a list L1 in a given list L
```lisp
(defun myAppend (l1 l2)
  (cond
    ((null l1) l2)
    ((null l2) l1)
    (T (cons (car l1) (myAppend (cdr l1) l2)))
  )
)

(defun repl (l e l2)
  (cond
    ((null l) nil)
    ((eq (car l) e) (myAppend l2 (repl (cdr l) e l2)))
    (T (cons (car l) (repl (cdr l) e l2)))
  )
)
```
9.c. Write a function that determines the sum of two numbers in a list representation, and returns the corresponding decimal number, without transforming the representation of the number from list to number
```lisp
(defun reverseList (l &optional (acc ()))
  (cond 
    ((null l) acc)
    (T (reverseList (cdr l) (cons (car l) acc)))
  )
)

; addReversed (l1..ln, s1..sk, carry)
;   carry, n = 0 and k = 0 and carry != 0
;   nil, n = 0 and k = 0 and carry = 0
;   addReversed(0, s1..sk, carry), n = 0 
;   addReversed(l1..ln, 0, carry), k = 0
;   (l1 + s1 + carry) % 10 U addReversed(l2..ln, s2..sk, (l1 + s1 + carry) / 10) otherwise

(defun addReversed (l s &optional (carry 0))
  (cond
    ((and (null l) (null s) (not (= carry 0))) (list carry))
    ((and (null l) (null s) (= carry 0)) NIL)
    ((null l) (addReversed '(0) s carry))
    ((null s) (addReversed l '(0) carry))
    (T (cons (mod (+ carry (car l) (car s)) 10) (addReversed (cdr l) (cdr s) (floor (+ carry (car l) (car s)) 10))))
  )
)

(defun addLists (l1 l2)
  (reverseList (addReversed (reverseList l1) (reverseList l2)))
)
```
9.d. Write a function that returns the gcd of all numbers in a linear list
```lisp
; gcd (x y) = 
;   x, y = 0 
;   gcd (y, x % y) otherwise

(defun myGcd (x y)
  (cond
    ((= y 0) x)
    (T (myGcd y (mod x y)))
  )
)

(defun linearGcd (l)
  (cond
    ((null l) 0)
    ((numericp (car l)) (myGcd (car l) (linearGcd (cdr l))))
    (T (linearGcd (cdr l))))
  )
)
```

---

10.a. Write a function that returns the product of all the numerical atoms from a list, at the superficial level *same as 8.d*
10.b. Write a function that replaces the first occurrence of an element E in a given list with another element O *same as 6b*
10.c. Write a function that computes the result of an arithmetic expression memorised in preorder on a stack
(\+ 1 3) ==> 4 (1 + 3)
(+ * 2 4 3) ==> 11 ((2 * 4) + 3)
(+ * 2 4 - 5 * 2 2) ==> 9 ((2 * 4) + (5 - (2 * 2))
```lisp
(defun revList (l &optional (acc '()))
  (cond
    ((null l) acc)
    (T (revList (cdr l) (cons (car l) acc)))
  )
)

(defun evalPostfix (e &optional (acc '()))
  (cond
    ((null e) (car acc))
    ((numberp (car e)) (evalPostfix (cdr e) (cons (car e) acc)))
    (T (evalPostfix (cdr e)
        (cond
          ((eq (car e) '+) (cons (+ (car acc) (cadr acc)) (cddr acc)))
          ((eq (car e) '*) (cons (* (car acc) (cadr acc)) (cddr acc)))
          ((eq (car e) '-) (cons (- (car acc) (cadr acc)) (cddr acc)))
          (T (cons (floor (car acc) (cadr acc)) (cddr acc)))
        )
      )
    )
  )
)

(defun evalPrefix (e)
  (evalPostfix (revList e))
)
```
10.d. Write a function that produces the list of pairs (atom n), where atom appears n times in a linear list (e.g. (A B A B A C A) returns ((A 4) (B 2) (C 1)))
```lisp
(defun addToPairList (pl e)
  (cond
    ((null pl) (list(cons e '(1))))
    ((eq e (caar pl)) (cons (cons e (list (+ 1(car (cdar  pl)))))(cdr pl)))
    (T (cons (car pl) (addToPairList (cdr pl) e)))
  )
)


(defun getPairs (l &optional (pairList ()))
  (cond
    ((null l) pairList)
    (T (getPairs (cdr l) (addToPairList pairList (car l))))
  )
)
```

---

11.a. Determine the lcm of the numerical values in a non-linear list 
```lisp
(defun myGcd (a b)
  (cond
    ((eq b 0) a)
    (T (myGcd b (mod a b)))
  )
)

(defun myLcm (a b)
  (floor (* a b) (myGcd a b))
)
(print (myLcm 12 18))
```
11.b. Write a function to test if a linear list of numbers is a "mountain"
```lisp
; isDesc (l1..ln)
;   NIL, n < 2
;   l1 > l2, n = 2 
;   l1 > l2 and isDesc(l2..ln) otherwise
(defun isDesc (l)
  (cond
    ((null (cdr l)) NIL)
    ((null (cddr l)) (> (car l) (cadr l)))
    (T (and (> (car l) (cadr l)) (isDesc (cdr l))))
  )
)

; isMountain (l1..ln)
;   NIL, n < 2 
;   NIL, l1 = l2
;   isMountain(l2..ln), l1 < l2
;   isDesc(l2..ln) otherwise    
(defun isMountain (l)
  (cond
    ((null (cdr l)) NIL)
    ((eq (car l) (cadr l)) NIL)
    ((< (car l) (cadr l)) (isMountain (cdr l)))
    (T (isDesc (cdr l)))
  )
)

; main (l1..ln)
;   n > 2 and l1 < l2 and testMountain(l1..ln)

(defun main(l)
  (cond 
    ((null (cddr l)) NIL)
    ((>= (car l) (cadr l)) NIL)
    (T (isMountain l))
  )
)
```
11.c. Remove all occurrences of the maximum numerical element from a non-linear list 
```lisp
; getMax (l1..ln, currentMax)
;   currentMax, n = 0 
;   getMax(l2..ln, l1), l1 is a number and l1 > currentMax
;   getMax(l2..ln, currentMax), l1 is a number 
;   getMax(l2..ln, getMax(l1, currentMax)) otherwise

(defun getMax (l &optional (currentMax (car l)))
  (cond
    ((null l) currentMax)
    ((numberp (car l)) (getMax (cdr l)
      (cond
        ((> (car l) currentMax) (car l))
        (T currentMax)
      )
    ))
    (T (getMax (cdr l) (getMax (car l) currentMax)))
  )
)

; removeVal(l1..ln, e) = 
;   NIL, n = 0 
;   removeVal(l2..ln, e), e = l1
;   {l1} U removeVal(l2..ln, e), l1 is a number 
;   removeVal(l1, e) U removeVal(l2..ln, e) otherwise
(defun removeVal (l e)
  (cond
    ((null l) NIL)
    ((eq (car l) e) (removeVal (cdr l) e))
    ((numberp (car l)) (cons (car l) (removeVal (cdr l) e)))
    (T (cons (removeVal (car l) e) (removeVal (cdr l) e)))
  )
)
; removeMax(l1..ln)
;   removeVal(l1..ln, getMax(l1..ln))
(defun removeMax (l)
  (removeVal l (getMax l))
)
```
11.d. Write a function that returns the product of numerical even atoms from a list, on any level 
```lisp
(defun multiplyEven (l)
  (cond
    ((null l) 1)
    ((numberp (car l)) 
      (cond
        ((eq 1 (mod (car l) 2)) (multiplyEven (cdr l)))
        (T (* (car l) (multiplyEven (cdr l))))
      )
    )
    (T (* (multiplyEven (car l)) (multiplyEven(cdr l))))
  )
)

```
---

12.a. Write a function that returns the dot product of two vectors 
```lisp
(defun dotProd(l v)
  (cond
    ((null l) 0)
    (T (+ (* (car l) (car v)) (dotProd (cdr l) (cdr v))))
  )
)
```
12.b. Write a function that returns the maximum value of all the numerical atoms in a list, at any level
```lisp
; getMax (l1..ln, currentMax)
;   currentMax, n = 0 
;   getMax(l2..ln, l1), l1 is a number and l1 > currentMax
;   getMax(l2..ln, currentMax), l1 is a number 
;   getMax(l2..ln, getMax(l1, currentMax)) otherwise

(defun getMax (l &optional (currentMax (car l)))
  (cond
    ((null l) currentMax)
    ((numberp (car l)) (getMax (cdr l)
      (cond
        ((> (car l) currentMax) (car l))
        (T currentMax)
      )
    ))
    (T (getMax (cdr l) (getMax (car l) currentMax)))
  )
)
```
12.c. same as 10.c.
12.d. Write a function that returns T if a list has an even number of elements on the first level, and NIL otherwise (do it without counting the elements of the list; lists count as one element)
```lisp
(defun checkEvenLength (l)
  (cond
    ((null l) T) 
    ((null (cdr l)) NIL)
    (T (checkEvenLength (cddr l)))
  )
)
```

---

13.a. A linear list and a number N are given. Remove the Nth, 2\*Nth, etc. element
```lisp
(defun removeNStep (l n &optional (c 1))
  (cond
    ((null l) nil)
    ((= c n) (removeNStep(cdr l) n 1))
    (T (cons (car l) (removeNStep (cdr l) n (+ 1 c))))
  )
)

```
13.b. Write a function to test if a linear list of integer numbers has a "valley" aspect. A list must have at least 3 elements to fulfil this condition (*same as 11.c*)
13.c. Write a function that returns the minimum numeric atom from a list, at any level (*same as 12.b*)
13.d. Write a function that removes all occurrences of the maximum element from a list (*same as 11.c*)

---

14.a. Write a function that returns the union of two sets
```lisp
(defun inSet(l e)
  (cond
    ((null l) NIL)
    ((eq (car l) e) T)
    (T (inSet (cdr l) e))
  )
)

(defun setDiff(l s )
  (cond
    ((null l) NIL)
    ((inSet s (car l)) (setDiff (cdr l) s))
    (T (cons (car l) (setDiff (cdr l) s)))
  )
)

(defun myAppend (a b)
  (cond
    ((null a) b)
    ((null b) a)
    (T (cons (car a) (myAppend (cdr a) b)))
  )
)

(defun setUnion (a b)
  (myAppend a (setDiff b a))
)
```
14.b. Write a function that returns the product of all numerical atoms in a list, at any level (*nope*)
14.c. Write a function that sorts a linear list, while keeping the double values 
```lisp
(defun reverseList (l &optional (acc '()))
  (cond
    ((null l) acc)
    (T (reverseList (cdr l) (cons (car l) acc)))
  )
)


(defun sortWithDoubles (l &optional (changesMade NIL) (newList '()))
  (cond
    ((null l)
      (cond
        (changesMade (sortWithDoubles (reverseList newList)))
        (T (reverseList newList))
      )
    )
    ((null (cdr l)) (sortWithDoubles NIL changesMade (cons (car l) newList))) 
    ((<= (car l) (cadr l)) (sortWithDoubles (cdr l) changesMade (cons (car l) newList)))
    (T (sortWithDoubles (cons (car l) (cddr l)) 1 (cons (cadr l) newList)))
  )

)
; worse than just finding the minimum in a list (and counting its number of occurrences in the same function), adding it to the new list, then removing said minimum, but i wanted to try a bubble sort in lisp
```
14.d. Write a function that builds a list containing the positions of the minimum numeric element from a given linear list 
```lisp
(defun findMinPositions (l &optional (currMin (car l)) (pos 1) (occ '()))
  (cond
    ((null l) occ)
    ((eq (car l) currMin) (findMinPositions (cdr l) currMin (+ 1 pos) (cons pos occ)))
    ((< (car l) currMin) (findMinPositions (cdr l) (car l) (+ 1 pos) (list pos)))
    (T (findMinPositions (cdr l) currMin (+ 1 pos) occ))
  )
)
```

---

15.a. Write a function that inserts an element E on the n-th position of a linear list (*5.a. is similar*)
15.b. Write a function that returns the sum of all numerical atoms in a list, at any level (*done*)
15.c. Write a function that returns the set of all sublists of a given non-linear list (*1.c.*)
15.d. Write a function that tests the equality of two sets, without using the set difference
```lisp
(defun inSet(l e)
  (cond
    ((null l) NIL)
    ((eq (car l) e) T)
    (T (inSet (cdr l) e))
  )
)
(defun setIncl (a b) ; test if a is included in b
  (cond
    ((null a) T)
    ((inSet b (car a)) (setIncl (cdr a) b))
    (T NIL)
  )
)

(defun setEq (a b)
  (and (setIncl a b) (setIncl b a))
)
```
## Lab 5 

- For a given tree of type (1) return the path from the root node to a certain given node X
```lisp
; getPath (t1..tn, target, p1..pk, r1..rk)
;   NIL, n = 0
;   getPath(t1..tn, target, p2..pk, r2-1..rk), r1 = 0
;   t1 U c1..ck, t1 = target
;   getPath(t3..tn, target, p1..pk, r1-1..rk), t2 = 0
;   getPath(t3..tn, target, t1 U p1..pk, t2 U r1..rk) otherwise
(defun getPath (tree target path remaining)
  (cond
    ((null tree) nil)
    ((eq (car remaining) 0) (getPath tree target (cdr path) (cons (- (cadr remaining) 1) (cddr remaining))))
    ((eq (car tree) target) (cons (car tree) path))
    ((eq (cadr tree) 0) (getPath (cddr tree) target path (cons (- (car remaining) 1) (cdr remaining))))
    (T (getPath (cddr tree) target (cons (car tree) path) (cons (cadr tree) remaining)))
  )
)

(defun pathFromRoot (tree target)
  (getPath (cddr tree) target (list (car tree)) (list (cadr tree)))
)
```
- Count the number of nodes on the k-th level of a tree of type (1)
```lisp
; countLvlK(t1t2..tn, k, currentLvl, r1..ri)
;   0, n = 0 
;   countLvlK(t1t2..tn, k, currentLvl - 1, r2-1..ri), r1 = 0
;   countLvlK(t3..tn, k, currentLvl+1, t2Ur1..ri) + (currentLvl == k ? 1 : 0) otherwise
(defun countLvl (tree k currentLvl remaining)
  (cond
    ((null tree) 0)
    ((eq(car remaining) 0) (countLvl tree k (- currentLvl 1) (cons (- (cadr remaining) 1) (cddr remaining))))
    (T (+(countLvl (cddr tree) k (+ 1 currentLvl) (cons (cadr tree) remaining))
      (cond
        ((eq currentLvl k) 1)
        (T 0)
      )
    ))
  )
)

(defun countLvlK (tree k)
  (cond
    ((eq k 0) 1)
    (T (countLvl (cddr tree) k 1 (list (cadr tree))))
  )
)
```
- Return the list of nodes on the k-th level of a tree of type (1)
```lisp
(defun helperCons (node lst)
  (cond
    ((null node) lst)
    (T (cons node lst))
  )
)

(defun getFromLvl (tree k currentLvl remaining)
  (cond
    ((null tree) NIL)
    ((eq(car remaining) 0) (getFromLvl tree k (- currentLvl 1) (cons (- (cadr remaining) 1) (cddr remaining))))
    (T (helperCons
      (cond
        ((eq k currentLvl) (car tree))
        (T NIL)
      )
      (getFromLvl (cddr tree) k (+ 1 currentLvl) (cons (cadr tree) remaining)))
    )
  )
)

(defun getLvlK (tree k)
  (cond
    ((eq k 0) (car tree))
    (T (getFromLvl (cddr tree) k 1 (list (cadr tree))))
  )
)
```
- Return the number of levels of a tree of type (1)
```lisp
(defun getMaxLvl (tree currentLvl maxlvl remaining)
  (cond
    ((< maxlvl currentLvl) (getMaxLvl tree currentLvl currentLvl remaining))
    ((null tree) maxlvl)
    ((eq(car remaining) 0) (getMaxLvl tree (- currentLvl 1) maxlvl (cons (- (cadr remaining) 1) (cddr remaining))))
    (T (getMaxLvl (cddr tree) (+ 1 currentLvl) maxlvl (cons (cadr tree) remaining)))
  )
)

(defun getLvlCount (tree)
  (cond
    ((null tree) 0)
    (T (+ 1 (getMaxLvl (cddr tree) 0 0 (list (cadr tree)))))
  )
)
```
- Convert a tree of type (2) to type (1)
```lisp
(defun myAppend (l a)
  (cond
    ((null l) a)
    ((null a) l)
    (T (cons (car l) (myAppend (cdr l) a)))
  )
)

; (A (B) (C)) -> (A 2 B 0 C 0)

; convert21 (t1..tn) = 
;   null, n = 0
;   (t1 0), n = 1
;   (t1 1) U convert21(t2), t3 = ()
;   (t1 1) U convert21(t3), t2 = ()
;   (t1 2) U convert21(t2) U convert21(t3) otherwise
(defun convert21 (tree)
  (cond
    ((null tree) NIL)
    ((null (cdr tree)) (cons (car tree) (list 0)))
    (T (myAppend (cons (car tree) (list
        (cond 
          ((or (null (cadr tree)) (null (caddr tree))) 1)
          (T 2)
        )
      )
    ) (myAppend (convert21 (cadr tree)) (convert21 (caddr tree)))))
  )
)
```
- Return the level (depth) of a node in a tree of type (1). The level of the root element is 0. (*like getPath but count the current level instead of memorising the path - or just use getPath and then count the number of nodes in the result*)
- Return the list of nodes of a tree of type (1) accessed inorder
```lisp
(defun removeSubtree (r)
  (cond
    ((null (cadr r)) nil)
    (T(cons (- (cadr r) 1) (cddr r)))
  )
)

; inorder1(t1..tn, p1..pk, r1..rk, o1..ok)
; nil, k = 0
; if r1 = 0
;   inorder1(t1..tn, p2..pk, removeSubtree(r1..rk), o2..ok), if o1 = 2
;   p1 U inorder1(t1..tn, p2..pk, removeSubtree(r1..rk), o2..ok) otherwise   
; p1 U inorder1(t3..tn, t1 U p1..pn, t2 U r1..rk, t2 U o1..ok), if r1 = 1 and o1 = 2 
; inorder1(t3..tn, t1 U p1..pn, t2 U r1..rk, t2 U o1..ok) otherwise

(defun inorder1(tree path r o)
  (cond
    ((null r) nil)
    ((eq (car r) 0)
      (cond
        ((eq (car o) 2) (inorder1 tree (cdr path) (removeSubtree r) (cdr o)))
        (T (cons (car path) (inorder1 tree (cdr path) (removeSubtree r) (cdr o))))
      )
    )
    ((and (eq (car r) 1) (eq (car o) 2)) (cons (car path) (inorder1 (cddr tree) (cons (car tree) path) (cons (cadr tree) r) (cons (cadr tree) o))))
    (T (inorder1 (cddr tree) (cons (car tree) path) (cons (cadr tree) r) (cons (cadr tree) o)))
  )
)

(defun mainF(tree)
  (inorder1 (cddr tree) (list (car tree)) (list (cadr tree)) (list (cadr tree)))
)
```
- Return the level of a node X in a tree of type (1). The level of the root element is 0 (*same as 6*)
- Return the list of nodes of a tree of type (2) accessed inorder
```lisp
; inorder2(t1..tn)
;   null, n = 0 
;   t1, n = 1 
;   inorder2(t2) U t1 U inorder2(t3) otherwise

(defun inorder2(tree)
  (cond
    ((null (car tree)) NIL)
    ((null (cdr tree)) (list(car tree))) 
    (T (myAppend (inorder2 (cadr tree)) (cons (car tree) (inorder2 (caddr tree)))))
  )
)
```
- Convert a tree of type (1) to type (2)
```lisp
(defun rev (l &optional (acc '()))
  (cond
    ((null l) acc)
    (T (rev (cdr l) (cons (car l) acc)))
  )
)

(defun getSubtrees (tree &optional (currentSum 2) (acc ()))
  (cond
    ((eq currentSum 1) (cons (rev acc) (list tree)))
    (T (getSubtrees (cddr tree) (- (+ currentSum (cadr tree)) 1) (cons (cadr tree)(cons (car tree) acc))))
  )
)

(defun convert12 (tree)
  (cond
    ((null tree) '())
    ((eq (cadr tree) 0) (append (list (car tree)) (convert12 (cddr tree))))
    ((eq (cadr tree) 1) (cons (car tree) (cons (convert12 (cddr tree)) '(()))))
    (T (let
      ((st (getSubtrees (cddr tree))))
      (cons (car tree) (cons (convert12(car st)) (list (convert12 (cadr st)))))
    ))
  )
)
```
- Return the level of a node X in a tree of type (2). the level of the root element is 0.
```lisp
; getLevel(t1..tn, node, currentLevel)
;   currentLevel, t1 = node 
;   NIL, n != 3
;   lvl, lvl != -1 (where lvl = getLevel(t2, node, currentLevel + 1)
;   getLevel(t3, node, currentLevel + 1) otherwise

(defun getLevel (tree node &optional (currentLevel 0))
  (cond
    ((eq (car tree) node) currentLevel) 
    ((null (cdr tree)) NIL) ; covers both n = 0 and n = 1
    (T (let
      ((lvl (getLevel (cadr tree) node (+ currentLevel 1))))
      (cond
        ((null lvl) (getLevel (caddr tree) node (+ currentLevel 1)))
        (T lvl)
      )
    ))
  )
)
```
- Return the level (and corresponding list of nodes) with the maximum number of nodes for a tree of type (2). The level of the root element is 0
```lisp

```
- Determine the list of nodes accessed in preorder in a tree of type (2)
```lisp
; preorder(t1..tn) = 
;   null, n = 0 
;   t1 U preorder(t2) U preorder(t3) otherwise 

(defun preorder (tree)
  (cond
    ((null tree) NIL)
    (T (cons (car tree) (append (preorder (cadr tree)) (preorder (caddr tree)))))
  )
)

(print (preorder '(A (B (D) (E (H) NIL)) (C (F (J) NIL) (G (K) NIL))) ))
```
- For a given tree of type (2) return the path from the root node to a certain given node X
```lisp
(defun rev (l &optional (acc '()))
  (cond
    ((null l) acc)
    (T (rev (cdr l) (cons (car l) acc)))
  )
)

; path(t1..tn, target, c1..ci) = 
;   null, n = 0
;   ci..c1 U t1, t1 = target
;   p1..pk, if k > 0, where p1..pk = path(t2, target, c1..ci)
;   path(t3, target, c1..ci) otherwise 

(defun path(tree target &optional c)
  (cond
    ((null tree) nil)
    ((eq (car tree) target) (rev(cons target c)))
    (T (let
      ((p (path (cadr tree) target (cons (car tree) c))))
      (cond
        ((null p) (path (caddr tree) target (cons (car tree) c)))
        (T p)
      )
    ))
  )
)
```
- Determine the list of nodes accessed in postorder in a tree of type (1)
```lisp
(defun rev (l &optional (acc '()))
  (cond
    ((null l) acc)
    (T (rev (cdr l) (cons (car l) acc)))
  )
)

(defun removeSubtree (r)
  (cond
    ((null (cdr r)) nil)
    (T (cons (- (cadr r) 1) (cddr r)))
  )
)

(defun postorder(tree rem acc)
  (cond
    ((null rem) nil)
    ((eq (car rem) 0) (cons (car acc) (postorder tree (removeSubtree rem) (cdr acc))))
    (T (postorder (cddr tree) (cons (cadr tree) rem) (cons (car tree) acc)))
  )
)

(defun main (tree)
  (postorder (cddr tree) (list (cadr tree)) (list (car tree)))
)
```
- Determine the list of nodes accessed in postorder in a tree of type (2)
```lisp
(defun postorder2 (tree)
  (cond
    ((null tree) nil)
    (T (append(postorder2(cadr tree)) (append (postorder2 (caddr tree)) (list (car tree)))))
  )
)
```
-  Determine if a tree of type (2) is balanced (the difference between the depth of two subtrees is equal to 1)
```lisp
(defun countBalanced (tree)
  (cond
    ((null tree) 0)
    ((null (cdr tree)) 1)
    (T (let
      (
        (lt (countBalanced (cadr tree)))
        (rt (countBalanced (caddr tree)))
      )
      
      (cond
        ((or (null lt) (null rt)) NIL)
        ((and (< (- lt rt) 2) (> (- lt rt) -2)) (+ 1 (max lt rt)))
        (T NIL)
      )
    ))
  )
)

(defun isBalanced (tree)
  (not(null (countBalanced tree)))
)
```

## Lab 6 - MAP Functions 
- Write a function to check if an atom is member of a list (non-linear)
```lisp
(defun bool-or (&rest args)
  (cond
    ((null args) nil)
    ((car args) t)
    (t (apply #'bool-or (cdr args)))))

; searchAtom(L, E) = 
;   T, L = E 
;   NIL, L is an atom 
;   searchAtom(l1) or searchAtom(l2) or ... or searchAtom(ln) otherwise (L = l1..ln)
(defun searchAtom(l e)
  (cond
    ((eq l e) T)
    ((atom l) NIL)
    (T (apply #'bool-or (mapcar #'(lambda(l) (searchAtom l e)) l)))
  )
)
```
- Write a function that returns the sum of numeric atoms in a list, at any level
```lisp
; super-sum(l) = 
;   l, l is a number 
;   0, l is an atom 
;   super-sum(l1) + super-sum(l2) + ... + super-sum(ln) otherwise (l = l1..ln)
(defun super-sum(l)
  (cond
    ((numberp l) l)
    ((atom l) 0)
    (T (apply #'+ (mapcar #'super-sum l)))
  )
)
```
- Define a function to test the membership of a node in an n-tree represented as (root list_of_nodes_subtree1 ... list_of_nodes_subtree_n)
```lisp
```
-  Write a function that returns the product of numeric atoms in a list, at any level
```lisp
; prod(l) = 
;   l, l is a number 
;   1, l is an atom 
;   prod(l1) * .. * prod(ln) otherwise (l = l1..ln)

(defun prod (l)
  (cond
    ((numberp l) l)
    ((atom l) 1)
    (T (apply #'* (mapcar #'prod l)))
  )
)
```
- Write a function that computes the sum of even numbers and then decreases the sum of odd numbers, at any level of a list
```lisp
; addEvenSubOdd(l) = 
;   l, l is an even number 
;   -l, l is an odd number
;   0, l is an atom 
;   addEvenSubOdd(l1) + .. + addEvenSubOdd(ln) otherwise (l = l1..ln)

(defun addEvenSubOdd (l)
  (cond
    ((numberp l)
      (cond
        ((eq (mod l 2) 0) l)
        (T (- 0 l))
      )
    )
    ((atom l) 0)
    (T (apply #'+ (mapcar #'addEvenSubOdd l)))
  )
)
```
-  Write a function that returns the maximum of numeric atoms in a list, at any level
```lisp
; maxNumeric(l) =
;   l, l is a number
;   -oo, l is an atom
;   max(maxNumeric(l1), maxNumeric(l2), ..., maxNumeric(ln)) otherwise (l = l1..ln)

(defun maxNumeric (l)
  (cond
    ((numberp l) l)
    ((atom l) -9999999)
    (T (apply #'max (mapcar #'maxNumeric l)))
  )
)
```
- Write a function that substitutes an element E with all elements of a list L1 at all levels of a given list L
```lisp
; ---------- version 1 -------------
; insert the list (as a list)
; replaceE(l, e, repl) = 
;   repl, l = e 
;   l, l is an atom 
;   replaceE(l1, e, repl) U .. U replaceE(ln, e, repl) otherwise (l = l1..ln)
(defun replaceE (l e repl)
  (cond
    ((eq l e) repl)
    ((atom l) l)
    (T (mapcar #'(lambda (l) (replaceE l e repl)) l))
  )
)

; insert the values inside the list ????
```
- Write a function to determine the number of nodes on the level k from a n-tree represented as follows : (root list_nodes_subtree_1 ... list_nodes_subtree_n)
- Write a function that removes all occurrences of an atom from any level of a list
- Define a function that replaces one node with another one in an n-tree
- Write a function to determine the depth of a list
- Write a function that substitutes an element through another one at all levels of a given list 
- Define a function that returns the depth of an n-tree
- Write a function that returns the number of atoms in a list, at any level
- Write a function that reverses a list together with all its sublist elements, at any level
- Write a function that produces the linear list of all atoms of a given list, from all levels, and written in the same order
```lisp
; flatten(l) = null, if l is null
;            = (l), if l is atom
;            = flatten(l1) U flatten(l2) U ... U flatten(ln), if l is a list and l = (l1..ln)
(defun flatten (l)
 (cond
  ((null l) nil)
  ((atom l) (list l))
  (T (mapcan #'flatten l)) 
 )
)
```


