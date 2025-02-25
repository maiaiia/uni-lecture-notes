# Affine Space
___
Class: [[Geometry]]
Type: Lecture
Tags: # 
Date: February 25th, 2025
Teacher: [[Simion Iulian]]
___
## Definitions 
- Two ordered pairs of points $(A,B)$ and $(C,D)$ are *equidistant* $\iff$ $[AB]$ and $[CD]$ are *congruent*
	- The equidistance relation is an [[Relations#^74d7ea|equivalence relation]]
		Proof: 
		1. reflexivity: $[AB] \equiv [AB]$
			-  Axiom III.1 $\rightarrow$ construct $[A'B']$ s.t. $[AB]\equiv [A'B']$
			-  Axiom III.2 $\rightarrow$ $[AB] \equiv [A'B']$ and $[AB] \equiv [A'B'] \Rightarrow [AB] \equiv [AB]$
		2. symmetry: $[AB] \equiv [CD] \Rightarrow [CD] \equiv [AB]$
			- Axiom III.2 $\rightarrow$ $[CD] \equiv [CD]$ and $[AB] \equiv [CD] \Rightarrow [CD] \equiv [AB]$
		3. transitivity: $[AB]\equiv [CD]$ and $[CD] \equiv [EF] \Rightarrow [AB] \equiv [EF]$
			- Axiom III.2 $\rightarrow$ $[AB] \equiv [CD]$ and $[EF] \equiv [CD] \Rightarrow [EF] \equiv [AB]$
- Two pairs of distinct points $(A,B)$ and $(C,D)$ are *equidirectional* if (intuitively, definition in the course) they have the same direction (denoted $|AB\rangle = |CD\rangle$)
- Two ordered pairs of points $(A,B)$ and $(C,D)$ are called *equipollent* (denoted $(A,B) ~ (C,D)$) if the segments $[AD]$ and $[BC]$ have the same midpoint
	- For 2 ordered pairs of points $(A,B)$ and $(C,D)$, the following statements are equivalent
		1. $(B,A) ~ (D,C)$
		2. $(A,B) ~ (C,D)$
		3. $ABCD$ is a parallelogram, possibly degenerate 
		4. $|AB\rangle  = |CD\rangle$ and $[AB] \equiv [CD]$
		5. $|AB\rangle = |CD\rangle$ and $|AB| = |CD|$
- The equivalence class of the equipollence relation are called *vectors*. The vector containing the ordered pair $(A,B)$ is denoted by $\overrightarrow{AB}$ 
- The set of vectors with addition is an abelian group 