# Adding Words & QuadWords
___
Class: [[ ASC]]
Type: 
Tags: # 
Prerequisites: [[Flags#^982a8b|carry flag]], [[Registers]], [[src/Sem I/ASC/Instructions]], [[src/Sem I/ASC/Instructions#^6132cc|Promotion Operators]]
Date: October 14th 2024
Teacher: [[]]
___
Notes:

## Unsigned Version
```nasm
c dq 34567
a dw 15 
b dw 32
; a * b + c = ?

mov ax, word [a]
mov bx, word [b]
mul bx ; dx:ax = a*b

; move result to eax
push dx
push ax
pop eax

mov edx, 0 ; edx:eax = a*b 
add eax, dword[c]
adc edx, dword[c+4]

```

### Quad Words 
```nasm
c dd 15 
a dd 10 
b dd 20 

mov eax, [a]
mov ebx, [b]
mul ebx; edx:eax = eax * ebx

add eax, [c]
adc edx, 0
```


![[QuadAddition.excalidraw]]
## Signed Version
### Words, Double Words
```nasm
c dq 34567
a dw -15 
b dw 32 
; a*b+c=?

mov ax, word[a]
mov bx, word[b]
mul bx ; dx:ax = ax*bx

push dx
push ax
pop eax

cdq 
add eax, dword[c]
adc edx, dword[c+4]
```

### Quad Words
```nasm
c dd 15 
a dd -110 
b dd 20 

mov eax, [a]
mov ebx, [b]
imul ebx; edx:eax = eax * ebx

mov ebx, eax 
mov ecx, edx ;ecx:ebx = a*b
mov eax, [c]

cdq
add eax, [c]
adc edx, [c+4]
```