# Seminar 6
___
Class: [[DataStructures&Algorithms]]
Type: 
Tags: # 
Date: May 23rd, 2025
___

## 1. Iterator for a SortedSet - HashTable with separate chaining 
>[!Example] 
>SortedSet 5, 28, 19, 15, 20, 33, 12, 17, 10 
>m = 9, h(e) = e % m 

| e    | 5   | 28  | 19  | 15  | 20  | 33  | 12  | 17  | 10  |
| ---- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| h(e) | 5   | 1   | 1   | 6   | 2   | 6   | 3   | 8   | 1   |
![[Seminar 6 2025-05-23 12.25.38.excalidraw]]

### Approach 1 - $\Theta(n * m)$ for a full iteration
*init* - $(\Theta(m))$
- Create a copy of the HT (!! assuming the linked lists in the HT are sorted)
	- new array, same nodes (it.copy\[i] $\leftarrow$ s.elems\[i])
	- the advantage of having pointers to the original nodes is that only the first node of each array must be copied
- find and store the minimum (by value)
*getCurrent* - $\Theta(1)$
- return the minimum
*next* - $\Theta(m)$
- remove the old minimum (it.copy\[h(min)] $\leftarrow$ \[it.copy\[h(min)]])
- find and store the new minimum 
*valid* - $\Theta(1)$
- check if minimum is $\text{NULL\_TVALUE}$

>[!code]
>```pseudocode
>subalg print(s): //Theta(m * n)
>	iterator(s,it) //Theta(m)
>	while valid(it) execute: //Theta(1)
>		e <- getCurrent(it) //Theta(1)
>		print(e)
>		next(it) //Theta(m)
>	
>```

### Approach 2 -  Merge each pair of linked lists into one sorted SLL
*next*, *getCurrent*, *valid* $\rightarrow \Theta(1)$
*init* - $\Theta(m \cdot n)$
Merging: 
$n$ elements, $m$ positions in the table $\Rightarrow$ on avg. $\cfrac{n}{m} = \alpha$ elements in a list
$l_1+l_2\rightarrow l_{12}$ ($\alpha + \alpha = 2* \alpha$)
$l_{12}+l{3}\rightarrow l_{123}$ ($2*\alpha + \alpha = 3* \alpha$)
$\vdots$
$l_{1\dots m-1}+l_m \rightarrow l_{1\dots m}$  ($m\cdot \alpha$)
Total complexity: $\approx \alpha \cdot \cfrac{m \cdot (m+1)}{2} = \cfrac{n}{m} \cdot \cfrac{m \cdot (m+1)}{2} \in \Theta(n \cdot m)$
### Approach 3 - Merge using a binary min-heap
*init* - $\Theta(n\cdot\log_2m)$
- In the binary min-heap, keep the first node of every list
- at each step, remove the first node (min) and add its next (if it exists)

## 2. ADT BidirectionalMap 
Both the key and the value must be unique
- $\text{init}(bdm)$ - $\Theta(1)$
- $\text{insert}(bdm,k,v)$ - $\Theta(1)$ on avg. amortised
- $\text{search}(bdm, k)$ - $\Theta(1)$ on avg.
- $\text{reverseSearch}(bdm,v)$ - $\Theta(1)$ on avg.
- $\text{remove}(bdm, k)$ - $\Theta(1)$ on avg.

