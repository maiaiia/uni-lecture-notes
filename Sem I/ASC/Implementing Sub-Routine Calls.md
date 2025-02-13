# Implementing Sub-Routine Calls
___
Class: [[ ASC]]
Type: Lecture
Tags: # 
Date: January 9th 2025
Teacher: [[Alexandru Vancea]]
___
## Prerequisites
- [[System Calls#^42475b|CDECL and STDCALL Conventions]]
- volatile resources: 
	- values that may usually change during the execution of a function
	- EAX, ECX, EDX, EFLAGS
- non-volatile resources: 
	- resources that usually don't change, but may change in this specific function
## Steps 
1. **Call code**: call preparation and execution 
2. **Entry code**: procedure entry and preparation of execution 
3. **Exit code**: returning and freeing up out-of-date resources 
### 1. Call code 
- responsibility of the *caller*
- tasks / steps:
	1. save volatile resources (like the registers EAX, ECX, EDX, EFLAGS)
	2. assure compliance with constraints (aligned ESP, DF = 0, ...)
	3. pass the parameters (usually by pushing them on the stack)
	4. save the returning address + make the jump / call 
		1. call subroutine - if subroutine is statically linked 
		2. call \[subroutine] - if subroutine is dynamically linked (at link-time)
		3. call register or call \[variable] - for run-time dynamic linking 
![[Implementing Sub-Routine Calls 2025-02-01 19.49.50.excalidraw]]
### 2. Entry code
tasks / steps:
1. build / configure the new stackframe (CEPU - currently executing procedural function, encapsulated between EBP and ESP) 
	- EBP is pushed on the stack 
	- EBP takes the value of ESP
![[Implementing Sub-Routine Calls 2025-01-09 19.03.49.excalidraw]]
2. reserve space for local variables (if any): sub ESP, no_bytes 
3. save non-volatile resources (if any)
![[stackframe]]
### 3. Exit code 
tasks / steps:
4. restore altered non-volatile resources
5. Release the local variables of the function 
6. Deallocate the stack frame 
	- mov esp, ebp 
	- pop ebp 
![[Implementing Sub-Routine Calls 2025-01-09 19.57.58.excalidraw]]
7. return from the function + (optional, if STDCALL) release arguments

| Caller | Callee | Call code      | Entry code - '{' | Exit Code - '}' |
| ------ | ------ | -------------- | ---------------- | --------------- |
| C      | C      | C compiler     | C compiler       | C compiler      |
| C      | ASM    | C compiler     | ASM programmer   | ASM programmer  |
| ASM    | C      | ASM programmer | C compiler       | C compiler      |
| ASM    | ASM    | call           | -                | ret             |
>[!tip]- If both the caller and the callee are in ASM, obeying all the aforementioned steps is not necessary 
> - Call code - only saving the returning addresses is necessary, which can be done solely by the instruction 'call'
> - Entry code - nothing mandatory 
> - Exit code - returning to the original address (done by the instruction 'ret')

