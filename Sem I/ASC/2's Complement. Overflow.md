# 2's Complement. Overflow
___
Class: [[ASC]], [[ComputationalLogic]]
Type: 
Tags: # 
Date: October 24th 2024
___
Notes:
# 2's Complement
## Def
- A mechanism for representing negative numbers 
- neg_number --> $2^n$ - abs(neg_number) (when represented on n bits)
- basically the sum of the absolute values of the 2 interpretations (signed & unsigned) is $2^n$, where n is the number of bits (and obviously imo but Vancea finds this revolutionary, $2^n$ is the number of values that can be represented on n-bits)
## Computing the 2's complement of a value
### Method 1 (b10 - b2)
- compute $2^n - abs(V)$
- represent the result in base 2
### Method 2 
- Step 1: represent the absolute value in base 2
- Step 2: flip all bits 
- Step 3: add 1
### Method 3
- Step 1: represent the absolute value in base 2
- Step 2: starting from the least significant bit, keep all bits the same, up until (and including) the first '1' 
- Step 3: flip all remaining bits 
## Interpreting the binary representation of a value
1. for a representation of type $\overline{0bb..b}_{(2)}$, the values in the signed and unsigned interpretations are the same (b2-b10)
2. for a representation of type $\overline{0bb..b}_{(2)}$, having the value $+\overline{abc}$ , the binary representation of $-\overline{abc}$ is the 2's complement (b2-b2)       <3
3. for a representation of type $\overline{1bb..b}_{(2)}$, having the value $+\overline{abc}$  in the unsigned interpretation, the value in the signed interpretation is $2^8 - \overline{abc}$ (b2-b2)
4. !!! for a representation of type $\overline{1bb..b}_{(2)}$, having the value $+\overline{abc}$  in the unsigned interpretation, the binary representation of  $-\overline{abc}$  needs more bits (upgrade to a greater datatype in assembly or simply add a bit on paper)

# Overflow
CF = 1 if the result of the LPO (last performed operation) exceeds the number of bits that the operation is performed on
>[!tip] the microprocessor is the one responsible with setting the CF and the OF 

## Overflow Flag Rules
- Addition
	- if the sign of the operands is the same, but different to the sign of the result => overflow = 1
- Subtraction 
	- incorrect result 
- Multiplication ^0d82a7
	- If the result fits in the size of the original datatype, CF = OF = 0; otherwise, CF = OF = 1
- Division
	- 
>[!tip]- in the case of division overflow, the *operating system* will raise a Runtime Error 
>extra: the specific error is Divide overflow / Division by zero / Zero divide - interrupt zero
>explanation: the result of the computation is equivalent to "infinity"



