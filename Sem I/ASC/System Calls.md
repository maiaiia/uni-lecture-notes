# System Calls
___
Class: [[ ASC]]
Type: Lecture & Seminar
Tags: # 
Date: November 27th 2024
___

[[Implementing Sub-Routine Calls]] 
## Conventions

^42475b

### CDECL Convention
- parameters are passed on the stack in reverse order 
- it's *the responsibility of the caller to empty the stack* (done by add ESP, 4*#{elements added to stack})
- EAX, ECX, EDX are modified inside the called function (*volatile resources*)
- EAX contains the return value of the function
- this convention allows a variable number of parameters 
>[!danger] this is why, when calling functions within loops, the value of ecx must be saved somewhere first (like the stack)

#### Examples
```nasm
mov ecx, 3 
label:
	push ecd 
	push dword message 
	call [printf]
	add esp, 4 
	pop ecx 
loop label

```

```nasm
data ...
	a dd 0
	b dd 0
	format1 db "%d %d", 0
	format2 db "%d", 0 
code ...
	start:
		push dword b 
		push dword a
		push dword format1 
		call [scanf] 
		add esp, 4 * 3 

		push dword [b]
		push dword [a]
		call sum 
		add esp, 4 * 2 

		push eax
		push format2 
		call [printf]
		add esp, 4 * 2 
		
		push dword 0 
		call exit 

sum:
	push EBP
	mov EBP, ESP ;the first 2 lines are called the "prologue"
	mov EAX, [EBP+8]
	add EAX, [EBP+0xc]
	pop EBP ; epilogue
	ret 
```

![[System Calls 2024-12-11 12.32.39.excalidraw]]

>[!tip] when calling user-defined functions, you're not supposed to add square brackets!!!

### STDCALL Convention
- this is specific to the OS and used, for instance, by the Windows system libraries 
- the only differences are that 
	1. the *called function must free the parameters from the stack* (this can be done by using the instruction RET N (ret & add ESP, N))
	2. Functions may only have a *fixed number of parameters*

## Console 

```nasm 
; task: write the nasm equivalent of printf("Sum of %d + %d = %d,a,b,a+b")
import exit msvcrt.dll 
import printf msvcrt.dll
extern exit, printf

segment data use 32 class = data 
	a db 30 
	b dd 50 
	message db "Sum of %d + %d = %d,a,b,a+b", 0

segment code use 32 class = code
	mov eax, [a]
	add eax, [b]
	push eax 
	psuh dword [b]
	push dword [a]
	push dword message 
	call [printf]
	add esp, 4 * 4
```

![[System Calls 2024-11-27 12.36.20.excalidraw]]

## Files 
![[System Calls 2024-11-27 12.59.59.excalidraw]]

```c++
//example - convert all text from a file to uppercase

int main(){
	
	FILE *f, *g;
	char text[100];
	int len;
	
	// read from file
	f = fopen("in.txt", "r"); //open file
	if (f == 0)
		return 1;
	len = fread(text,1,100,f); //read
	fclose(f); //close file

	// convert lower to upper case 
	for (int i = 0; i < len; i++)
		text[i] -= 'a'-'A;

	// write to file 
	g = fopen("out.txt","w"); //open file
	if (g == 0)
		return 1;
	fwrite(text,1,len,g) //write
	fclose(g) //close file
}

```

```nasm
; nasm equivalent 

import...
extern...
segment data 
	f dd 0
	g dd 0 
	text resb 100 
	len dd 0
	fin db "in.txt", 0 
	fout db "out.txt", 0 
	acc_r db "r", 0
	acc_w db "w", 0

segment code
	start:
		push dword acc_r 
		push dword fin
		call [fopen] ; return value in eax 
		add esp, 4 * 2
		mov [f], eax 

		cmp [f], 0
		jz final

		push dword [f]
		push dword 100 
		push dword 1 
		push dword text
		call [fread]
		add esp, 4 * 4 

		mov [len], eax 

		push dword [f]
		call [fclose]
		add esp, 4
	
		mov ecx, dword [len]
		jecxz final 
		mov esi, text 
		CLD
		repeat:
			lodsb b 
			cmp al, 'a'
			jb next 
			cmp al, 'z'
			ja next 
			sub al, 'a' - 'A'
			mov byte [esi - 1], al
			next:
		loop repeat		

		push dword acc_w 
		push dword fout 
		call [fopen]
		add esi, 4 * 2 

		mov [g], eax 
		cmp [g], 0
		jz final 

		push dword [g]
		push [len]
		push dword 1 
		push dword text 
		call [fwrite]
		add esp, 4 * 4 
		push dword [g]
		call [fclose]
		add esp, 4
	
	final:


```