# Instructions
___
Class: [[ ASC]]
Type: Personal Notes
Tags: # 
___
Notes:
- basic syntax: op DEST, SOURCE
### MOV
```nasm
mov AX, [x] (value of x)
mov AX, x (address of x)
mov AX, 10
mov [x], AL
mov [x], [y] - WRONG!!
```

## Arithmetic Instructions
### ADD

### SUB
### MUL (unsigned)
- (implicit operand and dest  w/ *A* register)
```nasm
MUL CL  ;AX = AL * CL
		;it's implied that AL is the other operand
MUL CX  ;DX:AX [[Instructions]]= AX * CX
MUL ECX ;EDX:EAX = EAX * ECX
```
### DIV (unsigned)
```nasm
DIV CL  ; AL = AX / CL and AH = AX % CL
DIV CX  ; AX = DX:AX / CX and DX = DX:AX % CX
DIV ECX ; EAX = EDX:EAX / ECX and EDX = EDX:EAX % ECX
```

- Divide Error: when the result doesn't fit in the target register (or division by 0)
### IMUL (signed)
- for negative numbers
### IDIV (signed)
- for negative numbers
### ADC (Add With Carry)
- after every operation, the carry flag is updated
- after using ADC, the value of the carry flag from the **previous** addition is added to the result of the current addition 
### SBB (Sub With Carry)

## Bit Operations

## Promotion Instructions (Conversion to a higher Datatype)

^6132cc

### - **CBW** (Convert Byte (AL) to Word (AX))
- CBW works with signed numbers (positive values that exceed 127 will be considered negative (cos the sign bit is 1 duh))
- Only for AL --> A
- basically, converting a **signed** byte to a word implies copying the value of the signed bit in all of AH's bits
![[byte to word conversion]]
### - **CWD** (Convert Word (*AX*) to DoubleWord (*DX:AX*))
### - **CWDE** (Convert Word (*AX*) to ExtendedDoubleWord (*EAX*))
### - **CDQ** (Convert DoubleWord (*EAX*) to QuadWord (*EDX:EAX*))
### - **MOVZX** 
- `movzx d, s` loads in d (register), which must be of a size larger than s (reg/mem), the *unsigned* contents of s (leftmost bits filled with 0)
### - **MOVSX** 
- `movsx d, s` loads in d (register), which must be of a size larger than s (reg / mem) the *signed* contents of s (leftmost bits filled with the sign bit of s)

>[!tip]- The expression `movsx ax, [v]` is not a syntax error, since the size of the source operand must be less than the size of the destination (with the destination being a word, the source can only be a byte)
> However, `movsx eax, [v]` is indeed ambiguous, and will lead to a syntax error

## Stack Instructions
### push

### pushAD, popAD 
- pushes and pulls all general registers

## Comparisons - update flags only
**CMP** op1, op2: updates the flags according to op1 - op2
**TEST** op1, op2: updates the flags according to op1 and op2

## String Operators 

one may add **REP** only before string operations
**LODSB/W/D** -  load string (from ESI to register A)
**STOSB/W/D** - store string (from register A to EDI)
**MOVSB/W/D** - move string (from ES:ESI to DS:EDI)
![[stringInstructions]]
>[!important] we can't do something like mov byte\[esi], byte\[edi], so this is why the instruction movsb/w/d was added

the source and destination addresses are ES:SI, DS:DI - 16 bits; ESI, EDI - 32 bits
and, again, on 16 bits only 
ES:\[DI] = \[ES<<4+DI] and DS:\[SI] = \[DS<<4+DI] (this allows the addresses to be represented on 20 bits, instead of only 16 (which is the size of SI and DI))
however, on 32 bits, DS = ES = CS = SS = 0 

Example: (!!this is relevant on 16 bits only)
```nasm
mov ds, 0x1000 
mov si, 0 
mov esi, 0x2000 
mov di, 0 
movsb ; DS:[SI] (=[0x10000]) -> ES:[DI] (=[0x20000])
```

>[!important] on 32 bits, stuff like mov ds, 10 is useless (cause what is added to ds is not 10, but rather the 10th segment selector) (as in, the data segments are basically useless now)


**REP** - only in the context of string instructions
```nasm 
rep MOVSB
; is equivalent to 
repeat:
	lodsb
	stosb 
loop repeat
```

**SCASB/W/D** - compare (E)AL/X with EDI & EDI +-= size 
**CMPSB/W/D** - CMP \[ESI], \[EDI] & ESI, EDI +-= size

Examples:

```nasm 
a db 1,2,3,4
start: 
	mov esi, [a] ;esi = 0x04030201 
	mov esi, a ; esi = the address of a (in this case, 0)
	mov eax, 0 
	mov [a], eax ;a = 0x00000000
	mov a, eax ;error! <=> mov 0, eax (source operand can't be an immediate value)
```

```nasm 
data:
	a dw 0x102, 0x314, 0x203 ; a = 02|01|14|03|03|02
	lena equ ($-a)/2
	; we want to build b and c s.t. b has the lower bytes and c the higher ones 
	; in decreasing order  
	; so, b = 02|14|03 and c = |02|03|01 
	b resb lena 
	c resb lena 

code:
	start:
		mov ecx, lena 
		mov esi, a 
		mov edi, b
		jecxz final
		CLD ; REMEMBER TO CLEAR THE DIRECTION FLAG 
		repeat:
			lodsw ; ax = 0102 
			stosb ; al -> [edi], [edi] += 2
		loop repeat 

		sub esi, 2
		mov edi, c
		mov ecx, lena 
		STD 
		repeat2: 
			lodsw 
			mov al, ah 
			CLD
			stosb ; 
			STD 

		loop repeat2
	
		final: 

```

```nasm 
a dw 1,2,3,4,5
b dw 2,3,7,9,10 
len ($-b) / 2 
c resw len 

code
start:
	mov ecx, len
	mov ebx, b ; the same value of iterator for b
	jecxz final
	CLD 
	mov esi, a 
	mov edi, c 
	repeat: 
		lodsw ;ax = el a
		push esi ;put on stack address of iterator for a 
		mov esi, ebx 
		push ax
		lodsw ; ax = el b 
		pop dx ; dx = ax
		add ax, dx 
		stosw ; put ax in [edi]
		mov ebx, esi ; the current value of iterator for b 
		pop esi ; pop from the stack the address of a
	loop repeat

	final: 
		
```

```nasm 
; find an equivalent instruction for the set of instructions:
sub esp, 4 
mov edi, esp 
stosd
```
the code above is equivalent with pushing eax to the stack.
![[pushEax]]



```nasm 
s db 0,0,0,0,0
ls equ $ - s
d db 0,0,0,0,0 
ld equ $-d


mov ecx, ls
mov esi, s 
mod edi, d

jecxz final 

repeat: 
	lodsb ; al = [esi]
	stosb ; [edi] = al
	movsb ; [edi] <- [esi]

final:

```

## [[Flags#^b70bd8|Flag instructions ]]
## Misc 
- **LEA**  (load effective address)
	- tip: lea can only be used with a register as an L-value
```nasm
; eax = 18
mov [eax], 5 ; stores 5 in eax
lea ebx, [eax] ; moves the content of eax (5) to ebx 

; this is useful for loading a computed address in a register
mov eax, ebx+v-6 ; syntax error!! ebx+v-5 can't be computed at assembly time
lea eax, [ebx+v-6] ; correct!

```

- **XLAT** (translate)
	- translates the value in al to the al'th value in the string from ebx
	- syntax: \[reg_segment] XLAT (implicitly, DS:EBX)
	- tip: always remember to move the ADDRESS of the translation table to ebx
```nasm
; Example 1
mov ebx, Table 
mov al, 6 
xlat             ; AL <- DS:[EBX+6]
mov al, 6
ES xlat          ; AL <- ES:[EBX+6]
```

```nasm 
; Example 2 
segment data use32 
TabHexa db '0123456789ABCDEF'
numar resb 1 

segment code use32 
mov ebx, TabHexa 
mov al, numar
xlat
```

- **TIMES** - copies the instruction in the assembler for the specified number of times 
- **CALL** label - push EIP, jmp label
- **RET** x - pop EIP, add ESP, x
- **XCHG** - interchanges the contents of 2 L-values (at least one must be a register)