# Location Counter
___
Class: [[ ASC]]
Type: 
Tags: # 
Date: November 14th 2024
Teacher: [[]]
___

Notes:
- a pointer (the offset inside the segment that the processor is currently working in) 
>[!important] every single segment has its own location counter
- specified in the source code by "$"

!! not for the exam 
in NASM only, there also exists \$$ location counter
one can also define sections (which are subsegments)
so, \$$ refers to the offset compared to starting address of the current section 

if there are no sections defined in the code, \$$ refers to the beginning of the current segment


### Examples
```nasm 
segment data:
	a db 17, -2, 0x0ff, 'xyz'
	db 8, 5, 6, 9 
	dw 0xff3
```
options for computing the length of a:
```nasm
	lga equ $ - a ; lga is stored in the assembler's table of constants
				  ;	not in memory
```
```nasm
	lga dw $ - a ; here, lga is a regular variable 
```
```nasm
	lga dw $ - $$ ; since a is the first variable defined in the data segment, 
				  ; lga is still the length of a 
```
```nasm
	lga dw $ - data ; this is possible ONLY in tasm and masm, where
	                ; data represents the starting address of the data segment
	                ; in nasm, data is a FAR address, => syntax error 
```
```nasm
	lga dw lga - a ; this works since lga's location in memory is allocated 
				   ; before the contents within that memory location are set
```
```nasm 
	c dw 40 
	lga dw c - a
```

remember, the assembler is responsible with
- implicitly prefixing all the offsets with one of the 3 segment registers:
	- **[[Registers#^c6b8ef|CS]]** - (ex: when using jumps, call, ret)
	- **[[Registers|SS]]** - when using EBP or ESP as a base (no matter of index or scale)
	- **[[Registers|DS]]** - for the rest of data accesses
>[!tip]- offset_address = \[base] + \[index\*scale] + \[constant] (32 bit formula

>[!important] whenever it is possible, the assembler attempts to add a base to the offset address. thus, the first register found in the offset address that can be a base will be a interpreted as a base

Exercise: 
find the prefix of the following labels 
```nasm
mov eax, [v]               ; DS:[00401005]
mov eax, [ebx]             ; DS:[ebx]
mov eax, [epb]             ; SS:[ebp]
mov eax, [ebp * 2]         ; mov eax, dword ptr SS:[ebp+ebp]
mov eax, [ebp * 3]         ; mov eax, dword ptr SS:[ebp+ebp*2]
mov eax, [ebp * 4]         ; DS:[ebp*4]
mov eax, [ebx + esp]       ; SS:[ebx + esp] - esp can't be an index 
mov eax, [esp + ebx]       ; SS:[ebx + esp]
mov eax, [ebx + esp * 2]   ; syntax error
mov eax, [ebx + ebp * 2]   ; DS:[ebx + ebp * 2]
mov eax, [ebx + ebp]       ; DS:[ebx + ebp]
mov eax, [ebp + ebx]       ; SS:[ebp + ebx]
mov eax, [ebx * 2 + ebp]   ; SS:[ebx*2+ebp]
mov eax, [ebx * 1 + ebp]   ; SS - if the scale is explicitly added
mov eax, [ebp * 1 + ebx]   ; DS
mov eax, [ebx*1 + ebp*1]   ; SS - the first reg. mult. by a scale is set as index
mov eax, [ebp*1 + ebx*1]   ; DS 
mov eax, [ebp*1 + ebx*2]   ; SS (ebx can't be a scale, since it's mult by 2)
 ```

>[!tip] written exam: remember to say that cases such as mov eax, \[ebx+ebp] are ambiguous

