# Huffman Coding
___
Class: [[DataStructures&Algorithms]]
Date: May 21st, 2025
___
## Algorithm Description
1. Compute the frequency of every character 
2. Create a tree for each character and assign a priority to every tree (the priority is the frequency)
3. Store the roots in a priority queue
4. At each step, remove the 2 trees having the smallest values and join them. Have the priority of the new tree be the sum of the 2 priorities
5. Now, every character is a leaf. The code for every letter is a sequence of 0s and 1s 

>[!important]
> The final tree may not be unique, but encoding and decoding words when a certain Huffman tree is given is

## Example
Original Message: WE WERE HERE
![[Huffman Coding 2025-05-21 16.15.31.excalidraw]]

| Letter | Code |
| ------ | ---- |
| e      | 0    |
| w      | 100  |
| r      | 101  |
| space  | 110  |
| h      | 1110 |
| .      | 1111 |
Encoding of the original message: *100*0*100*0*101*0*1110*0*101*0 (every second letter highlighted for clarity)

## Advantages of Huffman Coding 
- The characters with the highest frequencies have the smallest height 
- No character's code is the prefix of another character's code