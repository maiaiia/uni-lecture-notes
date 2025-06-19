# Skip List
___
Class: [[DataStructures&Algorithms]]
Type: Lecture
Tags: #DataStructures [[Linked Lists]]
Date: April 2nd, 2025
___

Optimal implementation of **sorted lists** (in terms of time):
- *dynamic arrays* allow binary search for finding the position for an insertion $O(\log_2n)$, but insertion is slow ($\Theta(n)$)
- *linked lists* allow fast insertions ($\Theta(1)$), but searching is slow ($O(n)$)

## Concept
![[Skip List 2025-04-02 16.41.24.excalidraw]]
Skip Lists use additional lists of various heights, which make searches in linked lists faster (avg. complexity is $O(\log_2n)$).
There are $\approx \log_2n$ levels.
- Lowest level has all $n$ elements.
- Next level has $\approx \cfrac{n}{2}$ elements 
- Next level has $\approx \cfrac{n}{4}$ elements 

## Implementation for Sorted List
1. **Search**
	- Start from the head and from the highest level.
	- If possible, go right
	- In the next element in the current level is greater, go down a level
	- Complexity: $O(\log_2n)$
2. **Insert**
	- Height of a new node is determined *randomly* with a method called *coin flip*. Thus, skip lists are *probabilistic* data structures
	- The coin flip guarantees that the distribution of nodes within the levels is $\approx$ even (i.e. $\approx$ half of the nodes will be on level 2, a quarter on level 3, etc)
	- There is *no bad sequence of insertion* (due to the probabilistic nature of insertion)