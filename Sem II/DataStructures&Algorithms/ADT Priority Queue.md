# ADT Priority Queue
___
Class: [[DataStructures&Algorithms]]
Type: Lecture
Tags: #datatype #HPF 
___
## Interface
![[10Priority Queue.pdf]]
## Representation
1. **[[ADT Dynamic Array|Dynamic Array]]**
2. **[[Linked Lists]]**
3. **[[BinaryHeap]]** 
4. **[[Binomial Heap]]**

| Operation | Sorted <br>Array / List | Non-sorted <br>Array / List | Binary Heap  | Binomial Heap    |
| --------- | ----------------------- | --------------------------- | ------------ | ---------------- |
| push      | $O(n)$                  | $\Theta(1)$                 | $O(\log_2n)$ | $O(log_2n)$      |
| pop       | $\Theta(1)$             | $O(n)$                      | $O(\log_2n)$ | $\Theta(log_2n)$ |
| top       | $\Theta(1)$             | $O(n)$                      | $\Theta(1)$  | $O(\log_2n)$     |
