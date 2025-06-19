# ADT Stack
___
Class: [[DataStructures&Algorithms]]
Type: Lecture
Tags: #LIFO 
___
## Interface
![[08Stack.pdf]]

## Representation
- **Arrays**
	- *Static Array* - fixed-capacity stack
	- *[[ADT Dynamic Array|Dynamic Array]]*  
- **[[Linked Lists]]**

| Problem                               | Array Representation | SLL Representation                  | DLL Representation                  |
| ------------------------------------- | -------------------- | ----------------------------------- | ----------------------------------- |
| Where is the top of the stack placed? | end of the array     | beginning of the SLL                | either end                          |
| Fixed capacity implementation         | use static array     | store max capacity and current size | store max capacity and current size |

## Other Operations
1. **GetMinimum** in constant time
	- Keep an auxiliary stack (*SpecialStack*), containing as many elements as the original stack, but storing only the minimum value up to each element
	- *Optimization*: instead of pushing the minimum after each element, only push it to the SpecialStack when the newly pushed value is $\leq$ the minimum