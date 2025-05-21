# Huffman Coding
___
Class: [[DynamicalSystems]]
Date: May 21st, 2025
___

## Algorithm Description
1. Compute the frequency of every character 
2. Create a tree for each character and assign a priority to every tree (the priority is the frequency)
3. Store the roots in a priority queue
4. At each step, remove the 2 trees having the smallest values and join them. Have the priority of the new tree be the sum of the 2 priorities
5. Now, every character is a leaf. The code for every letter is a sequence of 0s and 1s 

## Example
![[Huffman Coding 2025-05-21 16.15.31.excalidraw]]

## Advantages of Huffman Coding 
- The characters witht 