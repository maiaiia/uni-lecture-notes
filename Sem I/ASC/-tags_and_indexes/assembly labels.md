[[ASC]]
user-defined names that point to data or memory areas inside the segment where they were created
labels store an offset (since the labels are created inside a segment)

>[!important] the value associated with a label in assembly is an integer number representing the (near) address of the instruction or directive following that label

2 types of labels:
**code labels**
- present at the level of instruction sequences for defining the destinations of the control transfer during a program execution
- defined by adding a ":" at the end of the label 
- example of a code label:
```nasm

segment code
	start:
		label1:
			....do smth

```

**data labels** 
- symbolic identification for some memory locations (in a similar manner to [[variable|variables]])
- no ":" when defining them (ex: <u>a</u> dw 1987, 0x42)

>[!important] regardless of their type, labels can appear in both the data and the code segments