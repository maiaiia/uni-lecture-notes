# Exam questions
## ASC
> [!question]- Why are 3 of the 17 registers focused on working with the stack, and none of them are focused on working with a queue or a heap
> - the stack structure reflects what happens at runtime (any running program obeys the lifo order during its execution)
> - the runtime stack keeps stack frames in lifo order 
> - order of activation of the procedures is always LIFO => any architecture is focused on the stack, not queue and heap
> - this applies to all processors
> - Ordinea de apel a subprobramelor respecta structura de stiva

>[!question]- What are the 2 visions of an n-bit architecture?
>- software vision (the one we embrace): 
>	- n bit architecture <=> size of the general registers / "[[word size]]"
>- hardware vision:  
>	- n bit architecture <=> size of the communication channels (the address, command, and data bus)
> - the size of the communication channels can be larger ==> more information flow 

> [!question]- How many operands can an operation have and why
A: All operations have a maximum of 2 operands due to the binary nature of memory (example: adding 3 numbers may result in a carry of 2)

> [!question]- 2^15 = ? 2^16 = ?

>[!question]- Which is the signed interpretation of <br>i) 10010011 <br> ii) 93h <br> iii) 147
>i) -109
>ii) -109 (since 93h = 10010011)
>iii) one can only INTERPRET a REPRESENTATION, in base 10 we work with INTERPRETATIONS 

>[!question]- Is the association of the abs values in 2-comp code bijective?
>A: No. The greater value can't be represented as a negative number using the same number of bits 

>[!question]- What is the minimum number of bits on which we can represent -147
>A: On n bits we can represent $2^n$ elements. In the unsigned interpretation, that means values in range \[0, $2^n-1$], and in the signed interpretation, \[$-2^{n-1}$, $2^{n-1}-1$]. So, a minimum of 9 bits is necessary for representing -147. Thus, the smallest assembly datatype that can store this value is a word

>[!question]- (random code) what error will this code raise?
> - syntax error (if the code does not compile)
> - runtime error (invalid operation, like a division with overflow)
> - invalid opcode and operand (like mov ax, bl or mov \[v1], \[v2])

!! knowing the priority of operators will not be necessary for the exams

>[!question] provide a minimum of 15 methods to initialize the content of aregister to 0

> [!question]- how many operands are in the instruction "push \[v]" 
> there is one explicit operand (\[v]), and one implicit (the top of the stack)

>[!question]- how many operands are in the instruction "CLD"
> 2 implicit operands (EFLAGS and 0 in the position of the direction flag)

>[!question]- what is the result of push \[v]
> Syntax Error (operation size not specified)
> (dar trebuie si povestile cu ce e un stack, ca e pe bucati de 32 biti, etc etc)

>[!question]- result of push byte\[v]?
>another error! you can only push 16 and 32 bits on the stack 

>[!question]- push \[eax] and push eax difference
> the first is a syntax error! operation size not specified 
> by modifying with either push *word* or *dword* \[eax], the contents of what is found at the offset stored in eax is pushed on the stack 

>[!question]- how many operands are in the instruction "pop dword \[v]" and what is the result of this instruction
>1 implicit - the element top of the stack 
>1 explicit - the memory address of v
>whatever is on top of the stack will be moved to the address of v

>[!question]- what is the effect of "pop dword v"
> v as a pointer type constant is an R-value and never an L-value
> so this is a syntax error

>[!question]- results of "mov ah, b", "mov ax, b", "mov eax, b"
> [[Operators#^824a25]]

> [!question]- precizati conditiile in care o instructiune poate avea 2 operanzi din memorie
> cel mult unul din cei doi operanzi sa fie expliciti

> [!question]- what values can be represented on 8 bits?
>  \[-128,255]

>[!question]- What are the cases when an overflow occurs after multiplication?
>ans: in the traditional sense, there will never be an overflow after performing multiplications (the result of the multiplication will always "fit" in the space allocated, which is double the amount of the size of the operands)

>[!question]- Sequence of operations; what will the contents of OF and CF be?

>[!question]- When will a multiplication result in 2 different values for CF and OF?
>[[2's Complement. Overflow#^0d82a7|never]]!! 

>[!question]- Why is there only one addition and subtraction operator, but 2 different operators for multiplication and division
>- addition and subtraction are performed in the same way for both the signed and unsigned interpretations (due to the representation in 2's complement)
>- however, multiplication and division are implemented differently

>[!tip] ESP points to the *address* of the last element pushed to the stack

>[!tip] The address of the stack shrinks as more elements are added to it, whereas the addresses of the heap increase

>[!question]- Give an example of an operation which has 2 operands from memory
>push mem, pop mem
>>[!warning] both explicit operands can't be from memory, but in the aforementioned cases, it's ok
>>the reason for this is that 2  memory addresses can't be computed during one singular operation

>[!question]- Are push and pop necessary? 

>[!question]- What happens during the instruction push ESP and pop dword \[esp]?
>The following steps are executed, in this order
>1. The value of the operand is computed
>2. esp is updated accordingly (subtract/add 4)
>3. the assignment is done
![[Instructions 2024-11-28 19.25.23.excalidraw]]

>[!question] How about PUSH dword \[ESP] and POP ESP (homework)

>[!question]- How many active data segments can we have?
>generally speaking, at any point during the execution there can only be one active segment of any type (one for each). however, there are 2 data segments

>[!question]- when is mov EAX, EFLAGS a valid operation?
>never / when defining a variable as eflags
>this only works because eflags's name is not reserved in nasm

>[!question]- mov ebx, \[eax+4 * ebp+v-1] moves the contents at the address computed. But how can we move to ebx the address computed?
>ans: lea ebx, \[eax+4 * ebp+v-1]
>trying to mov without the square brackets would result in a syntax error!

!! segment directives - **not** for the exam 
!! nu insista pe instructiuni mult, mai putin pe LEA si XLAT

--
>[! warning]- a1 dd -103, a6  // a6 db 10 IS CORRECT apparently
>that is due to the fact that the assembler first picks an address for every variable, and the values are stored at that specific address only afterwards
>
>example:
>a1 dd -103, a6 
>a6 db 32 
>memory: 99 FF FF FF 08 00 00 00 20
>

movsx ebx, \[ebx+ebp]

>[!question]- What are the instructions that take into account whether the signed or unsigned interpretation of the operands should be used
> imul, idiv etc

