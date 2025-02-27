# The Internal format of an Instruction
___
Class: [[ ASC]]
Type: 
Tags: # 
Date: January 16th 2025
___

>[!important]- general formula: \[prefixes] + opcode + \[ModeR/M] + \[SIB] + \[displacement] + \[immediate]
> - each term of the addition is represented internally as 0/1/2/4 byte(s):
> 	- prefixes: instruction prefix, address-size prefix, operand-size prefix, segment override (each is represented on 0 or 1 byte)
> 	- opcode: 1 or 2 bytes
> 	- mod R/M: 0 or 1 byte
> 	- SIB: 0 or 1 byte 
> 	- displacement: 0, 1, 2 or 4 bytes 
> 	- immediate: 0, 1, 2 or 4 bytes
> 
>>[!tip] although it may seem like the maximum length of the internal representation of an instruction is 16 bytes, no NASM instructions ever exceed 15 bytes

## Important bytes
### Prefix bytes
- one byte each (at most)
![[The Internal format of an Instruction 2025-02-05 15.09.57.excalidraw]]
### ModRM
![[ModeRM]]
mode can be: 
00 - mem(base only), reg (or reg, mem(base only))
01 - mem(base+disp8), reg (or reg, mem(base+disp8))
10 - mem(base+disp32), reg (or reg,mem(base+disp32))
11 - reg,reg


### SIB
![[SIB]]