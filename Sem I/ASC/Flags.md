# Flags
___
Class: [[ ASC]]
Type: Lecture + Lab
Tags: # 
Date: October 14th 2024
___
Notes:
## Def
- A flag is an indicator represented on 1 bit 
- all flags are stored in a 32bit register, called [[Registers#^657f8a|EFLAGS]]
## The 9 Flags 
### - The Carry Flag (**CF**)
- flags the *UNSIGNED* overflow
> any *representation* in base 2 always has 2 possible *interpretations* in base 10
> both representations are valid simultaneously
> $\Rightarrow$ each needs its own flag that can signal an overflow

^982a8b

![[FlagsExample]] 
- if the previous addition has the **transport digit** set to 1, the **carry flag** is set to 1
### - The Parity Flag (**PF**)
- counts the number of set bits of the least significant byte of the operand
- if the number of bits set in the least significant byte is even, the flag is set to 1
### - The Auxiliary Flag (**AF**)
- shows the transport value from bit 3 to bit 4 (nibble 0 and 1)
![[AuxiliaryFlagExample]]
### - The Zero Flag (**ZF**)
- is set to 1 if the result of the last performed operation is zero
### - The Sign Flag (**SF**)
- the *first bit* of the result (regardless of whether the operation had a carry) (so, the sign of the result, in the signed representation)
- EX: in the previous addition, the SF is *0* (although there is a carry)
### - The Trap Flag (**TF**)
- enables users to execute code line by line (used for debugging)
- if it's set to 1, the machine executes the code in a debugging manner 
- EF is not a result of previous operations. rather, it influences smth in the future of the execution
### - The Intrerupt Flag (**IF**)
- on a 32 bit architecture, users don't have access to the intrerupt flag (the os does)
- used to define a critical section (a section of code that cannot be interrupted)
```nasm
IF = 0 ; no interruption of execution, no matter what
; code code code 
IF = 1 ; the code can be interrupted again
```
### - The Direction Flag (**DF**)
- dictates the *direction of traversal* of an array
>DF = 0 $\Rightarrow$ ascending order
> DF = 1 $\Rightarrow$ descending order
### - The Overflow Flag (**OF**)
- flags the *SIGNED* overflow (set to 0 if the result fits in \[-128, 127], and 1 otherwise)
- the overflow flag is set to 1 if
	1. after the addition of 2 positive numbers, the signed bit is set to 1
	2. after the addition of 2 negative numbers, the signed bit is set to 0

## Flag Categories
- PF, AF, ZF, OF - are a result of the LPO
- TF, IF, DF - are (usually) set by programmers and have a future effect, during the execution
> CF belongs to both categories
### Flag Instructions

^b70bd8

- **IF** 
	1. CLI: IF = 0
	2. STI: IF = 1
>[! warning] note that, on 32 bits, the OS restricts the programmer's access to this flag, so these instructions are valid on 16 bits only
- **DF**:
	1. CLD: DF = 0
	2. STD: DF = 1
- **CF**
	1. CLC: CF = 0
	2. STC: CF = 1
	3. CMC: CF = $\neg$CF
