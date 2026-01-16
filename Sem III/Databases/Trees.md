---
Class: "[[Databases]]"
date:
type: Lecture
---
# Trees

## ISAM - Indexed Sequential Access Method

ISAM is a static file organisation technique, good for *equality and range searches.* It performs best when the data size / distribution are relatively static.

This is a *static* file organisation technique, i.e.
- once the separator levels have been constructed, they never change
- number and position of leaf pages is fixed 
- insertions and deletions affect leaf pages only

The structure of the pages is tree-like, composed of 3 sections:
- non-leaf pages 
- primary leaf pages 
- overflow pages

Non-leaf pages contain a series of pointers and keys, which are used to traverse the tree according to the looked up key (range).
Leaf pages contain the actual entries (the number of entries in a leaf page is equal to the number of pointers in a non-leaf page - 1).
Overflow pages have the same structure as leaf pages. They are added when insertions occur after the creation of the ISAM tree.

![[isam-db]]


Operations:
- insertion
	- find the corresponding leaf page, add the entry
	- if there is no space on the page, add an overflow page 
- deletion
	- find the leaf page that contains the entry, remove the entry
	- if an overflow page is emptied, remove it

>[!Check] Benefits
> Leaf pages are sorted sequentially in a file when the structure is created in order to support range searches (very fast!)

>[!Warning] Issue
>Long overflow chains can develop. These chains are usually not sorted (in order to optimise inserts)

## 2-3 Trees

- every node has either one or 2 keys 
- every non-terminal node has either 2 or 3 children (n keys in a node => n + 1 children)
- all leaf nodes are on the same level

## B-Trees
A B-tree is a generalisation of 2-3 trees.

>[!Definition] B-tree of order $m$
>1. if the root is not a terminal node, it has at least 2 subtrees
>2. all terminal nodes are on the same level (the tree is perfectly balanced)
>3. every non-terminal node has at most $m$ subtrees
>4. a node with $p$ subtrees has $p-1$ ordered value keys (asc) $K_1<K_2<\dots<K_{p-1}$
>5. every non-terminal, non-root node has at least $\cfrac{m}{2}$ subtrees
>

>[!Tip]
>Although operations on B-trees technically have the same complexity as operations on binary trees (logarithmic), they are preferred over the latter because of how cache memory works (we can choose m in such a way that the size of a node is close to the size of a segment in the cache memory, thus minimising the number of I/O operations)
### Operations
#### searching
Quite trivial, similar to binary search trees. 

#### insertion


#### deletion
