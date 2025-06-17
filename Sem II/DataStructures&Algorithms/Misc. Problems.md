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

## Rebuild a tree if you have its preorder and inorder traversal
- use the preorder traversal to identify the root of the current tree and the inorder traversal to identify the left and right subtrees

- steps:
	- set the root of the tree to the first node in the preorder traversal
	- set currentNode to the root, preorderPos to 1 and inorderPos to the position of the root in the inorder traversal (find it in a while loop)
	- while preorderIndex != n
		- 