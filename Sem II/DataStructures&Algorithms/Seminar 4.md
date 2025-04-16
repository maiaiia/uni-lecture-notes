# Seminar 4
___
Class: [[DataStructures&Algorithms]]
Type: 
Tags: # 
Date: April 16th, 2025
___

Write a sub-algorithm to merge 2 sorted simply linked lists 
$l_1: 4 \rightarrow 9 \rightarrow 10 \rightarrow 18$
$l_2: 1\rightarrow 6 \rightarrow 7 \rightarrow 8 \rightarrow 9$
$\text{res}: 1 \rightarrow 4 \rightarrow 6 \rightarrow 7 \rightarrow 8 \rightarrow 9 \rightarrow 9 \rightarrow 10 \rightarrow 18$

In the case of linked lists, if the original data is not needed after the computation, we can simply merge the 2 lists without making copies of the nodes 
![[linkedListMergeSort]]

```tabs
tab: Node
$\text{info: TComp}$
$\text{next: }\uparrow\text{ Node}$
tab: SList
$\text{head: }\uparrow\text{ Node}$
tab: subalg merge
>[!code]
>```
>subalg merge(l1,l2,lret)
>	^Node c1=l1.head, c2=l2.head
>	while (c1 != NIL or c2 != NIL)
>		if (c2 = NIL or c1)
>	end while
>```
```


