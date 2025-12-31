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
11.b. Write a function to test if a linear list of numbers is a "mountain"
11.c. Remove all occurrences of the maximum numerical element from a non-linear list 
11.d. Write a function that returns the product of numerical even atoms from a list, on any level 

---

12.a. Write a function that returns the dot product of two vectors 
12.b. Write a function that returns the maximum value of all the numerical atoms in a list, at any level
12.c. same as 10.c.
12.d. Write a function that returns T if a list has an even number of elements on the first level, and NIL otherwise (do it without counting the elements of the list)

---

13.a. A linear list and a number N are given. Remove the Nth, 2\*Nth, etc. element
13.b. Write a function to test if a linear list of integer numbers has a "valley" aspect. A list must have at least 3 elements to fulfil this condition 
13.c. Write a function that returns the minimum numeric atom from a list, at any level
13.d. Write a function that removes all occurrences of the maximum element from a list 

---

14.a. Write a function that returns the union of two sets
14.b. Write a function that returns the product of all numerical atoms in a list, at any level
14.c. Write a function that sorts a linear list, while keeping the double values
14.d. Write a function that builds a list containing the positions of the minimum numeric element from a given linear list 

---

15.a. Write a function that inserts an element E on the n-th position of a linear list 
15.b. Write a function that returns the sum of all numerical atoms in a list, at any level 
15.c. Write a function that returns the set of all sublists of a given non-linear list
15.d. Write a function that tests the equality of two sets, without using the set difference
## Lab 5 

1. For a given tree of type (1) return the path from the root node to a certain given node X
2. Return the list of nodes on the k-th level of a tree of type (1)
3. Return the number of levels of a tree of type (1)
4. Convert a tree of type (2) to type (1)
5. Return the level (depth) of a node in a tree of type (1). The level of the root element is 0.
6. Return the list of nodes of a tree of type (1) accessed inorder
7. Return the level of a node X in a tree of type (1). The level of the root element is 0
8. Return the list of nodes of a tree of type (2) accessed inorder
9. Convert a tree of type (1) to type (2)
10. Return the level of a node X in a tree of type (2). the level of the root element is 0.
11. Return the level (and corresponding list of nodes) with the maximum number of nodes for a tree of type (2). The level of the root element is 0
12. Determine the list of nodes accessed in preorder in a tree of type (2)
13. For a given tree of type (2) return the path from the root node to a certain given node X
14. Determine the list of nodes accessed in postorder in a tree of type (1)
15. Determine the list of nodes accessed in postorder in a tree of type (2)
16. Determine if a tree of type (2) is balanced (the difference between the depth of two subtrees is equal to 1)

## Lab 6 - MAP Functions 
1. Write a function to check if an atom is member of a list (non-linear)
2. Write a function that returns the sum of numeric atoms in a list, at any level
3. Define a function to test the membership of a node in an n-tree represented as (root list_of_nodes_subtree1 ... list_of_nodes_subtree_n)
4. Write a function that returns the product of numeric atoms in a list, at any level
5. Write a function that computes the sum of even numbers and then decreases the sum of odd numbers, at any level of a list
6. Write a function that returns the maximum of numeric atoms in a list, at any level
7. Write a function that substitutes an element E with all elements of a list L1 at all levels of a given list L
8. Write a function to determine the number of nodes on the level k from a n-tree represented as follows : (root list_nodes_subtree_1 ... list_nodes_subtree_n)
9. Write a function that removes all occurrences of an atom from any level of a list
10. Define a function that replaces one node with another one in an n-tree
11. Write a function to determine the depth of a list
12. Write a function that substitutes an element through another one at all levels of a given list 
13. Define a function that returns the depth of an n-tree
14. Write a function that returns the number of atoms in a list, at any level
15. Write a function that reverses a list together with all its sublist elements, at any level
16. Write a function that produces the linear list of all atoms of a given list, from all levels, and written in the same order


