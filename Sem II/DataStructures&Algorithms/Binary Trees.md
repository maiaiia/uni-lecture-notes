# Binary Trees
___
Class: [[DataStructures&Algorithms]]
Type: Lecture
___
## Terminology
| Term                 | Meaning                                                                                                            |
| -------------------- | ------------------------------------------------------------------------------------------------------------------ |
| full tree            | every internal node has exactly two children                                                                       |
| complete tree        | a full tree with all leaves on the same level                                                                      |
| almost complete tree | a complete tree except for the last level, where nodes are completed from left to right ([[BinaryHeap]] structure) |
| degenerate tree      | every internal node has exactly one child (so just a chain of nodes)                                               |
| balanced tree        | the difference between the height of the left and right subtrees is at most 1 *for every node from the tree*       |
## Properties
- the number of nodes in a complete binary tree of height $N$ is $2^{N+1}-1$
- the maximum number of nodes in a binary tree is reached when the tree is complete
- the minimum number of nodes in a binary tree of height $N$ is $N+1$ - if the tree is degenerate
- A binary tree with $N$ nodes has a height between $\log_2N$ and $N - 1$

## Representations
-  **Array representation** 
	- similar to binary heap
	- store the elements in an array
	- first position from the array is the root of the tree
	- node $i$ has the left child $2i$ and the right child $2i+1$ 
- **Linked representation with Dynamic allocation**
	- a structure is used to represent a node, containing the information and the addresses of the children (and possibly the address of the parent)
- **Linked representation using Array**
	- 4 mandatory arrays: info, left, right, emptyPos
	- optional: parent array
	- the emptyPos array is managed in a similar manner to SLL on array
	- tree may need to be resized

## Traversal
### Preorder. Inorder. Postorder
- **Preorder** 
	- start with an empty stack and push the root
	- while the stack is not empty
		- pop a node and visit it
		- push the right child to the stack
		- push the left child to the stack
- **Inorder**
	- start with an empty stack and a current node set to root
	- while current node is not NIL, push it to the stack and set current node to its left child
	- while stack is not empty
		- pop a node and visit it
		- set current node to the right child of the popped node
		- while current node is not NIL, push it to the stack and set current node to the left child
- **Postorder**
	- with *two stacks*: 
		- use the first stack to traverse the tree in a similar manner to the preorder traversal, but push the children in reverse order (first left, then right)
		- instead of visiting a node, push it to the second stack 
		- note that the order in which nodes are pushed to the stack is the reverse postorder traversal. Thus, popping the elements from the second stack will give us the postorder traversal
	- with *one stack*
		- start with an empty stack and a current node set to the root of the tree
		- while the current node is not NIL, push to the stack the right child of the current node (if it exists) and the current node and then set the current node to its left child
		- while the stack is not empty:
			- pop a node from the stack (call it current node)
			- if the current node has a right child, the stack is not empty and contains the right child on top of it, pop the right child, push the current node, and set current node to the right child
			- otherwise, visit the current node and set it to NIL
			- while the current node is not NIL, push to the stack the right child of the current node (if it exists) and the current node and then set the current node to its left child

>[!Traversals]-
>![[19IterativeTraversals.pdf]]
### [[Trees#^09a4c6|BF / Level Order]]  
- just like Preorder, but here it doesn't matter whether the left or right child is visited first

