# Conversion Between Bases
___
Class: [[ComputationalLogic]]
Type: Lecture Notes
Teacher: [[Mihaela Lupea]]
___

> [!info] Throughout the entirety of this note, I'll refer to b as the source base and h as the destination base
## Substitution Method 
 - All computations are performed in the destination base
- Steps:
	1. convert all digits from source representation into destination base
	2. convert b into base h
	3. multiply each digit by h^pos (indexation starts from the decimal point) 
	
> [!tip] this method is useful for converting to a higher base (b < h), since steps 1 and 2 can be skipped entirely

## Successive Divisions and Multiplications 
- All computations are performed in the source base
- Steps:
	- **Integer Part** (Successive Divisions):
		1. divide the integer part by h, obtaining a quotient and a remainder
		2. while the quotient is $\neq$ 0, repeat step 1
		3. write the remainders in *reverse* order of obtaining them
	- **Fractional Part** (Successive Multiplications):
		1. multiply the fractional part by h, obtaining an integer part and a fractional one
		2. keep multiplying the fractional part until one of the following conditions is satisfied
			- the fractional part becomes 0
			- you've reached the desired number of digits 
			- periodicity is obtained
		3. the integer parts, written in the order of obtaining them, are the fractional part in the destination representation
## Rapid Conversions
- Usually from base $2^n$ to base $2^m$, where m/n (or n/m)
### Base 2 $\rightarrow$ Base $2^k$ 
- Starting from the decimal point, make groups of k binary digits (adding insignificant zeros, if necessary) and replace them with their corresponding digit in base $2^k$

### Base $2^k$  $\rightarrow$ Base 2
- Replace each digit with its equivalent in base 2
 > [!tip] Remember to use *k* base 2 digits for each base $2^k$ digit