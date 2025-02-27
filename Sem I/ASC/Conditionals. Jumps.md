# Conditionals. Jumps
___
Class: [[ ASC]]
Type: Lab + Seminar
Tags: # 
Date: October 28th 2024
___
## Jumps

### Types
- **Conditional**: many many types
- **Unconditional**: jmp
#### Conditional Jumps 
JZ, JNZ $\Leftrightarrow$ JE, JNE 
JA, JB / JNA, JNB ((not) above / below) - *unsigned*
JAE, JBE, JNAE, JNBE (if (not) above (/below) or equal) - *unsigned*
JG / JL etc. (jump if greater / lower) - *signed*
JP(arity)
JO(verflow)
J(E)CXZ


### NEAR and FAR jumps 
- 3 options (all are NEAR): label, reg, memory (all are on 32 bits, so they can only represent offsets)
- however, CS:EIP will always show the address of the currently executed instruction, and we can use this to our advantage to make a FAR jump 

>[!warning] when performing a jump in memory / reg, the instruction is prefixed with DS!!!! (the **operand** becomes a far address, NOT the jump). SO, jmp \[var_mem] or jmp\[reg] will turn var / reg to a FAR address, then retrieve 32 bits from that memory address (DS:\[var_mem] or DS:\[reg] or SS\[reg] if reg is ESP or EBP) 

>[!important] the only way to perform a FAR jump is using the **far** keyword and a memory address
> ex: jmp FAR \[ebx+12] $\Rightarrow$ CS:EIP $\leftarrow$ 6 bytes from the memory address in \[ebx+12]

>[!important] due to the flat memory model, we can perform NEAR jumps in other segments 
>Additionally, all jumps using labels within the same file can only be near jumps (because all labels are offsets)


