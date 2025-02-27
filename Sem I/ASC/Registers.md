# Registers
---
Class: [[ ASC]]
Type: Lecture
Tags: # 
Date: October 10th 2024
___
![[Registers 2024-12-03 20.56.22.excalidraw]]
# Def
**Registers** are *storage capacities* (ro. unitati de stocare), very small in terms of size
	- 8, 16, 32, or 64 bits
	- very fast access speed
	- used for temporary storing the operands with which a processor currently works

- 16 bit programming: no restrictions
- 32 bit programming & above: added security restrictions
- there are a total of 17 registers (16 accessible, one flag register)

# EU (Executive Unit) Registers
## The ALU - Arithmetic Logic Unit
- performs 
	- *Arithmetic Operations*: addition, subtraction (multiplication and division)
	- *Bit-Shifting Operations*: useful for addition
	- *Logical Operations*:  AND, OR, XOR, NOT
- besides these 3 tasks, the **ALU** will set the values within the **EFLAGS** register accordingly
## The 8 General Registers of the EU (Executive Unit)

### Types of General Registers
#### Data Registers
- **EAX** - Accumulator register 
	- the most used register in any architecture
	- used by most of the instructions as one of their operands
	- EAX - *E*xtended AX 
- **EBX** - Base register
	- in 16 bit programming, this register was used in addressing 
- **ECX** - Counter register
	- mostly used as a numerical upper limit for instructions that need repetitive rounds (loops)
	- (before activating a loop, initialise this upper limit)
- **EDX** - Data register 
	- auxiliary register
	- frequently used with other registers (mostly with EAX) when the result exceeds a doubleword
	- ex: quadwords are represented like this: EDX:EAX
![[Register2.excalidraw]]
#### [[src/Sem I/ASC/-tags_and_indexes/stack| Stack]] Registers
- ESP - Stack Pointer 
	- points to the last element introduced into a stack
- EBP - Base Pointer 
	- points to the first element introduced into a stack
point at the current executing stack frame (activation record)

A [[src/Sem I/ASC/-tags_and_indexes/stack|stack]] is a data structure
#### Index Registers
- ESI - Source Index
- EDI - Destination Index

>Arrays, strings etc. --> can be worked with, but not defined
 INDEXING enables us to work with these data structures
 so indexing is used for mapping arrays, strings etc. in memory
 so they work in a similar manner to the stack registers

#### EFLAGS

^657f8a
- A bit configuration of the EFLAGS register shows a synthetic overview of the execution of each instruction
- out of its 32 bits, only 9 are used as [[Flags|flags]]
- if you need to remember a certain previous state of EFLAGS, you can push EF on the [[src/Sem I/ASC/-tags_and_indexes/stack|stack]], and then pop it 

# BIU (Bus Interface Unit) Registers
## Address Registers
### Segment Registers 

^9d2fda
- **CS** - Code Segment ^c6b8ef
- **DS** - Data Segment 
- **SS** - Stack Segment
- **ES** - Extra (Data) Segment
- **FS** 
- **DS**

> [!important] the *segment registers* memorise the *segment selectors* of the currently active segments respective to their *type* 
> FS and DS, however, can store selectors pointing to any type of segment

### EIP
^9c82a2
**EIP** - Extended Instruction Pointer
- contains the offset of the current instruction inside the current *code* segment