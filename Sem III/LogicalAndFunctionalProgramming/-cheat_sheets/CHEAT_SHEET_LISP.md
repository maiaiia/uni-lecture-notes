---
Class: "[[-cheat_sheets]]"
date: 2025-12-30
type:
---
# CHEAT_SHEET_LISP

test if smth is a number: numberp
integer division: floor

this is allowed: `(defun getMax (l &optional (currentMax (car l)))`
## Common mistakes

cons needs a list as the second argument! (otherwise, the result will contain a dot that represents a pointer to nothing )

you can use letters as atoms inside a list, but, in a situation like this one `(print (replaceFirst '(1 2 3 4 3) 3 'x))`, the apostrophe is needed

don't use '=' --> error if the two values that are compared don't have the same type

NIL IS AN ATOM