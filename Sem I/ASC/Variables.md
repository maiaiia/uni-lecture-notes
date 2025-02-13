# Variables
___
Class: [[ ASC]]
Tags: # 
___
## [[data type|Datatypes]]
- in assembly, a [[data type]] refers only to the SIZE of representation
	- Byte (8bits)
	- Word (16 bits)
	- DoubleWord (32 bits)
	- QuadWord (64 bits)
## [[Sem I/ASC/Registers|Registers (Predefined Variables)]]
- EAX, EBX, ECX, EDX - 32 bits = 4B, the **E**xtended registers
	- AX, BX, CX, DX - 16 bits (original size of registers)
	- AH (**H**igh), AL(**L**ow), BH, BL, ..., DL - 8 bits
- RAX, RBX, RCX, RDX - 64 bits
- ESI, EDI, ESP, EBP
- EIP, EFLAGS
registers are double words (32 bits = 4B)
![[Register2.excalidraw]]
## User Defined Variables 
- constants are not stored in memory
- db, dw, dd, dq - declaration
- examples:
```nasm
a dd  5            ; a is a doubleword of 32 bits, equal to 5 (a=00...00101)
b dd 5, 6          ; b is an array of 2 double words (b=[00..00101][00...00100]
                   ; - 32 bits)
m equ 10           ; m is a constant, not stored in memory
c dw 0x123A,01234h ; by adding 0x at the beginning or 0...h format, we signal 
                   ; that the value is in hex
d db 'a'
e db "abcd",' '\0' ; <=> e db 'a', 'b', 'c', 'd', '\\0', remember adding the 
                   ; ending character!!!
f db 0011001bc     ; f is a base2 number

x resb 5           ; reserves 5 bites of memory
y resw 2           ; reserves equiv or 2 words
z resd 3           ; reserves equiv or 3 double words

```

intel uses [[Little Endian|little endian]] format for memory