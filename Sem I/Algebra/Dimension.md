# Dimension
___
Class: [[ Algebra]]
Type: 
Tags: # 
Date: November 12th 2024
Teacher: [[]]
___

## Prerequisites
### Steinitz Theorem 
Let $V$ be a $K$ - vector space, $X = (x_1,...,x_m)$ a linearly independent list of vectors of $V$ and $Y = (y_1,...,y_n)$ a system of generators of $V$. Then:
1. $m \leq n$ 
2. $m$ vectors of $Y$ can be replaced by the vectors of $X$, obtaining a new system of generators of $V$ 
### Theorem 
Any two bases of a vector space have the same number of elements

## Def
>[!important] the number of elements in a basis of $V$ is called the **dimension** of $V$ and is denoted by **dim$_KV$** or simply by **dim $V$**

### Theorems 
- Let $V$ be a $K$-vector space. The following are equivalent:
	1. dim $V = n$
	2. The maximum number of linearly independent vectors in $V$ is $n$
	3. The minimum number of generators for $V$ is $n$ 
- Let $V$ be a $K$ - vector space with dim $V = n$ and $X = (u_1,...,u_n), u_i \in V$. Then:$$X \text{ is linearly independent} \iff X \text{ is a system of generators}$$
- Any linearly independent list of vectors in a vector space can be completed to a basis of the vector space
- Let $V$ be a $K$-vector space and $S \leq V$. Then:
	1. Any basis of $S$ is a part of a basis of $V$ 
	2. dim $S \leq$ dim $V$ 
	3. dim $S =$ dim $V \iff S = V$ 
- Let $V$ be a $K$ - vector space and let $S \leq V$. Then $\exists \overline{S} \leq V : V = S \oplus \overline{S}$ and $\text{dim}V = \text{dim}S + \text{dim}\overline{S}$
>[!important] $\overline{S}$ is called a *complement* of $S$ in $V$. A subspace may have more than one complement
- $V \simeq V' \iff \text{dim}V = \text{dim}V'$
- *First Dimension Theorem*:
	- Let $f:V\rightarrow V'$ be a $K$ - linear map. Then 
		1. dim $(Kerf) :=$ null$(f)$ is the *nullity* of $f$ 
		2. dim$(Im f) :=$ rank$(f)$ is the *rank* of $f$ 
	- dim $V =$null $(f)$ + rank$(f)$ 
- *Second Dimension Theorem*:
	- Let $S,T \leq V \Rightarrow$ dim $S +$ dim $T$ = dim$(S \cap T)+$ dim$(S+T)$
 

