# Binary Heap
___
Class: [[DataStructures&Algorithms]]
Type: Lecture
___
## General
Heaps are a hybrid between a dynamic array and a binary tree, in the sense that *elements are stored in a dynamic array*, but *visualised as binary trees*.
- **Heap Structure**: Every node has *exactly 2 children*, except for the last two rows. There, the children of the nodes are completed *from left to right*
- **Heap property**: $a_i \geq a_{2i}$ and $a_i \geq a_{2i+1}$ (when $a_{2i}, a_{2i+1}$ exist)

## Interface
![[18BinaryHeap.pdf]]
## Building a Heap
In order to efficiently transform an array into a heap:
- take the first half of the array
- from right to left, call bubble down on each element

This is basically like calling heapify on binary heaps that get increasingly larger (i.e. recursively building a binary heap in a bottom-up approach)
## Heap Sort
Assume you need to sort an array in ascending order. Then, build a MAX heap using the algorithm described in the previous section, and remove the root until the tree is empty. In doing so, at each step, the last leaf is replaced with the maximum value in the array. Thus, after the execution has ended, the array will be sorted in ascending order and no additional data structure was needed