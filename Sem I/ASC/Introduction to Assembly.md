# Introduction to Assembly
___
Class: [[ ASC]]
Type: Seminar
Tags: # 
Teachers: [[Nicolae Bodea]], [[Flavius Ilinoiu]]
___
Notes: 
## Data segment
```nasm
global start <=> int main()
extern exit 
import exit msvcrt - allows us to call exit 
```

```nasm
segment data use 32 class = data
; variables are declared here
....
....
segment code use 32 class = code
; variables can't be declared in the segment code
```
## [[Variables]]
## [[ Sem I/ASC/Instructions|Instructions]]
