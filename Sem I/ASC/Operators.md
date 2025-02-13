# Operators
___
Class: [[ ASC]]
Type: 
Tags: # 
Date: November 21st 2024
Teacher: [[]]
___

Notes:
used for combining, comparing, modifying and analysing the operands
operators perform computations only with constant SCALAR values computable at assembly time, with the following exceptions:
- adding or subtracting a constant from a pointer 
- the offset computation formula 

>[!tip] most operators have an equivalent instruction

>[!warning] expression evaluation is performed on 64 bits 

Examples:
```nasm 
mov eax, [a + 2]
mov eax, ebx + 2 ; syntax error! 
				 ; the contents of registers are not computable at assembly time
```


## Type Operators 
**BYTE, WORD, DWORD, QWORD, TWORD**
Used for memory stored operands only 
Example:
```nasm 
data segment 
	v d? ...
	a d? ... 
	b d? ...

code segment
	push v ; the offset of v (32 bits) is pushed to the stack

```

```nasm
	push 15 ; immediate values are implicitly treated as being on 32 bits 
	pop [v] ; syntax error, size not specified
	pop 15 ; syntax error, 15 is an immediate value, not an l value
	pop [15] ; syntax error, size not specified
	pop dword [15] ; correct syntactically, but usually results in a runtime error (memory violation)
	mov [v], 0 ;syntax error, operation size not specified 
	mov byte [v], 0 ;ok
	mov [v], byte 0 ;ok 
	div [v] ;syntax error, operation size not specified 
	imul [v+2] ;syntax error, operation size not specified 
	imul byte [v+2] ;ok 
	mov a, b ;syntax error, a is not an L value
	mov [a], b ;syntax error, operation size not specified 
	mov ah, b ;syntax error, an offset can only be on 16 or 32 bits
	mov ax, b ;ok - the offset is considered to be a 16-bit value
	mov eax, b ;ok - the offset is considered to be a 32-bit value
	mov a, [b] ;syntax error, a is an R-value 
	mov [a], [b] ;syntax error, 2 explicit operands can't be from the memory
	mul v ; syntax error, the explicit operand can't be an immediate value 
	mul [v] ;syntax error, operation size not specified 
	pop byte [v] ; invalid combination of opcode and operands, the stack is organised on 16 and 32 bits 
	pop qword [v] ; instruction not supported on 32 bit mode 
	
	
	
```

^824a25
