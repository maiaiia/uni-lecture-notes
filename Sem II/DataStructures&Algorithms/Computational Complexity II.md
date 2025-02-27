# Computational Complexity II
___
Class: [[DataStructures&Algorithms]]
Type: Lecture 
Tags: #algorithmcomplexity
Date: February 26th, 2025
___
## Prerequisites 
See: [[Computational Complexity]] (big $O$ / $\Omega$ / $\Theta$ notation, best case, worst case, average case)
## Recap
#### Big $O$ / $\Omega$ / $\Theta$ notations
- $O$ - upper bound
- $\Omega$ - lower bound
- $\Theta$ - exact complexity

>[!tip] For the purposes of this course, we will try and use the $\Theta$ notation whenever that's possible

#### Best / Worst / Average case complexities

Average case computation formula: $\Sigma_{I \in D} P(I) \cdot E(I)$  
- $D$ - domain of the problem
- $I$ - input data 
- $P(I)$ - probability that we have $I$ as an input 
- $E(I)$ - number of operations performed by the algorithm for input $I$
For instance, when all events are equally likely to occur, the formula is $\cfrac{1}{n}\Sigma_{I\in D}E(I)$

Sample problem:  check if an element is in an unsorted array
BC: $\Theta(1)$
WC: $\Theta(n)$
AC: $\cfrac{1}{n+1}\cdot 1 + \cfrac{1}{n+1} \cdot 2 + ... + \cfrac{1}{n+1} \cdot n + \cfrac{1}{n+1} \cdot n \in \Theta(n)$
**Total complexity**: $O(n)$ (we use the $O$ notation when the best case complexity differs from the worst and average case complexities. If they are the same, $\Theta$ is used)

>[!tip] Thus, using the $O$ notation signals that there are certain scenarios when the complexity is better than the one specified 


