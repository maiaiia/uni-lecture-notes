# Theory Stuff for the Final Exam
___

## [[Flags]] 
>[!question] 
>Explain what are and which is the role of the flags in the functioning of the 80x86 microprocessor. Present the flags, their classification and exemplify the influence of the most important flags giving adequate sequences of instructions written in nasm (at least 4 commented and explained examples - every example referring to a different flag). What are the instructions for accessing the flags directly? Which are the instructions most involved / having the strongest connection / that take into consideration the values of the flags? How can the configuration of the EFLAGS register be modified if needed? Which are the flags that react to an overflow situation, which is their exact role and which are the rules for these flags being set? Why is there more than one flag that deals with an overflow situation? 

### Def
Flags are one-bit indicators, stored in a 32-bit register called EFLAGS. There are a total of 9 flags: CF (carry flag), OF (overflow flag), AF(auxiliary flag), ZF (zero flag), SF (sign flag), PF (parity flag), DF (direction flag), TF (trap flag), IF (interrupt flag).
### Flag roles 
- CF: 
	- Signals the unsigned overflow
	- Its value can be changed either after performing additions, subtractions, multiplications, comparisons, or directly by the programmer:
		- add:
			```nasm
			mov al, 128 
			mov bl, 128
			add al, bl ;correct mathematical result (256) exceeds the interval of values that can be represented on a byte in the unsigned interpretation ([0, 255]), so CF is set to 1
			```
			```nasm
			mov al, 128
			mov bl, 1 
			add al, bl ;correct mathematical result (129) belongs to the interval of values that can be represented on a byte in the unsigned interpretation ([0, 255]), so CF is set to 0
			```
		- sub:
			```nasm
			mov al, 100
			mov bl, 200
			sub al, bl ;the result of this subtraction is a negative number, which does not belong to [0, 255], so CF is set to 1 
			```
			```nasm
			mov al, 200
			mov bl, 100 
			sub al, bl ;100 in [0, 255] => CF is set to 0
			```
		- multiplication will be covered in the OF section
		- instructions to change the value of CF:
			- STC (set CF; CF = 1)
			- CLC (clear CF; CF = 0)
			- CMC (CF = CF ^ 1)
- OF:
	- Signals an overflow in the signed interpretation 
	- Its value can only be changed after certain instructions
		- add:
			```nasm 
			mov al, 100
			mov bl, 100 
			add al, bl ; note that the correct result of this operation does belong to [0,255], so CF = 0, but it does not belong to [-128,127], so OF = 1
			```
	
		- sub: 
			```nasm
			mov al, -100
			mov bl, 100 
			sub al, bl ; -200 not in [-128, 127] => OF = 1
			```
		- mul:
			- In the case of multiplication, an overflow cannot occur (from a mathematical standpoint), since the space allocated for the result of the operation is always big enough to represent the correct result. However, the values of both CF and OF are updated after multiplications, to signal whether the result of the operation fits in lower half of the result (which has the same size as the size of the initial operands)
			```nasm
			mov al, 1
			mov bl, 1 
			mul bl ;result is 1, which fits on a byte, so CF = OF = 0
			```

			```nasm
			mov al, 100 
			mov bl, -100 
			imul al, bl ;result is -10000, which does not fit on a byte, so CF = OF = 1
			```

>[!important] Note that both CF and OF are needed, since they signal different types of overflow (in the unsigned and signed interpretations respectively). For instance, since addition and subtraction are implemented in the exact same way for both signed and unsigned numbers, the processor cannot make the distinction between these 2 interpretations, leaving the responsibility of deciding which interpretation applies to the current program to the programmer, who may choose to use the values stored in either CF of OF

- AF: signals whether there is a transport digit between the first and second nibble
- ZF: signals if the result of the LPO is zero
- SF: is set to the value of the sign bit (leftmost bit) of the result
- PF: is set to 1 if the result has an odd number of bits set to 1 and to 0 otherwise
- DF: 
	- used for string instructions. if it is set to 0, strings are iterated from left to right. if it is set to 1, strings are iterated from right to left 
	- can be set by the programmer using the following instructions:
		- STD: set DF to 1 
		- CLD: clear DF (to 0)
- TF: it allows execution of the program line by line (used for debugging). It is protected by the OS and its value can't be changed by the programmer on neither 16 nor 32 bits
- IF: allows interrupts. on 32 bits, it is protected by the OS. However, on 16 bits, its value can be directly changed using the following instructions: CLI, STI

### Classification
Therefore, flags can be classified into 2 categories: 
1. Flags that indicate how the LPO (last performed operation) changed the state of the program: CF, OF, AF, ZF, SF, PF
2. Flags that influence the execution of the program: CF, DF, TF, IF
Note that CF belongs to both categories. This is due to the existence of  instructions like adc, sbb, rcr, rcl, etc. which take into consideration the value of the cf when performing said addition / subtraction
```nasm
mov eax, 100
mov bl, 200 
add al, bl
adc eax, 0 
```

### EFLAGS 
The contents of this register cannot be accessed directly (since EFLAGS isn't even a keyword in assembly) in the same manner in which the contents of the other registers can. However, the values of the flags can be changed either via the aforementioned instructions (STC, CLC, CMC, STI, CLI, STD, CLD) or by using the instructions PUSHF and POPF, which push and pop the content of EFLAGS to and from the stack respectively.
In the case of the second method, in order to set a certain flag, the specific layout of the flags in EFLAGS (which can vary between processors) must be known beforehand. The programmer can then push a bitmask having the desired flag configuration to the stack, then move it to EFLAGS using the instruction POPF

### Instructions 
Besides the instructions mentioned above, some other instructions that take into account the values of the flags are jump instructions

## Data Types 
>[!question]
>Define the notion of a datatype at the level of the assembly language. What are the mechanisms of defining variables at the level of the assembly language? Give examples of variable declarations (with and without initialisation). What are the situations when type operators of the operands are necessary and the situations when they are not? Explain and exemplify short adequate code examples. Comment on the methods of performing data type conversions at the level of the assembly language

A datatype is defined as the union between a structure (that can have different attributes, such as size, type of data stored, etc.) and a set of associated operations. At the level of the assembly language, however, data types are only defined by their size. There are 4 numeric data types - byte (8 bits), word (16 bits, 2 bytes), double word (32 bits, 4 bytes) and quadword (64 bits, 4 bytes). Pointers can also be considered a data type; they can be stored on either a byte or a word and point to a memory location.

In NASM, variables are, in fact, just data labels, having a constant value that is determinable at assembly time (equal to the offset of said data label). Their sole purpose is pointing to a certain memory location. Thus, they can be referred to in relation to any data size, regardless of how they were defined (in other words, variables don't have any data type associated with them throughout the execution). Note that this does not apply to all assembly languages, but it does apply to NASM. 

Variables can be defined using the 'db', 'dw', 'dd' or 'dq' (define byte/word/doubleword, quadword) directives, in order to initialize them with a certain value, or using the 'resb/w/d/q' directives, in order to reserve a certain number of bytes, without actually setting any values to the labels. Notice that, since variables don't have any size associated with them, the aforementioned directives are actually just indicators of how to populate the memory with certain values and serve no other purpose (in NASM)
Additionally, any of these directives can be preceded by the 'times factor' directive, which repeats the declaration for 'factor' times.

Examples:
```nasm
segment data
	a db 12h, 34h
	b resw 1 
	c times 2 db 1 
segment code 
	mov ax, [a] ;will load 3412h in ax
```

```nasm
segment data 
	a db 11h, 0a3h
	dw 12h
	b resw 2 

;memory segment is: 11h a3h 12h 00h 00h 00h 00h 00h
```

Due to the fact that the size of a variable can vary, it is sometimes necessary to specify the size of the operands of an instruction, in order to clear up ambiguities. This can be done using type operators (byte, word, dword, qword)
Examples:
```nasm 
segment data
	a db 1, 2, 3, 4 
segment code 
	mov [a], byte 10
	mov [a], word 10 
	add [a], dword 10 
	sub [a], qword 0abcdef123h
	movsx eax, byte [a] ;a could have also been a word 
```
This is not necessary when the size of the variable is implicit, which usually happens when the other operator is a register (since most instructions operate on operators of the same size)
Examples:
```nasm 
mov eax, [a]
sub [a], eax 
add eax, 10 
movsx eax, al
movsx ax, [a] ; movsx demands that the size of the second operator is strictly less than that of the first, so [a] can only refer to the byte stored at the address of a 
xlat ; the operators of xlat are always the same (al and ebx)
```
There are multiple ways for performing type conversions at the level of the assembly language. These depend on the desired interpretation of the data
1. Methods for the unsigned interpretation
	- manually setting the higher part of the data to 0, with the instruction 'mov'
		Example: converting al to ax: mov ah, 0 
	- using the movzx instruction:
	```nasm
	mov al, 10
	movzx ax, al
	movzx ebx, al 
	```
2. Methods for the signed interpretation
	- manually setting the bits of the higher part of the data to the value of the sign bit
	- using type promotion operators (cbw, cwd, cwde, cdq)
		- cbw - al --> ax
		- cwd - ax --> dx:ax 
		- cwde - ax --> eax 
		- cdq - eax --> edx:eax
	- using the movsx instruction:
	```nasm
	mov al, -10
	movsx ecx, al
	```
3. Pseudo-conversion methods
	- If we consider "conversions" to mean changing the datatype that stores a certain value to a different data type, without any loss of information, then, clearly, we cannot talk about converting from a higher-size data type to a lower size one. However, it is possible to take chunks of the original data (for instance, the lower byte of a word), using the classic instructions.
## 2's Complement 
>[!question] 
>Explain and exemplify how negative numbers are represented and operated on at the level of the 80x86 architecture. Showcase the representation mechanism and give 2 adequate representation examples (example: discussion and analysis on the representation of -37 and -912, etc.) How cat the corresponding value in base 10 for a representation in base 2 be obtained? Which are the possible practical methods / techniques / mechanisms to be applied? Present how the programmer operates with negative numbers at the level of the assembly language in the case of each of the 4 basic arithmetic operations: addition, subtraction, multiplication, division (1 adequate source code example for each basic operation + explanations). Present and exemplify (by adequate code sequences) every assembly language instruction (or category of instructions, if they are very similar) capable of operating with such numbers (1 example for each instruction / category + explanations for each). How is the value 0 considered and why

At the level of the 80x86 architecture, integers are represented in base 2, as a string of bits. These can be interpreted as either unsigned, or signed. Negative numbers can only be represented using a mechanism called '2's complement'. 
Two's complement uses the most significant / leftmost bit as a sign bit: if the bit is set to 0, the value is positive; otherwise, it is negative. 
The standard procedure for obtaining the two's complement representation of a given negative number is the following:
4. represent the absolute value of the negative number in base 2, making sure that the leftmost bit is 0
5. flip all the bits 
6. add 1 to the inverted number
Example:
$6_{(10)} =0110_{(2)} \rightarrow 1001 \rightarrow 1010 = -6_{(2)}$
$37_{(10)}=0100101_{(2)} \rightarrow 1011010 \rightarrow 1011011 = -37_{(2)}$
$912_{(10)} = 01110010000_{(2)} \rightarrow 10001101111 \rightarrow 10001110000 = -912_{(2)}$

A quicker way of doing these computations is by only flipping the bits that are to the left of the least significant bit that is set to 1 (not including said bit)

Note that the value of positive numbers is unchanged if we add any number of bits of 0 to the left of the representation, and the value of negative numbers remains unchanged when adding any number of bits of 1 to the left of the representation (in two's complement representation). So, the two's complement representation of -37 on a byte is 11011011, and on a word it is 1111111111011011. 

Additionally, an advantage of this method of representing signed numbers is that there is only one way of representing 0 (if we try the method above, after step 3, there will be a transport digit outside the representation of the value, which will not be taken into consideration). Additionally, since the sign bit of 0 is 0, it is interpreted as a positive value 

There are some shortcuts that can be taken when representing / interpreting a value using the two's complement method:
- in order to quickly compute the absolute value of a negative number represented on n bits, one can simply compute the value under the unsigned interpretation and subtract that from $2^n$ 
	- example: to find the value of 10010010, we can perform the subtraction $2^8_{(10)} - 10010010_{(2)} = 256 - 146 = 110 \Rightarrow 10010010$ in the unsigned interpretation is -110

### Operations with negative numbers 
I. addition and subtraction
due to the two's complement method of representing negative numbers, addition and subtraction can be implemented in the exact same way for both the signed and unsigned interpretations in order to yield correct results. So, the instruction for adding signed numbers is add, and the instruction for subtracting them is sub. Note that if an overflow occurs (in the signed interpretation), the OF will be set to 1.

II. multiplication
Multiplication is implemented differently for each interpretation. The instruction for signed values is imul

III. division
Division is also implemented differently for each interpretation. The instruction for signed values is idiv

### Other instructions 
cbw, cwd, cwde, cdq, movsx

## Basic Elements of the Assembly Language 

>[!question]
>None found, but apparently this is a theory subject that has been in past exams

The basic elements that an assembler works with are labels, instructions, directives and the location counter

### Location counter 
Pointer type token which indicates the number of bytes that have been generated up to a certain memory location ('\$') or points to the beginning of the current section ('\$\$') (if no sections have been declared, it points to the beginning of the current segment)
There are multiple usages for location counters, such as finding the length of the current section ('\$\$ - \$') or the length of an array 

### Labels
Labels are user-defined names, which are used for pointing to a certain area in the segment / section where they were created. The value associated with a label is the near address (offset) of the instruction or directive that follows that label

1. Code labels - followed by semi-columns, these help navigation between different code segments (example: start: label at the beginning of the code segment)
2. Data labels - these represent a symbolic identification for some memory location, and help the programmer to navigate the memory
Note that both code and data labels can appear in either code or data segments. 

### Directives
Directives are indications given to the assembler in order to correctly generate the bytes that encode either the data segment or the instructions in the code segment.
Examples:
- EQU directive - used for declaring constant values that are not stored in memory
- type indicators - byte, word, dword: used to clear up ambiguities when it comes to the size of an instructions' operands 
- data definition directives:
	- with initialization: db, dw, dd, dq
	- without initialization: resb, resw, resd, resq
- times directive: syntax - times x instr/dir; usage: repeats the instruction/directive that follows it for x times 
- segment directive: used for splitting the code into different segments (code, data), having different properties and access rights

### Instructions
Instructions are indications given to the processor in regards to the correct execution of the program. 
Instructions format:
\[prefix(es)]+\[mnemonic]+\[operands]+\[;comment]
- prefixes are assembly language constructs that may appear in the composition of the source line code or in the internal format of an instruction. These signal a change in the standard behaviour of the instruction or a switch of the default representation. The prefixes that can appear within the source line are:
	- instruction prefixes: rep, repe, repne 
	- segment-override prefixes: CS, DS, SS, ES, FS, GS
- operands define the values that will be changed / operated on within the instruction. there are 3 types of operands: register, memory or immediate operands
## Overflow Concept Analysis
>[!question]
>Elaborate an analysis regarding the "overflow" concept at the level of the arithmetic operations, and showcase how the x86 architecture reacts when an overflow occurs in the case of each of the 4 basic arithmetic operations: addition, subtraction, multiplication and division. Which are the cases considered by the assembly language as "overflows" and how does the microprocessor react to them? Present, for each of the 4 cases, 2 adequate code examples illustrating such situations and the lack thereof respectively. Explain which is the exact reaction of the computing system for each presented case and what the programmer can do when such situations arise. How can the programmer avoid overflows?

At the level of the arithmetic operations, an overflow is a situation when an instruction cannot be carried out to provide a correct mathematical result, due to the fact that the space reserved for storing the result of the computation is not big enough for its correct representation in the desired interpretation. After an overflow occurs, the program either crashes or the result provided is a mathematical nonsense.
The assembly language has certain mechanisms for signalling and reacting to an overflow. These vary depending on the specific instruction, but all of them involve the carry flag (CF), which signals the unsigned overflow, and the overflow flag (OF), which signals an overflow in the signed interpretation 
### addition and subtraction
Addition and subtraction are both implemented in the same way regardless of the desired interpretation, so there is only one instruction for each. However, since there is no way for the processor to know how the output is intended to be interpreted by the programmer, both CF and OF are updated after these operations accordingly. 
For the unsigned overflow, in both of these situations, the CF is updated with the value of a transport digit / borrow:
```nasm 
mov al, 128
mov bl, 132 
add al, bl 

 10000000+
 10000100=
100000100
there is a transport digit => CF = 1
```
```nasm
mov al, 128
mov bl, 4 
add al, bl

10000000+
00000100=
10000100
no transport digit => CF = 0
```
```nasm 
mov al, 132
mov bl, 4
sub al, bl

10000100-
00000100=
10000000
no borrow => CF = 0
```
```nasm
mov al, 4 
mov bl, 132
sub al, bl 

 00000100-
 10000100=
 10000000
borrow needed => CF = 1
```
We can also interpret these results mathematically. The correct results of the second and third operations (132, 128) belong to the interval of values that can be represented on 8 bits in the unsigned interpretation (\[0,255]), whereas the correct results of the first and third (260 and -128) do not.

For the unsigned interpretation, when an overflow occurs after an addition is performed, the programmer can use the value stored in the CF to reach the correct result of the operation. This does not apply to subtractions, since negative values cannot be represented in the unsigned interpretation, regardless of the size of the datatype used.
Example:
```nasm
mov ax, 0 
mov al, 128
mov bl, 130
add al, bl ;CF is updated to 1 
adc ah, 0 ;CF is added to ah => ax stores the correct mathematical result of the addition
```

For the signed overflow, the OF will be updated according to the sign bit of the operands and the result:
- addition: if the result of adding 2 numbers having the same sign bit has the complementary value of said bit
- subtraction: if after subtracting a positive value from a negative value, a positive value is obtained or if after subtracting a negative value from a positive one, a negative value is obtained

```nasm
mov al, 68
mov bl, -8
add al, bl

01000100+
11111000
00111100
OK! OF = 0
```
```nasm
mov al, 127
mov bl, 1
add al, bl 

01111111+
00000001
10000000
P+P=N => OF = 1
```
```nasm
mov al, -128
mov bl, -1
add al, bl

10000000+
11111111=
01111111
N+N=P => OF = 1
```

```nasm
mov al, 68
mov bl, -2
sub al, bl 

01000100-
11111110=
01000110
OF = 0
```
```nasm 
mov al, -128 
mov bl, 1
sub al, bl 

10000000-
00000001=
01111111
N-P=P => OF = 1
```
```nasm
mov al, 127
mov bl, -16
sub al, bl

01111111-
11110000
10001111
P-N=N => OF = 1
```

Note that these examples can also be justified from a mathematical point of view: in the cases when the correct result of the operation belongs to the admissible interval of representation (i hate the way this sounds but that's what he calls it) of signed values on 8 bits (\[-128,127]), OF is set to 0. Otherwise, OF is set to 1.

We can clearly see that an overflow in the unsigned interpretation is not equivalent to one in the signed interpretation. For instance, the addition (68 + (-8)) sets the OF to 0, but it does produce a transport digit (as the unsigned interpretation of the signed representation of -8 is 246 and 68 + 246 > 255), so CF is set to 1. Thus, both flags are necessary

### multiplication
When it comes to multiplications, the correct result of the operation will always fit in the space reserved for it. Thus, for this operation, the CF and OF do not indicate whether the result of the multiplication 'fits' in the size of the result, but rather if it exceeds the size of the operands. Regardless of the operation (either mul or imul), both CF and OF are updated accordingly

```nasm
mov al, 8
mov ah, 1
mul ah ;ax <- al * ah = 8
8 is in [0,255], so CF = OF = 0
```
```nasm 
mov al, 8 
mov ah, -1 
mul ah ;ax <- al * ah = -8
-8 is in [-128,127], so CF = OF = 0
```
```nasm 
mov al, 128 
mov ah, 4
mul ah ;ax <- al * ah = 512 not in [0,255], so CF = OF = 1
```

### division 
Division overflows happen when the result of the operation does not fit in the space reserved for it. These are a special case of overflows, since, when they occur, the program crashes (its execution stops).  A `division by zero` error is raised (interpretation: trying to fit an infinite value (result of a division by 0) in a limited space - so any value greater than those that can be represented in the allocated space is interpreted as infinite).

```nasm 
mov ax, -200
mov bl, 1 
div bl ;al <- ax // bl = -200, but -200 is not in [-128,127] => overflow!
```
```nasm 
mov ax, 256
mov bl, 2
idiv bl ;ah <- ax % bl = 0, al <- ax // bh = 128 in [0,255] => no overflow
```
Division overflows cannot be fixed after their occurrence. The programmer can only take steps to prevent them (i.e. promote the operators to a higher datatype before performing the division)

## Multi-modular Programming
>[!question]
>Define and explain the concepts of call code, entry code and exit code in the general context of programming languages, after which analyse how they are reflected at the level of the 86 assembly language. How is the assembly language involved when working with these concepts? Explain, by providing a source code, adequate schematic examples and following the structure of the run-time stack to clarify the involved responsibilities and needs. Who is responsible for generating these codes and when exactly? Define the notion of stack frame and explain its role and structure. Describe the CDECL and STDCALL conventions, explaining when they are used. Present and explain what the mechanisms of communication between modules are for ASM-ASM and ASM-C respectively.

Multi-module programming is a programming principle that implies splitting a program into multiple files (modules), which can be compiled separately and linked afterwards, in order to produce the final executable program. 
Different modules may communicate by different means, depending on the programming languages involved. When it comes to subroutine calls, there are some code structures and stages that must be included and conventions that must be obeyed, in order to have a smooth, correct execution.
### Conventions
There are 2 main conventions relevant to the assembly and c programming languages and the Windows operating system:
1. CDECL
	- this convention is specific to the C programming language
	- it states that function parameters must be pushed on the stack in reverse order of their declaration, which allows for a variable number of parameters
	- since the number of parameters may vary, functions that obey the CDECL convention don't free the parameters from the stack, so this responsibility is passed to the caller
	- the registers EAX, ECX, EDX and EFLAGS are *volatile resources*, meaning that their values is assumed to change
	- if the function returns any value, it must be stored in EAX (or EDX:EAX, for quad words)
2. STDCALL
	- this is specific to the OS and is used, for instance, by the Windows system libraries
	- the number of parameters for STDCALL functions is fixed, and the callee is responsible with clearing the stack
	- the rest is the same as CDECL

### Subroutine call steps
1. Call code: call preparation and execution
2. Entry code: procedure entry and preparation of execution 
3. Exit code: returning and freeing up out-of-date resources
#### Call code
- before a function call, the *caller* must perform the following steps:
	1. save volatile resources by pushing them on the stack
	2. assure compliance with constraints (aligned stack (ESP % 4 = 0), DF = 0)
	3. pass the parameters to the function (usually by pushing them on the stack)
	4. save the returning address and make the call:
		- call subroutine - if subroutine is statically linked 
		- call \[subroutine] - if subroutine is dynamically linked (at link-time)
		- call register or call \[variable] - for run-time dynamic linking (meaning that the address of the called method can be stored in a register or variable)
- after the call code is executed, control is given to the called function
![[Implementing Sub-Routine Calls 2025-02-01 19.49.50.excalidraw]]
#### Entry code
- generated at the beginning of the procedure
- the main purpose of the entry code is building the stack frame of the procedure. 
- The stack frame is a data structure stored on the stack, which contains all information relevant to the execution of the subroutine call
- Stack frame contents:
	- parameters prepared by the caller
	- return address (EIP of the next instruction)
	- EBP of the caller
	- space for local variables 
	- copies of non-volatile resources that may still be altered during the procedure
- entry code steps:
	1. push ebp + mov ebp, esp: ebp becomes the base pointer of the new stack frame. it allows accessing the parameters (\[EBP + 4 * {no. of vars}]) and local variables (\[EBP - 4 * {no. of vars}]) in a consistent way, since the value of ESP might change during the execution (by using EBP instead of ESP, the programmer doesn't have to keep track of all the data pushed on the stack during the execution of the procedure)
	2. sub esp, 4 * {no. of local variables} - allocate space for local variables 
	3. push {non-volatile data} - after the subroutine ends, it is required, especially in the case of high level languages, that the contents of all non-volatile registers remain unchanged, which is why they must be saved on the stack 
#### Exit code 
- generated at the end of the procedure
- the parts of the stack frame that were initialised during the entry code must be discarded
- steps: 
	1. restore non-volatile data
	2. clear local variables (mov esp, ebp)
	3. restore previous ebp (pop ebp)
	4. go to return address 
- if the STDCALL convention is used, the return instruction must also clear the parameters on the stack. Otherwise, this must be done by the caller afterwards, but this is not a part of the exit code

Note how implementing the call code is the responsibility of the caller, whereas the entry and exit code are the callee's responsibilities
When the modules were written in different programming language (let's take the example of asm and C), these steps and conventions must be rigorously obeyed. However, if both the caller and the callee are in ASM, there are almost no restrictions; 
- for the call code, only saving the returning address is necessary, which is done by the instruction call
- an entry code is not necessary at all 
- the exit code (returning to the original address) is done by the instruction ret (or ret no. bytes)

## Memory layout 
>[!question]
>Define, explain and exemplify the following notions: memory address, memory segment, offset, address specification, segmentation mechanism, linear address (give a clear example of computing this address), flat-memory model, effective physical address, FAR address (ways of specifying it), direct addressing, based addressing, indexed addressing, indirect addressing, NEAR addressing (ways of specifying a near address). Give examples for: offset, address specification, linear address, FAR address, direct addressing, based addressing, indexed addressing, indirect addressing, NEAR addresses. What are the implicit rules of associating an offset and its corresponding segment register (explain each case separately)? 
