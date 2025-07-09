# ADT Queue
___
Class: [[DataStructures&Algorithms]]
Type: Lecture
Tags: #datatype #FIFO
___
## Interface
![[09Queue.pdf]]

## Representation
1. **[[Dynamic Array|Dynamic Array]]** - use a circular array
2. **[[Linked Lists]]**

| Problem                              | Circular Array Representation                                                                                                                                                                                                                       | SLL Representation                                                                                                      | DLL Representation |
| ------------------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------- | ------------------ |
| Where are the front and rear placed? | they move around throughout the execution (no fixed position) Having either the front at the beginning and the rear at the end or the other way around are equally bad ($\Theta(n)$).<br><br>Insertion can be improved if the tail is also stored s | having either the front at the beginning and the rear at the end or the other way around are equally good ($\Theta(1)$) |                    |

