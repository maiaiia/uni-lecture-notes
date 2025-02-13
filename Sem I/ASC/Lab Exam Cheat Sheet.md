# Lab Exam Cheat Sheet
___
Class: [[ ASC]]
___

!! when computing the length of an array remember to always divide it by the size of the elements in the array !!

!! when pushing on the stack always remember to specify the size of the address!! (dword)

!!remember that function calls change the values of eax, ecx, eflags!!

![[System Calls 2024-11-27 12.59.59.excalidraw]]

![[Lab Exam Cheat Sheet 2025-01-13 17.37.44.excalidraw]]
!! c - char, byte; d/i - signed, dword; u - unsigned, dword; x - unsigned, hex; s - string of bytes !!

!!ascii newline: 10!!
```nasm
nullch db 10, 0

...

push dword nullch 
push dword [file_descriptor]
call [fprintf]

```

write text to file
```nasm 

push dword cuvant 
push dword [output_file_descriptor]
call [fprintf]
add esp, 4*2

```

Read & write in files
```nasm
bits 32
global start 

extern exit, fopen, fclose, fprintf, fread, printf 
import exit msvcrt.dll
import fopen msvcrt.dll
import fclose msvcrt.dll
import fprintf msvcrt.dll
import fread msvcrt.dll
import printf msvcrt.dll

segment data use32 class=data 
	input_file db "input.txt", 0
	output_file db "output.txt", 0 
	input_descriptor resd 1 
	output descriptor resd 1
	read_mode db "r", 0 
	write_mode db "w", 0 
	
	input_string resb 101 
	output_format db "%d", 0

	vowels db "aeiou", 0 
	vcount dd 0 

segment code use32 class=code 
	start: 
		;open input file
		push dword read_mode 
		push dword input_file 
		call [fopen] 
		; after calling fopen, eax will store the descriptor of the opened file
		add esp, 4 * 2 
		cmp eax, 0 ; in case the file was opened incorrectly, the file descriptor is zero
		jz final ; so we jump to the end of the program
		mov [input_descriptor], eax 

		;read input file 
		push dword [input_descriptor] ; address of the input file
		push dword 100 ;length of string to be read
		push dword 1 ;size of contents (1 - byte, 2 - word, 4 - dword)
		push dword input_string ;destination string
		call [fread]
		add esp, 4 * 4

		;close input file 
		push dword [input_descriptor]
		call [fclose]
		add esp, 4 

		; code where i counted the number of vowels -> vcount

		;open output file 
		push dword write_mode 
		push dword output_file 
		call [fopen]
		add esp, 4 * 2

		; write vcount to output file
		push dword [vcount]
		push dword output_format 
		push dword [output_descriptor]
		call [fprintf]
		add esp, 4 * 3

		; close output file 
		push dword [output_descriptor]
		call [fclose]
		add esp, 4

		final:
		;exit (0)
		push dword 0
		call [exit]

```