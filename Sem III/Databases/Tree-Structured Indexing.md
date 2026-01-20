---
Class: "[[Databases]]"
date:
type: Lecture
---
# Tree Structured Indexing

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

- similar to an [[AVL Trees |AVL tree]], but every node has either one or 2 keys 
- every non-terminal node has either 2 or 3 children (n keys in a node => n + 1 children)
- all leaf nodes are on the same level (perfectly balanced)

## B-Trees
A B-tree is a generalisation of 2-3 trees.

>[!Definition] B-tree of order $m$
>1. if the root is not a terminal node, it has at least 2 subtrees
>2. all terminal nodes are on the same level (the tree is perfectly balanced)
>3. every non-terminal node has at most $m$ subtrees
>4. a node with $p$ subtrees has $p-1$ ordered value keys (asc) $K_1<K_2<\dots<K_{p-1}$
>5. every non-terminal, non-root node has at least $\cfrac{m}{2}$ subtrees (round up)
>

>[!Tip]
>Although operations on B-trees technically have the same complexity as operations on binary trees (logarithmic), they are preferred over the latter because of how cache memory works (we can choose m in such a way that the size of a node is close to the size of a block in the cache memory, thus minimising the number of I/O operations)
### Operations
#### searching
Quite trivial, similar to binary search trees. 

#### insertion

Perform a search to find the (leaf) node where the key should be inserted. Add the key to the correct position. After this point, two situations may occur
1. The number of keys in the leaf falls in the \[m/2, m-1] range --> stop
2. The node overflows

>[!Tip]
>Note that keys must be unique! If a value equal to the key is found during the search, stop the algorithm.

In we find ourselves in the second case, we need to *split* the leaf node into 2:
- pick the middle key $K_m$ in the current node and move it to the parent node (say between $K_i$ and $K_j$)
- now the pointer between $K_i$ and $K_m$ will point to the left half of the original node and the one between $K_m$ and $K_j$ will point to the right half

We have, however, increased the number of keys in the parent node by one. This may lead to an overflow in the parent node. In this case, repeat the splitting algorithm until the resulting tree respects all properties of a B-tree.

>[!Important]
>If we end up propagating the split all the way up to the root (and the root overflows as well), pick the middle key in the root and turn that into the new root.
#### deletion
In a similar manner to how insertions may cause overflows, deletions may cause underflows (i.e. a non-root node may have less than $\cfrac{m}{2}$ children).

Search for the key. 
1. The key is in the leaf node
	1. if the leaf has more than the minimum number of children, simply delete the key --> done
	2. if the leaf has exactly the minimum number of children (2 possibilities)
		1. the node has a direct sibling with more than the minimum number of children.
			- in this case, a key from one sibling is burrowed (either the leftmost key of the right sibling or the rightmost key of the left sibling). 
			- The burrowed value is transferred to the parent node, and a key (the one between the 2 siblings) will be transferred to the original node (a rotation basically)
		2. both siblings have the minimum number of nodes. 
			- in this case, we merge the current node with either one of the siblings AND a key from the parent tree (the key between the two siblings)
			- now, the leaf nodes definitely have a correct number of keys, BUT an underflow may occur in the parent node.
			- if an underflow has occurred, we repeat the algorithm of burrowing (from a direct sibling) or merging, going upwards one level at a time 
2. The key is in an internal node
	- choose either the inorder predecessor or the inorder successor as a replacement in the current node (if possible)
	- if not, merge with one key from the parent

## B+ Trees

Built on top of B-Trees, B+ trees have the following properties:
1. The leaves contain all the keys 
2. The leaves form a doubly linked list

Leaf level is a dense index, other levels are sparse indexes