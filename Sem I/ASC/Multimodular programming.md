# Multi-modular programming
___
Class: [[ ASC]]
Type: 
Tags: # 
Date: December 11th 2024
Teacher: [[Alexandru Vancea]]
___

ASM
global - export
extern - import

we can communicate between modules through the stack, registers or the global/extern mechanism presented above

C


>[!important] do not use include when asked to write a program using multiple modules!!!


```nasm
; main. asm

extern sum
global a

data ...
	a dd 0
	b dd 0
	format1 db "%d %d", 0
	format2 db "%d", 0 
code ...
	start:
		push dword b 
		push dword 1 
		push dword format1 
		call [scanf] 
		add esp, 4 * 3 

		push dword [b]
		push dword [a]
		call [sum] 
		add esp, 4 * 2 

		push eax
		push format2 
		call [printf]
		add esp, 4 * 2 
		
		push dword 0 
		call exit 

```

```nasm 
; sum.asm

extern a
	global sum

code segment...
sum:
	push EBP
	mov EBP, ESP ;the first 2 lines are called the "prologue"
	mov EAX, [EBP+8]
	add EAX, [EBP+0xc]
	pop EBP ; epilogue
	ret 
```