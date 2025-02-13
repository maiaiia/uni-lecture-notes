# Neighbourhoods in Rn
___
Class: [[ MathematicalAnalysis]]
Type: Lecture
Tags: # 
Date: December 30th 2024
Teacher: [[]]
___

## Definitions 
A set $A \subseteq \mathbb{R}^n$ is called *bounded* if $\exists r > 0: ||x||\leq r, \forall x \in A$
### Balls :>
Let $x_0 \in \mathbb{R}^n$ and $r>0$. The *open ball* of centre $x_0$ and radius $r$ is given by $$B(x_0,r):=\{x\in \mathbb{R}^n | \|x-x_0\| < r\}$$ and the *closed ball* centre $x_0$ and radius $r$ is given by $$\overline{B}(x_0,r)=B[x_0,r] :=\{x\in \mathbb{R}^n | \|x-x_0\| \leq r\}$$
### Neighbourhoods. Interior & Closure
- A set $V \subseteq \mathbb{R}^n$ is a *neighbourhood* of $x \in \mathbb{R}^n$ if $\exists r > 0 : B(x,r) \subseteq V$ 
- Let $A \in \mathbb{R}^n$
	- *interior* of $A: int(A):=\{x\in \mathbb{R}^n|\exists V \in \mathcal{V}(x):V \subseteq A$ 
	- *closure* of $A : cl(A):=\{x\in \mathbb{R}^n|\forall V \in \mathcal{V}(x), V \cap A\neq \emptyset\}$ 
	- *boundary* of $A: bd(A) := \{x \in \mathbb{R}^n | \forall V \in \mathcal{V}(x), V \cap A \neq \emptyset \text{ and } V \cap A^c \neq \emptyset$ 
## Propositions & Theorems
- $\forall A \subseteq \mathbb{R}^n, cl(A) = A \cup bd(A)$
- $int(A)\subseteq A \subseteq cl(A)$ 
