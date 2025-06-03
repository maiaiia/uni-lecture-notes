# Seminar 7
___
Class: [[DataStructures&Algorithms]]
Type: Seminar
Tags: # 
Date: June 3rd, 2025
___

## 1. Build the binary tree for an arithmeic expression
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
	- have recursive call on both children (if they exist)
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
>	push(q, NIL)
>	currentLevel <- 0
>	while not isEmpty(q) execute
>		currentNode <- pop(q)
>		if currentNode = NIL then 
>			currentLevel <- currentLevel + 1
>			push(q, NIL))
>		else
>			if currentLevel = k then
>				print([currentNode].info)
>			if [currentNode].left != NIL then 
>				push(q, [currentNode].left)
>			if [currentNode].right != NIL then
>				push(q, [currentNode].right)
>```

