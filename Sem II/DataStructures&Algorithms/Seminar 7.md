# Seminar 7
___
Class: [[DataStructures&Algorithms]]
Type: Seminar
Tags: # 
Date: June 3rd, 2025
___

## 1. Build the binary tree for an arithmetic expression
>[!example]
>$(a+b)\cdot c-(d+e\cdot f)+g$ 

1. Build the postfix form of the expression $\rightarrow ab + c \cdot def\cdot + - g +$

![[Seminar 7 2025-06-03 10.09.29.excalidraw]]

### Representation
```tabs
tab: Node
info: Telem 
left, right: $\uparrow$Node
tab: BT 
root: $\uparrow$Node
tab: Stack / Queue
init(s)
push(s,e)
pop(s)$\rightarrow$e
top(s)$\rightarrow$e
isEmpty(s)$\rightarrow$e
```

### Algorithm
>[!code] buildTree - $\Theta(\text{length of expression})$
>```pseudocode
>Subalgorithm buildTree
>for e in expr execute
>	if e is an operand then
>		allocate(node)
>		[node].info <- e
>		[node].left <- NIL
>		[node].right <- NIL
>		push(s,node)
>	else // e must be an operator (postfix)
>		second <- pop(s)
>		first <- pop(s)
>		allocate(node)
>		[node].info <- e
>		[node].left <- first
>		[node].right <- second
>		push(s,node)
>[tree].root<-top(s)
>```


## 2. You are given a binary tree which represents the ancestors of a person up to the $\text{n}^\text{th}$ generation
- left subtree $\rightarrow$ maternal line
- right subtree $\rightarrow$ paternal line
![[Seminar 7 2025-06-03 10.25.00.excalidraw]]
### a. Print all the females from the tree
(in the example, they are x, z, w and possibly a (the gender of a is unknown))
#### 1. Recursive solution
- for the current node
	- print its left child (if it exists)
	- have a recursive call on both children (if they exist)
>[!code]- subalgorithm printRecursive(node: Node)
>```pseudocode
>subalgorithm printRecursive(node: Node ptr)
>if [node].left != NIL then
>	print([[node].left].info)
>	printRecursive([node].left)
>	printRecursive([node].right)
>
>subalgorithm printFemaleNodes(tree)
>	if tree.root is not NIL
>		printRecursive(tree.root)
>```

>[!important]
>Notice how recursive algorithms generally need 2 functions 
>Additionally, a decision must be made with regards to whether the parameter of the recursive function can be NIL
#### 2. Non-recursive solution
- while the stack / queue is not empty
	- pop the top element
		- print the left child of the top element (if it exists)
		- push both children (if they exist)
>[!code]- subalgorithm printIterative(node: Node$\uparrow$)
>```subalgorithm printIterative(tree: Tree)
>init(s)
>push(s, getRoot(tree))
>while not isEmpty(s)
>	current <- pop(s)
>	if [current].left is not NIL then
>		print([[node].left].info)
>		push(s, [node].left)
>		push(s, [node].right)
>```

#### 3. Level traversal solution
- Assuming a complete tree, we can do a level order traversal and print every second element

### b. Display all ancestors of degree $k$ of the root
>[!example] Example
> $k = 2 \rightarrow z, t, v, w$
#### 1. Recursive solution
- recursively with a function which has as parameters either 
	- node, k, currentLevel
	- node, distanceToLevelK
#### 2. $1^\text{st}$ iterative solution 
- If we assume the tree is complete, the range of values for the $k^\text{th}$ ancestors is known ($2^k-1 \rightarrow 2^{k+1}-1$)
- we can traverse the tree using a level-traversal
#### 3. $2^\text{nd}$ iterative solution
- use a stack or queue where we push \<node, current_level\> pairs

#### 4. $3^\text{rd}$ iterative solution
- use two queues / stacks
- alternate between pushing nodes from one to the other (pop a child from one stack and push its children to the other)
- have a counter that keeps count of the current level
#### 4. $4^\text{th}$ iterative solution
- use one queue that stores nodes and a variable that stores the current level
- signal that a level is done by pushing NIL to the stack
![[Seminar 7 2025-06-03 10.57.51.excalidraw]]

>[!code]- subalgorithm ancestors(tree, k) 
>```pseudocode
>subalgorithm ancestors(tree, k) is 
>	init(q)
>	if tree.root != NIL 
>		push(q, tree.root)
>		push(q, NIL)
>	currentLevel <- 0
>	while not isEmpty(q) execute
>		currentNode <- pop(q)
>		if currentNode = NIL then 
>			currentLevel <- currentLevel + 1
>			if not isEmpty(q) then
>				push(q, NIL))
>		else
>			if currentLevel = k then
>				print([currentNode].info)
>			if [currentNode].left != NIL then 
>				push(q, [currentNode].left)
>			if [currentNode].right != NIL then
>				push(q, [currentNode].right)
>```

## 3. Display all nodes visible from a top view 
Desired output:: 3 10 6 17 8 59
![[Seminar 7 2025-06-03 11.12.20.excalidraw]]
### Dynamic Programming-like solution
Regard the tree as if it were divided into columns (negative columns are allowed)

| Node | Column |
| ---- | ------ |
| 6    | 0      |
| 10   | -1     |
| 3    | -2     |
| 4    | 0      |
| 25   | 0      |
| 8    | 2      |
| etc  |        |

#### I) Sorted Map
Use a \<column, firstNode\> map, where the *first* node encountered on a certain level is stored. Display the values sorted by column
![[column-first-map]]
#### II) Regular Map + Minimum Distance
Note that the map does not actually need to be sorted. If the index of the leftmost column is known, then the elements having the keys in the range \[leftmostColumn, leftmostColumn + mapSize - 1\] can simply be retrieved in increasing order of their key
#### III) Dequeue 
- Store the minimum (minLeft) and maximum (maxRight) column found at any given moment
- Use a double ended queue and store the results in the order they were found (pushing either to the left or to the right, depending on whether minLeft or maxRight is updated)
>[!code] subalg topView(tree):
>```pseudocode
>subalg topView(tree):
>	init(dq) // dequeue <node, distance> pairs
>	init(topView) // nodes, dequeue
>	if tree.root != NIL then
>		push_back(dq, <tree.root, 0>)
>		push_back(topView, tree.root)
>		minLeft <-0
>		maxRight <-0
>	while nod isEmpty(dq) execute:
>		<node,d> <-pop_frond(dq)
>		if [node].left != NIL then
>			if d-1 < minLeft then
>				minLeft <- d - 1
>				push_front(topView, [node].left)
>			push_back(dq, <[node].left, d-1>)
>		if [node].right != NIL
>			if d+1 > maxRight then 
>				maxRight <- d+1
>				push_back(topView, <[node].right, d+1>)
>			push_back(dq, <[node].right, d+1>)
>	while nod isEmpty(topView)
>		node <- pop_front(topView)
>		print([node].info)
>		
>```

>[!Warning]
>The implementation above is not always correct
>![[Seminar 7 2025-06-03 11.42.06.excalidraw]]
>Here, the expected output is $2,1,3,8$, but what the algorithm returns is $2,1,3,9$

In order to fix this problem, tweak the implementation like so: 
- have dq store triples (node, distance, currentLevel)
- have topView store pairs (node, level)
- updating minLeft remains unchanged
- updating maxRight must also take into account whether maxRight is equal to d+1. In this case, if the level where the previous node was found is equal to the current level, update maxRight to the new node (since the node that belongs to the rightmost branch is desired)