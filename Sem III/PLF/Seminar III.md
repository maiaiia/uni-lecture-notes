# Seminar III
___
Class: [[PLF]]
Type: Seminar
Tags: # 
Date: October 31st, 2025
___

You are given a heterogeneous list, made of numbers and lists of numbers. You have to remove the odd numbers from the sub lists that have a mountain aspect (a list has a mountain aspect if it consists of an increasing sequence of numbers, followed by a decreasing sequence of numbers)

E.g. \[1,2,\[1,2,3,2].6,\[1,2],\[1,4,5,6,7,1],\[8,2]] --> \[1,2,\[1,2,2].6,\[1,2],\[4,6],\[8,2]]

```prolog


```


`is_list`, `number`, `atom` (atom is whatever's neither a list nor a number)

`\+` or `not()` -- negate