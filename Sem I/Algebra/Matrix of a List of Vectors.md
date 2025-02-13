# Matrix of a List of Vectors
___
Class: [[ Algebra]]
Type: Lecture
Tags: # 
Date: November 21st 2024
Teacher: [[Septimiu Crivei]]
___

## Matrix of a List of Vectors
### Def
The **matrix of a list of vectors** $X$ in the basis $B$ is the matrix having its *rows* as the coordinates of the vectors in $X$ in the basis $B$

### Theorems 
Let $B = (v_1,...,v_n)$ be a basis of the $K$ - vector space $V$ and $X = (u_1,...,u_n)$ be a list of vectors in $V$ having the matrix $A$ in the basis $B$. Then:
1. $dim \langle X \rangle = rank(A)$
2. a basis of $\langle X \rangle$ is the list of non-zero row vectors $(c1,...,c_r)$ of an echelon form $C$ equivalent to $A$ 

## Matrix of a Vector
Let $V$ be a $K$ - vector space, $v \in V$ and $B = (v_1,...,v_n)$ a basis of $V$. If $v = k_1v_1+...+k_nv_n$ is the unique writing of $v$ as a linear combination of the vectors in $B$, then the matrix of v is $$[v]_B = \begin{pmatrix} k_1\\...\\k_n \end{pmatrix}$$
## Matrix of a Linear Map
### Def
The **matrix of a $K$ - linear map $f$** in the bases $B$ and $B'$, denoted as $[f]_{BB'}$ is the matrix having as its *columns* the coordinates of the vectors of $f(B)$ in the basis $B'$

### Theorems 
- $[f(v)]_{B'} = [f]_{BB'} \cdot [v]_B$
- $rank(f) = rank([f]_{BB'})$, where $B,B'$ are arbitrary bases 
- Let $V, V', V''$ be $K$ - vector spaces with the bases $B, B', B''$ and the dimensions $m,n,p$ respectively. Then, $\forall f,g,h \in Hom_K(V,V') and \forall k \in K$:
	1. $[f+g_{BB'}] = [f]_{BB'} + [g]_{BB'}$
	2. $[kf]_{BB'} = k \cdot [f]_{BB'}$
	3. $[h \circ f]_{BB'} = [h]_{BB'} \cdot [f]_{BB'}$  
- Let $V, V'$ be $K$ - vector spaces with the dimensions $n, m$ and the bases respectively. Then the map $$\phi:Hom_K(V,V')\rightarrow M_{m,n}(K), \phi(f)=[f]_{BB'},\forall f\in Hom_K(V,V')$$ is an *isomorphism* of vector spaces.

## Misc 
- the *null space* of $A:$ $\{x \in K^n | Ax = 0\}$ (equivalent to the kernel of a linear map)
- the *column space* of $A:$ the set of all linear combinations of the columns of $A$ ($\{b \in K^m | \exists x \in K^n : Ax = b \}$) (equivalent to the image of a linear map)
