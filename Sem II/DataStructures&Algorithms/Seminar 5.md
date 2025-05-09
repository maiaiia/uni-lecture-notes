# Seminar 5
___
Class: [[DataStructures&Algorithms]]
Type: 
Tags: # 
Date: May 9th, 2025
___

## Arithmetic expression evaluation
Evaluate an arithmetic expression
- $2 + 3 * 4$
- $((2+4)*7)+3*(9-5)$

Steps
I) Transform expression from *infix* to *postfix* (assuming the expression is correct)

| Infix             | Postfix       |
| ----------------- | ------------- |
| 2 + 4             | 2 4 +         |
| 4 * 3 + 6         | 4 3 * 6 +     |
| 4 * (3 + 6)       | 4 3 6 + *     |
| (5 + 6) * (4 - 1) | 5 6 + 4 1 - * |
| 4 + 3 * 6         | 4 3 6 * +     |


>[!Idea]
>```pseudocode
>Input: expr.
>Output: is a Queue q with the postfix notation
>Use an auxiliary stack s
>
>for every element e in expr:
>	1. if e is an operand -> push it to q
>	2. if e is '(' -> push it to s 
>	3. if e is ')' -> pop from s and push to q until top of s is '('
>	4. if e is an operator
>		while the top of the stack contains an operator with the priority 
>		higher than or equal to the priority of e 
>			pop from s 
>			push to q
>		push e to s
>		
>pop everything from stack and move to q
>```

>[!Example]-
>$2 * (4 + 3) - 4 + 6 / 2 * (1 + 2 * 7) + 9 / (1 + 1 * 4 / 2) + 6 + 2 * 8$
>
> | Current | Case | Stack $\downarrow$ | Queue $\downarrow$ |
> | ------- | ---- | ------------------ | ------------------ |
> | 2       | 1    |                    | 2                  |
> | *       | 4    | \*                 |                    |
> | (       | 2    | \* (               |                    |
> | 4       | 1    |                    | 4                  |
> | +       | 4    | \* ( +             |                    |
> | 3       | 1    | \* ( +             | 3                  |
> | )       | 3    | \*                 | +                  |
> | -       | 4    | -                  | \*                 |
> | 4       | 1    |                    | 4                  |
> | +       | 4    | +                  | \-                 |
> | 6       | 1    |                    | 6                  |
> | /       | 4    | +/                 |                    |
> | 2       | 1    |                    | 2                  |
> | \*      | 4    | +\*                | /                  |
> | (       | 2    | +\*(               |                    |
> | 1       | 1    |                    | 1                  |
> | +       | 4    | +\*(+              |                    |
> | 2       | 1    |                    | 1                  |
> | \*      | 4    | +\*(+\*            |                    |
> | 7       | 1    |                    | 7                  |
> | )       | 3    | +\*                | \*<br>+            |
> | +       | 4    | +                  | \*<br>+            |
> | 9       | 1    |                    | 9                  |
> | /       | 4    | +/                 |                    |
> | (       | 2    | +/(                |                    |
> | 1       | 1    |                    | 1                  |
> | +       | 4    | +/(+               |                    |
> | 1       | 1    |                    | 1                  |
> | \*      | 4    | +/(+*              |                    |
> | 4       | 1    |                    | 4                  |
> | /       | 4    | +/(+/              | \*                 |
> | 2       | 1    |                    | 2                  |
> | )       | 3    | +/                 | /<br>+             |
> | +       | 4    | +                  | /<br>+             |
> | 6       | 1    |                    | 6                  |
> | +       | 4    | +                  | +                  |
> | 2       | 1    |                    | 2                  |
> | \*      | 4    | +\*                |                    |
> | 8       | 1    |                    | 8                  |
> |         |      |                    | \*<br>+            |
Q: 2 4 3 + \* 4 - 6 2 / 1 2 7 \* + \* + 9 1 1 4 \* 2 / + / + 6 + 2 8 \* +

>[!code]-
>```pseudocode
>function transform(expr) is:
>	init(s)
>	init(q)
>	for e in expr:
>		if  e is an operand
>			push(q,e)
>		if e = '('
>			push(s,e)
>		if e = ')'
>			while top(s) != '('
>				push(q, pop(s))
>			pop(s)
>		if e is an operator and !isEmpty(s) and top(s) != '('
>			while (comparePriorities(top(s), e))
>				push(q, pop(s))
>			push(s, e)
>	while !isEmpty(s) execute:
>		push(q, pop(s))
>```

II) Evaluate the result
>[!Example]-
Q: 2 4 3 + \* 4 - 6 2 / 1 2 7 \* + \* + 9 1 1 4 \* 2 / + / + 6 + 2 8 \* +
>
> |  Current  |  Stack $\downarrow$  |
|:----------|:---------------------|
|  2        |  2                   |
|  4        |  2 4                 |
|  3        |  2 4 3               |
|  +        |  2 7                 |
|  \*       |  14                  |
|  4        |  14 4                |
|  -        |  10                  |
|  6        |  10 6                |
|  2        |  10 6 2              |
|  /        |  10 3                |
|  1        |  10 3 1              |
|  2        |  10 3 1 2            |
|  7        |  10 3 1 2 7          |
|  \*       |  10 3 1 14           |
|  +        |  10 3 15             |
|  \*       |  10 45               |
|  +        |  55                  |
|  9        |  55 9                |
|  1        |  55 9 1              |
|  1        |  55 9 1 1            |
|  4        |  55 9 1 1 4          |
|  \*       |  55 9 1 4            |
|  2        |  55 9 1 4 2          |
|  /        |  55 9 1 2            |
|  +        |  55 9 3              |
|  /        |  55 3                |
|  +        |  58                  |
|  6        |  58 6                |
|  +        |  64                  |
|  2        |  64 2                |
|  8        |  64 2 8              |
|  \*       |  64 16               |
|  +        |  80                  |  

>[!Code]-
>```pseudocode
>function evaluate(postfix) is:
>	init(s)
>	while ! isEmpty(postfix) execute:
>		e <- pop(postfix)
>		if e is an operand then:
>			push(s, e)
>		else
>			op1 <- pop(s)
>			op2 <- pop(s)
>			result <- calculate(op1, op2, e)
>			push(s, result)
>		end if
>	evaluate <- pop(s)
>```

## K-largest Sum
Determine the sum of the `k` largest numbers from an array containing `n` distinct numbers. Find as many solutions as possible
>[!Example]
>n = 10, k = 3: \[6, 12, 9, 91, 3, 5, 25, 81, 11, 23\]
>91 + 81 + 25

1. Sort the array in descending order and compute the sum of the first k numbers $\Theta(k\log_2n)$
2. Frequency vector (for small values)
Find the maximum: $\Theta(n)$
Assume allocating the space is: $\Theta(1)$
Fill in the frequency vector with values: $\Theta(n)$
Starting from the end, compute the sum of the first k values with a non-zero frequency: $O(maxElem)$
3. Use a sorted vector of $k$ positions
\[6, 9, 12] $\rightarrow$ \[9, 12, 91] $\rightarrow$ \[12, 25, 91] $\rightarrow$ \[25, 81, 91]
processing one element: $O(k)$
Total complexity: $O(k * n)$
4. Use a binary heap 
Add everything to a **max**-heap: $O(n\log_2 n)$
Remove $k$ elements: $O(k \log_2 n)$
Total complexity: $O(k \log_2 n)$
5. Improvement upon 4: 
Add everything $\mapsto$ *heapify*: $\Theta(n)$
6. Improvement upon 5
Use a **min**-heap with the $k$ largest elements. If the minimum is < current element, remove the top of the heap and add current element
Keep a variable storing the sum of the elements in the heap
$O(n \cdot \log_2 n) + O(k \cdot \log_2 k)$
7. Improvement upon 6 
If you have access to the representation of the heap, simply change the value on the position of the top of the heap, then use bubble-down on newly added elements instead of performing remove + add
