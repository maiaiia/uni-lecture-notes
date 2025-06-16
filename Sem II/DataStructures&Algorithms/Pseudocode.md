# Pseudocode
___
Class: [[DataStructures&Algorithms]]
Type: Exam Prep
___

>[!Warning] Array indexing starts from 1
## Symbols

| Symbol          | Meaning                                        |
| --------------- | ---------------------------------------------- |
| @               | non-standard instruction                       |
| //              | one line comment                               |
| read            | standard instruction for reading data          |
| print           | standard instruction for printing data         |
| $\leftarrow$    | assignment                                     |
| =               | <b>testing</b> the equality of 2 variables     |
| i: *Integer*    | defining a variable as an integer              |
| a: T\[]         | array with unknown size and elements of type T |
| a: T\[NR]       | array with fixed size                          |
| p: $\uparrow$ T | pointer to a variable of type T                |
| allocate(p)     | pointer allocation                             |
| free(p)         | pointer de-allocation                          |
| *NIL*           | invalid address                                |
| .               | accessing a field of a variable                |
| \[p]            | dereferencing a pointer                        |
## Code Snippets

| Code Snippet                                                                                                                    | Meaning                         |
| ------------------------------------------------------------------------------------------------------------------------------- | ------------------------------- |
| **if** condiiton **then** <br>    @instructions<br>**else**<br>    @instructions<br>**end-if**                                  | if conditional                  |
| **for** i $\leftarrow$ initial, final, step **execute**<br>    @instructions<br>**end-for**                                     | for loop                        |
| **while** condition **execute**<br>    @instructions<br>**end-while**                                                           | while loop                      |
| **subalgorithm** name (formal parameter list) **is**:<br>    @instructions <br>**end-subalgorithm**                             | subalgorithm - nothing returned |
| **function** name (formal parameter list) **is**:<br>    @instructions <br>	name $\leftarrow$ v // return v<br>**end-function** | function - returns smth         |
## Specifications

| Specification | Meaning                                             |
| ------------- | --------------------------------------------------- |
| pre           | preconditions (e.g. parameter types)                |
| post          | postconditions (e.g. )                              |
| throws        | exceptions thrown                                   |
| x'            | denotes the new value of x (used in postconditions) |
## Generic Data Types
| Data Type | Meaning                                                                                |
| --------- | -------------------------------------------------------------------------------------- |
| TElem     | Generic Data Type                                                                      |
| TComp     | Generic Relation for Comparisons<br>may sometimes be replaced by $\geq$, $<$, $=$, etc |
|           |                                                                                        |
>[!Warning] When it comes to relations, assume that, in case of equality, TRUE is returned

