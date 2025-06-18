# AVL Trees
___
Class: [[DataStructures&Algorithms]]
Type: Lecture
___

## General
An AVL tree is a balanced [[Binary Search Tree]] (i.e. it satisfies the following property):
>[!property]
>If $x$ is a node of the AVL tree, then the *difference* between the *height* of its *subtrees* is **0, 1 or -1**
>>[!tip]
>>The height of an empty tree is -1.
>>The height of a single node is 0

Thus, in the representation of an AVL node we now must also store its *height*.

After performing insertions and deletions, the AVL tree property can be restored with operations called **rotations** 

## Interface
![[21AVL.pdf]]