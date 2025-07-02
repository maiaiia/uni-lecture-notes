# Misc. Problems
___
Class: [[DataStructures&Algorithms]]
Type: Exam Stuff
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

This is basically just a BFS (Lee's Algorithm)

## Merged Linked Lists
>[!Statement]
>Suppose there are 2 SLLs which intersect at some point and become a single linked list
>![[Screenshot 2025-06-19 at 12.23.45.png]]
>
>Requirement: Find their merging point

1. Push all nodes in the first list to a stack
2. Push all nodes in the second list to a stack
3. pop nodes from each stack until the tops of the stacks are different

## Implement a Stack using two Queues (and the other way around)

1. Queue using 2 stacks (S1 and S2)
	- Push: push to S1
	- Top / Pop:
		- push everything from S1 to S2
		- top element is the top of S2
		- after pop, push everything back to S1

## Duplicate removal
>[!Statement]
>Given a string of lower-case characters, recursively remove adjacent duplicate characters from the string. For example, for the word ”mississippi” the result should be ”m”.

```pseudocode
init(s) //stack
for c in string execute:
	if isEmpty(s) or top(s) != c then
		push(s,c) 
	else
		pop(s) //assuming pairs must be deleted, so aaa->a, aaaaa -> a
	end-if
```

## Reverse first k
>[!Statement]
>Given an integer k and a queue of integer numbers, how can we reverse the order of the first k elements from the queue? For example, if k=4 and the queue has the elements \[10, 20, 30, 40, 50, 60, 70, 80, 90], the output should be \[40, 30, 20, 10, 50, 60, 70, 80, 90].

```pseudocode
subalgorithm reverseFirstK(q,k) is:
	if size(q) < k or k < 0 then
		@throw exception
	end-if
	
	init(s) //stack
	init(q2) //queue
	for i <-1,k execute:
		push(s,pop(q))
	end-for
	while not isEmpty(q):
		push(q2,pop(q1))
	end-while
	
	while not isEmpty(s):
		push(q,pop(s))
	end-while
	while not isEmpty(q2):
		push(q,pop(q2))
	end-while
	destroy(s)
	destroy(q2)
end-subalgorithm
```

