# Binomial Heap
___
Class: [[DataStructures&Algorithms]]
Type: Lecture
___
## Binomial Tree
A **binomial tree** of order $k$ 
- Is a tree which has a root and $k$ children. 
- It has exactly $2^k$ nodes
- Its height is $k$.

Merging 2 binomial trees *of the same order* is a $\Theta(1)$ operation: set one tree  the leftmost child of the other
## Binomial Heap
A **binomial heap** is a collection of binomial trees.