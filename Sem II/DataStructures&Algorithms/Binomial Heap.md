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
### Interface
- **Merge**: $\theta(1)$
	- can only be performed if the binomial trees have *the same order*
	- set one tree as the leftmost child of the other
## Binomial Heap
A **binomial heap** is a collection of binomial trees with the following property:
- each binomial tree respects the *heap property*
- there can be at most one binomial tree of order $k$

As representation, a binomial tree is usually a SortedLL, where each node contains a binomial tree, and the list is sorted by the order of the trees.

A binomial heap with $n$ elements contains at most $\log_2n$ binomial trees. Its height is at most $\log_2n$.
### Interface
- **Merge** - $O(\log_2n)$, where $n$ is the total number of elements in both heaps
	- merge the 2 linked lists containing the heads of the binomial trees 
	- while there are pairs of trees of the same order, merge them (and make sure that the heap property is respected!! - it's enough to just check)
- **Push** - BC: $\Theta(1)$, WC: $\Theta(\log_2n)$; AC: $\Theta(1)$ amortised
	- create a new binomial heap with only one element and merge it with the existing one
- **Top** - $O(\log_2n)$ 
	- check every root of every binomial tree and return the minimum value
- **Pop** - $O(\log_2n)$
	- get the minimum and remove it 
	- the corresponding tree is now a binomial heap in reverse. merge it with the main heap