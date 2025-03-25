# Cross Product
___
Class: [[Geometry]]
Type: Lecture
Tags: # 
Date: March 25th, 2025
___

## Def 
Let $a,b \in \mathbb{V}^3$ be two vectors. The *cross product* of $a$ and $b$, denoted $a \times b$, is the vector defined by the following properties:
1. If $a \parallel b$, $a \times b = 0$
2. Otherwise
	1. $|a\times b| =$ area of the parallelogram spanned by $a$ and $b$ 
	2. $a \times b \perp a$ and $a \times b \perp b$
	3. $(a,b,a \times b)$ is a right oriented basis of $\mathbb{V}^3$

>[!Proposition]
>$$a \times b = |a| \cdot J^{-1}(Pr^{\perp a}(b))$$

$$(a_1i+a_2j+a_3k)\times(b_1i+b_2j+b_3k)=\begin{vmatrix} i && j && k \\ a_1 && a_2 && a_3 \\ b_1 && b_2 && b_3 \end{vmatrix}$$

## Properties
The scalar product is 
- **linear**: 
- **skew symmetric**: 
## Theorems
### Double Cross Formula
For any vectors $a,b,c$ we have $$(a\times b)\times c = \langle a,c \rangle \cdot b = \langle b,c\rangle \cdot a$$
*Proof*:
Assume all vectors are $\neq 0$ (otherwise, the proof is trivial). 
It suffices to prove the formula for $a,b,c$ *unit vectors* since, if it holds for unit vectors, we can push scalars out using the *linearity* of the cross product.
It also suffices to prove the formula in the case when $c = a$ or $c = b$. Indeed, any vector $c$ can be written as $c = \alpha a + \beta b + \gamma (a\times b)$ (since $a, b, a \times b$ )
