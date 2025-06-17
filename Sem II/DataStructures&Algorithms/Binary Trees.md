# Binary Trees
___
Class: [[DataStructures&Algorithms]]
Type: Lecture
___
## Terminology
| Term                 | Meaning                                                                                                            |
| -------------------- | ------------------------------------------------------------------------------------------------------------------ |
| full tree            | every internal node has exactly two children                                                                       |
| complete tree        | a full tree with all leaves on the same level                                                                      |
| almost complete tree | a complete tree except for the last level, where nodes are completed from left to right ([[BinaryHeap]] structure) |
| degenerate tree      | every internal node has exactly one child (so just a chain of nodes)                                               |
| balanced tree        | the difference between the height of the left and right subtrees is at most 1 *for every node from the tree*       |

## Properties
- the number of nodes in a complete binary tree of height $N$ is $2^{N+1}-1$
- the maximum number of nodes in a binary tree is reached when the tree is complete
- the minimum number of nodes in a binary tree of height $N$ is $N+1$ - if the tree is degenerate
- A binary tree with $N$ nodes has a height between $\log_2N$ and $N - 1$


