# Linked List on Array
___
Class: [[DataStructures&Algorithms]]
Type: Lecture
___

Instead of having the elements of the list occupy consecutive positions in the array, have 2 separate arrays
- `elems`, where the information is stored
- `next`, where the links are stored

An additional variable `head` is used to store the *position of the head* within the `next` array

The `next` array actually stores links for 2 lists:
- The *list of elements* in the array
- The *list of free spaces* in the array

## Interface
![[16SLLA_DLLA.pdf]]