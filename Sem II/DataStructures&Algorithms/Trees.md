# Trees
___
Class: [[DataStructures&Algorithms]]
Type: Lecture
___
## Terminology

| Term             | Meaning                                                                      |
| ---------------- | ---------------------------------------------------------------------------- |
| child            | direct descendant                                                            |
| degree           | number of children                                                           |
| leaf             | node with degree 0                                                           |
| internal node    | node that is not a leaf                                                      |
| depth / level    | length of the path (i.e. no. of edges) from the root to the node             |
| height of a node | length of the longest path from the node to a leaf node (within the subtree) |
| height of a tree | height of the root                                                           |
| k-ary tree       | tree in which every node has at most $k$ children                            |
## K-ary trees 
### Representation
All structures have in common the following:
- information from the node
- address of the parent node (not mandatory)

The children can be stored like so:
1. $k$ fields, one for each child (doable if $k$ is not too large)
2. number of children + array of dimension $k$, in which each element is the address of a child
3. *left child right-sibling*: address of the leftmost child + address of the right sibling of the node
### Traversals
#### Depth first traversal
- Use a stack and first push the root to the stack.
- While the stack is not empty
	- pop the top node
	- visit it
	- push all the children to the stack
#### Level-order traversal

^09a4c6

- Use a queue and push the root 
- While the queue is not empty
	- pop the top node
	- visit it
	- push all the children to the queue

## [[Binary Trees]]

