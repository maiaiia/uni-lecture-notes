# Addresses
___
Class: [[ ASC]]
Type: Lecture
Tags: # 
Date: October 31st 2024
___

## Definitions
### Addresses
#### Def
- no. of consecutive **bytes** from the *beginning of the RAM memory* to the beginning of that memory location 
#### Types of Addresses
**FAR Address**
- a *complete address specification* (segment + offset)
- a pointer value, as a FAR address, obeys the little endian rule
- it can be specified in one of the following ways:
	1. selector:offset
	2. segment_register:offset
	3. QWORD, where 6 bytes represent the address (the offset is represented in the lowest 4 bytes and the segment selector in the highest 2)
**NEAR Address**
- when the address is specified only by its *offset* 
- in this case, the segment selector is implicit (CS, DS, SS), and picked by the assembler
>[!tip] a NEAR address is always relative to the one of the 4 active segments
### Segments

^5e4129

#### Def
an uninterrupted sequence of memory locations / a block of memory of discrete size
![[Address 2024-12-03 22.39.47.excalidraw]]
(for the valid types, see [[Registers#^9d2fda|Segment Registers]])
	
>[!tip] on both 16 and 32 bit architectures, the segment registers have *16 bits *
#### Segment Types
- **CODE SEGMENT** - instructions
- **DATA SEGMENT** 
- **STACK SEGMENT**
- **EXTRA SEGMENT** - additional data segment

at any given moment, a sequential processor has only one active segment of any given type 
> [!important]- the *segment registers* memorise the *segment selectors* of the currently active segments respective to their *type* 
> Note that, on 16 bits, the segment registers actually provided the starting address of their corresponding segment
  On 32 bits, however, the segment selector is issued by the OS instead

on 32 bits, the programmer can only control offsets, but not the starting address of a segment

### Segment selectors 
- a numeric value on *16 bits* which uniquely selects the accessed segment and its features
>[!important] the segment selector is computed and provided by the OS

### Offsets

^1f8d63

#### Def
- the address of a location *relative to the beginning of a segment* (the number of bytes between the beginning of that segment and that particular memory location)

>[!important] **addresses** are relative to the beginning of the *RAM* memory, while **offsets** are relative to the beginning of the *current segment*
- offsets are **constants determinable at compile time**, depending on the order of declaration
- offsets are now represented on 32 bits
- an offset is valid $\iff$ its value doesn't exceed the segment's limit
### Address Specifications
#### Def
- a pair composed of a *segment selector* %%16 bits%% and an *offset* %%32 bits%%

## Addressing models
### Segmented addressing model
When the processor is provided with a FAR address: $s_3s_2s_1s_0$:$o_7o_6o_5o_4o_3o_2o_1o_0$, it:
1. Checks the validity of the segment selector $s_3s_2s_1s_0$ (if it's invalid, the OS raises a memory violation error)
2. Extracts the base address (B) and the segment's limit (L)
3. Checks whether the offset $o_7o_6o_5o_4o_3o_2o_1o_0$ is within the segment's limit 
4. Computes the *linear address* $a_7a_6a_5a_4a_3a_2a_1a_0 = b_7b_6b_5b_4b_3b_2b_1b_0 + o_7o_6o_5o_4o_3o_2o_1o_0$ in the **ADR** component of the *BIU* 
>[!warning] the linear address is never stored directly or made available to the programmer. It is needed only for accessing an operand and dereferencing it. Afterwards, it is deleted

>[!tip] note how, on 32 bit architecture, the base address of a segment is protected by the OS
### Flat memory model
- new memory model, used by most of the modern operating systems
- memory appears to the program as a single contiguous address space

the os uses the flat memory model. however, this memory model coexists w the old one (this is done by setting the segment selectors to 0)

## Addressing Modes
There are 3 ways of expressing an operand
1. register mode: mov *eax*, 17
2. immediate mode: mov eax, *17*
3. memory addressing mode: mov eax, *\[v]* (here, v is a constant, addressed *directly*)
 >[!important]- offset_address = \[base] + \[index\*scale] + \[constant] (32 bit formula)
>- the base is the content of one of the general registers 
>- the index is one of the general registers, **except ESP**
>- the scale can be 1, 2, 4, 8 (corresponding to each datatype)
>- the constant can be either:
>	- a constant offset (mov eax, <u>[v]</u>)
>	- an immediate value (mov eax, v[<u>17</u>])
>>[!tip] the original 16 bit formula is: offset_address = \[BX|BP] + \[SI|DI] + \[constant] 

Thus, there are three *ways of addressing the memory*:
- *direct addressing*: when only the constant is present (the other 2 are indirect)
- *based addressing*: if computing one of the base registers is present 
- *scale-indexed addressing* 
>[!tip] *indirect* addressing implies the usage of at least one of the 2 non-direct addressing methods (based / scale-indexed), i.e. if a register is present, the method of addressing is indirect

![[Addressing]]
In the case of the jump instruction, *relative addressing* is present. It indicates the position of the next instruction to be run, in relation to the current position. There are 2 types of relative addresses
- *SHORT* addresses (at a distance of at most 1 byte (\[-127,128]) from the jump instruction)
- *NEAR* addresses (distance of at most 1 doubleword)