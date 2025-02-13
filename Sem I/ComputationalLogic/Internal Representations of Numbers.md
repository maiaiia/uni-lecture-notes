# Internal Representations of Numbers
___
Class: [[ComputationalLogic]]
Type: Lecture Notes
Tags: #
Date: October 26th 2024
___
## Integers
### Unsigned Representation
- pretty str8forward, see [[Conversion Between Bases]]
### Signed Representation
- The most significant bit is used as a *sign bit*
	- S = 0 for positive numbers
	- S = 1 for negative numbers
#### Codes
- **Direct code**
	- copy the representation of |x| for the rest of the bits
	- set the sign bit to 1

- **Inverse code (1's complement)**
	- flip all bits of |x|
	- set the sign bit to 1

 - [[2's Complement. Overflow|Complementary code (2's complement)]]
	- inverse code
	- add 1
#### Operations. Overflow Rules
$\oplus$ - algebraic sum on n bits 
- $[x+y]_{compl} = [x]_{compl} \oplus [y]_{compl}$
- $[x-y]_{compl} = [x]_{compl} \oplus [-y]_{compl}$

"$\oplus$" Rules
1. if $x_1$ and $x_2$ have the same sign, but $x_1 \oplus x_2$ has the opposite sign $\Rightarrow$ ==overflow== 
2. if in the result of $x_1 \oplus x_2$ there is a carry digit outside the representation space, it can be discarded
## Real Numbers
### Sub-unitary convention
- the first bit is the sign bit
- it's basically the same as the signed representation (that's where the *convention* comes from; we simply assume the decimal point is after the sign bit)
### Fixed-point Representation
- there are 3 zones of the memory, with predefined dimensions:
	1. 1 - **S**ign bit (the most significant bit)
	2. I - integer part
	3. F - fractional part 
- the decimal point has a *fixed position*, which is *virtual* (as in it must be pointed out when representing it on paper :)) )
- the representation works pretty much like the *Signed Representation* and *Sub-unitary convention*, with the addition of the decimal point

> [!failure] some of the most significant bits of the integer part may be lost, if there are not enough bits allocated for it

### Floating-point Notation

> [!success] Advantage: This method has high precision; if there is an overflow, only the *least significant* digits are lost

- The real number x is written as $x = \pm 0,m \cdot b^e$, where 
	- m - mantissa
	- b - numeration base
	- e - exponent
(basically just shift the number after the decimal point and increase the exponent)
- the mantissa is always *sub-unitary*
- the mantissa cand also be *normalised*, by removing the most significant zeros after the decimal point (and increasing the exponent)
- the memory space looks something like: S + c + M, where c = e + q
- the mantissa can either be sub-unitary normalised OR 1 < mantissa < 2

>[!warning] if 1 < mantissa < 2, the first digit of the integer part is not represented internally(is hidden), but it will be used in operations
#### IEEE Standards
- **Single precision**
	- 32 bits, E = 8 bits, M = 23 bits, q = $2^7-1$, $e \in [-127, 128]$

- **Double precision**
	- 64 bits, E = 11 bits, M = 52 bits, q = $2^{10}-1$, $e \in [-1023, 1024]$