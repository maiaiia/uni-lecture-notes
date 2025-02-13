[ASC]
## Def
Assembly language constructs that may appear in the composition of a source line or in the internal format of an instruction. They change the standard behaviour of those instructions or signal the switch of the default representation .
## Types of prefixes
- **instruction prefix**: REP, REPE, REPNE $\rightarrow$ explicitly assigned by the programmer
- **operand-size prefix**: 66h
- **address-size prefix**: 67h
- **segment override prefix**: CS, DS, SS, ES, GS, FS (like in jmp far \[DS:ebx+12])

>[!tip]- the instruction and segment override prefixes are explicitly assigned by the programmer, whereas the address-size and operand-size prefixes are implicit
>the implicit prefixes appear when the assembler detects the usage of an operand / address that does not have the implicit size (as in, in 32 bits programming, the instruction push ax will be prefixed with the operand-size prefix)
>same goes for mov eax, \[bx] (here, the offset is computed using the 16-bit formula)



