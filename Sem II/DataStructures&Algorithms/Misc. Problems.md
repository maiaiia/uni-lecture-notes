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

## Red-Black Card Game
>[!Statement]
>Two players each receive $\frac{n}{2}$ cards, where each card can be red or black. The two players take turns; at every turn, the current player puts the card from the upper part of his / her deck on the table. If a player puts a red card on the table, the other player has to take all cards from the table and place them at the bottom of their deck. The winner is the player that has all the cards.
>
>Requirement: Given the number $n$ of cards, simulate the game and determine the winner.

## Robot in a maze:
>[!Statement]
>There is a rectangular maze, composed of occupied cells $X$ and free cells $*$. There is a robot $R$ in this maze and it can move in 4 directions: $N, S, E, W$.
>
>Requirements:
>- Check whether the robot can get out of the maze (get to one border of the maze)
>- Find a path that will take the robot out of the maze (if it exists)

This is basically just Lee's algorithm