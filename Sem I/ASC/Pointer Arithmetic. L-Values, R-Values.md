# Pointer Arithmetic. L-Values, R-Values
___
Class: [[ ASC]]
Type: Lecture
Tags: # 
Date: November 7th 2024
___

## Valid Operations
Any operations which enables the programmer to parse the memory in such a way that a valid address is reached are acceptable 
1. addition of a constant to a pointer $\Rightarrow$ pointer
2. subtraction of a constant and a pointer $\Rightarrow$ pointer
3. subtraction of 2 pointers $\Rightarrow$ scalar (number of bytes between 2 addresses, e.g.)

## L&R Values
>[!info]- the most general form of accessing memory: <br> \<address_computation_expression> := \<expression> 
>**LHS** - Addresses
>**RHS** - Contents

### Examples
```nasm
a dd -17, 'a', 4 

mov [ebx + 2*edx+v-7], a+2
```
- on the lhs, the *dereferencing operator* (\[]) is used when computing the memory address
- on the rhs, it is used for accessing the contents from a certain address
in cpp
```c++
a[7] <=> *(a+7) <=> *(7+a) <=> 7[a]
```

```nasm
mov eax, [ebx*3] ; is ok! equivalent to mov eax, [ebx + ebx * 2]
mov eax, [ebx*2]
mov eax, [esp*5] ; wrong! esp can't be an index, only a base 
mov eax, [ebx+2]
mov eax, ebx+2 ; syntax error! operation can't be determined at assembly time
```
## C++ reference variables (&)
- passing variables by reference when calling as a function parameter 
```c++
float f(int &x, y)
```
- defining aliases
```c++
int & j = i (i and j both point to the same address)
```
- returning L-values as a result of function calls 
```c++
int f(i) {return v[i]}
rez = f(7) //rez <- v[7]

int& f2(i) {return v[i]}
f2(7) = 79 //v[7] <- 49
```

