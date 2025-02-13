# Connectives
Class: [[ComputationalLogic]]
Tags: # 
Date: October 17th 2024
Teacher: [[Mihaela Lupea]]

---
## Truth Tables of all of the Connectives
### $\neg$ negation 
latex code: \\neg
this is a *unary* connective

| p   | $\neg$p |
| --- | ------- |
| T   | F       |
| F   | T       |
### $\rightarrow$ - implication 
latex code: \\rightarrow
> $p \rightarrow q$  

| p   | q   | p$\rightarrow$q |
| --- | --- | --------------- |
| T   | T   | T               |
| T   | F   | F               |
| F   | T   | T               |
| F   | F   | T               |

### $\land$  - conjunction (logical and)
latex code: \\land

| p   | q   | p$\land$q |
| --- | --- | --------- |
| T   | T   | T         |
| T   | F   | F         |
| F   | T   | F         |
| F   | F   | F         |


### $\lor$ - disjunction (logical or) 
latex code: \\lor

| p   | q   | p$\lor$q |
| --- | --- | -------- |
| T   | T   | T        |
| T   | F   | T        |
| F   | T   | T        |
| F   | F   | F        |

### $\leftrightarrow$ - equivalence 
latex code: \\leftrightarrow

| p   | q   | p $\leftrightarrow$ q |
| --- | --- | --------------------- |
| T   | T   | T                     |
| T   | F   | F                     |
| F   | T   | F                     |
| F   | F   | T                     |

### $\uparrow$ - nand 
latex code: \\uparrow

| p   | q   | p$\uparrow$q |
| --- | --- | ------------ |
| T   | T   | F            |
| T   | F   | T            |
| F   | T   | T            |
| F   | F   | T            |

### $\downarrow$ - nor  
latex code: \\downarrow

| p   | q   | p$\downarrow$q |
| --- | --- | -------------- |
| T   | T   | F              |
| T   | F   | F              |
| F   | T   | F              |
| F   | F   | T              |

### $\oplus$ - xor 
latex code: \\oplus
a $\oplus$ b $\equiv$ (a $\land \neg$b)$\lor$($\neg$a$\land$b)

| p   | q   | p$\oplus$q |
| --- | --- | ---------- |
| T   | T   | F          |
| T   | F   | T          |
| F   | T   | T          |
| F   | F   | F          |



misc

## Sets of connectives
A set of connectives is *functionally complete* if all truth tables can be expressed as a formula involving only those connectives. In other words, all other connectives can be expressed using the connectives from the set 