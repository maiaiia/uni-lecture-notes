# Misc. Problems
___
Class: [[DataStructures&Algorithms]]
Type: Exam prep
___
## Reverse a linked list in $\Theta(n)$ time and $\theta(1)$ space
- use 3 pointers: $\text{prev, curr, next}$ 
- initialize with $\text{NIL, [T].head, [[T].head].next}$ respectively
- on each step:
	- $\text{[curr].next} \leftarrow \text{prev}$
	- $\text{prev}\leftarrow\text{curr; } \text{curr}\leftarrow\text{next; } \text{next}\leftarrow\text{[curr].next}$
- obviously be mindful of the edge cases and the stop condition