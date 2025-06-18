# Binary Search Tree
___
Class: [[DataStructures&Algorithms]]
Type: Lecture
Tags: # 
Date: May 21st, 2025
___
## General
- Left subtree contains values <= subtree root and right subtree >= subtree root
- *Inorder* traversal yields the values in increasing order (according to the relation used)
- Positions can be deduced by keeping the total number of nodes in the left subtree of each node
>[!Warning] Delete with duplicate values
>If the BST where duplicate values are allowed was built using the '$\leq$' relation, deletion must be implemented by swapping a node with its **predecessor**
## Interface
![[20BST.pdf]]

