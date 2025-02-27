# Power Series
___
Class: [[ MathematicalAnalysis]]
Type: 
Tags: # 
___

## Def 
- Let $(a_n)$ be a sequence of real numbers and let $c \in \mathbb{R}$. The series $$\sum_{n=1}^\infty a_n(x-c)^n$$ is called a **power series** centred at c 
- $\exists ! R \in [0,\infty]$, called the **radius of convergence** of the power series s.t. the series
	- [[Alternating Series. Absolutely and Conditionally Convergent Series#^f6a6a5|converges absolutely]] when $|x-c|<R$
	- *diverges* when $|x-c|>R$
	- the behaviour of the series when $|x-c| = R$ is inconclusive
- the **convergence set** of a power series is $$C := \{x \in \mathbb{R} | \sum_{n=1}^\infty a_n(x-c)^n \text{ converges}\}$$
>[!tip] $C$ contains $(c-R,c+R)$ and, possibly, $\{c-R,c+R\}$ (the endpoints must be studied independently)
## Theorems 
- if one of the limits $$lim_{n\rightarrow \infty}\sqrt[n]{|a_n|} = L \in [0,\infty]$$ $$lim_{n\rightarrow \infty}\cfrac{|a_{n+1}|}{|a_n|} = L \in [0, \infty]$$
 exist, then the power series has the radius of convergence$$
R = 
\begin{cases} 
\frac{1}{L}, & \text{if } L \in (0, \infty) \\ 
0, & \text{if } L = \infty \\ 
\infty, & \text{if } L = 0.
\end{cases}$$
- $\forall x \in (c-R,c+R)$, the power series can be differentiated and integrated term by term

