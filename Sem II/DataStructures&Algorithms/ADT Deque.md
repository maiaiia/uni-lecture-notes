# ADT Deque
___
Class: [[DataStructures&Algorithms]]
Type: Lecture
___

## Interface
- operations for both stack and queue are available: *push_front*, *push_back*, *pop_front*, *pop_back*, *top_front*, *top_back*

## Representations
- **Circular Array**
- **[[Linked Lists#^a04676|DLL]]**
- **[[ADT Dynamic Array|Dynamic Array]] of constant size arrays**

3. Dynamic Array of constant size arrays
	- Fields
		- block size
		- dynamic array with addresses of the blocks
		- capacity of the dynamic array
		- first and last occupied positions in the dynamic array
		- first occupied position in the first block and last occupied position in the last block
	- Place the elements in fixed size arrays (blocks)
	- Keep a dynamic array with the addresses of these blocks
	- Every block is full, except for the first and last ones
	- The first block is filled from right to left and the last one from left to right
	- If the first or last block is full, a new one is created and its address is put in the dynamic array (sort of like [[Memory#^b0f470|paging]], isn't it)
	- If the dynamic array is full, a larger one is allocated, and the addresses of the blocks are copied (but the actual elements are not moved)
>[!Tip]
>This representation allows for accessing elements based on positions
