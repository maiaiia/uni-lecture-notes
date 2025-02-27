# Linear independence. Bases
___
Class: [[ Algebra]]
Type: 
Tags: # 
Date: November 11th 2024
___
## Linear independence 
Let $v_1,...,v_n \in V, V$ vector space. Then, the set is:
- *linearly independent* in V if $\forall k_i \in K, i \in \overline{i,n}$,  $k_1v_1+...+k_nv_n = 0 \iff k_1=...=k_n=0$
- *linearly dependent* if $\exists k_1,...,k_n$ not all zero s.t. $k_1v_1+...+k_nv_n = 0$
>[!tip] here, $:k_1v_1+...+k_nv_n = 0$ is called a dependence relationship 

> - a set consisting of a single vector $v$ is linearly dependent $\iff v = 0$
> - if $X \subseteq Y \subseteq V$, then 
> 	- if $Y$ is linearly independent, then $X$ is linearly independent 
> 	- if $X$ is linearly dependent, then $Y$ is linearly dependent 

### Theorem 
- A set of vectors $(v_i)_{i \in \overline{1,n}}$  is linearly dependent if $\exists i \in \overline{1,n} :$ $$v_i = \sum_{i=1}^n \alpha_iv_i$$
## Bases
let $V$ be a $K$ - vector space. A list of vectors $B = (v_1,...,v_n)\in V^n$ is called a *basis* of $V$ if all the conditions below are simultaneously satisfied:
- $B$ is linearly independent in $V$ 
- $B$ is a system of generators for $V$ ($\langle B \rangle = V$)
In this case, $\forall v \in V, \exists ! k_1,...,k_n : v = k_1v_1+...+k_nv_n$. Here, $[v]_B = \begin{pmatrix} k_1\\...\\k_n \end{pmatrix}$ are called the *coordinates* of $v$ in $B$
### Theorems 
- Every finitely generated vector space has a basis
- A list of vectors $B$ is a basis of $V \iff$ $\forall v \in V, \exists ! (k_1,...,k_n) : v = k_1v_1+...+k_nv_n$
- Let $f:V\rightarrow V'$ be a $K$-linear map and let $X = (v_1,...,v_n)$ be a list of vectors in $V$. Then,
	- if $f$ is injective and $X$ is linearly independent in $V$, then $f(X)$ is linearly independent in $V'$
	- if $f$ is surjective and $X$ is a system of generators in $V$, then $f(X)$ is a system of generators in $V'$ 
	- if $f$ is bijective and $X$ is a basis in $V$, $f(X)$ is a basis in $V'$ 

