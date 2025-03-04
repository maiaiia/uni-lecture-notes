# Changing the basis in a Vector Space
___
Class: [[Geometry]]
Type: Lecture 
Tags: # 
Date: March 4th, 2025
___

## Steps 
1. Change the origin 
2. Change the direction of the axis (the basis)

Let $\mathcal{E}, \mathcal{F}$ be bases of a vector space $V$ and let $v \in V$.
$\Rightarrow \exists x_1,...,x_n$ and $x_1',...,x_n'$ s.t. $x_1e_1+...+x_ne_n = v = x_1'f_1+...+x_n'f_n$
$[v]_\mathcal{E} = \begin{bmatrix} x_1 \\ \vdots \\ x_n \end{bmatrix} = M_{\mathcal{E}\mathcal{F}}\cdot [v]_\mathcal{F}$, where $[v]_\mathcal{F} = \begin{bmatrix} x_1' \\ \vdots \\ x_n' \end{bmatrix}$ 
We can, however, write each vector of the basis $\mathcal{F}$ as a linear combination of vectors in basis $\mathcal{E}$
$v = x_1' \sum_{j=1}^n a_{1j}e_j+...+x_n'\sum_{j=1}^n a_{nj}e_j = \sum_{j=1}^n \big{(}\sum_{i=1}^nx_i'a_{ij}\big{)}e_j$ 

## Theorems
>[!important] Let $\mathcal{K} = (O,B), \mathcal{K}' = (O',B')$ be frames in $\mathbb{A}$. Then 
>$$[P]_{\mathcal{K}'}=M_{B'B}([P]_\mathcal{K}-[O']_\mathcal{K})(*)$$ 

*Proof*: 
$(*) \Leftrightarrow [\overrightarrow{OP}]_{B'} = M_{B'B}\cdot ([\overrightarrow{OP}]_{B} - [\overrightarrow{OO'}]_{B})$ 
Let $\tilde{\mathcal{K}} = (O',B)$
1. Change origin:  $[P]_{\tilde{\mathcal{K}}}= [\overrightarrow{O'P}]_{B} = [\overrightarrow{OP}]_{B} - [\overrightarrow{OO'}]_{B}$ 
2. Change basis: $[P]_{\mathcal{K}'} = [\overrightarrow{O'P}]_{B'} = M_{B'B}([\overrightarrow{O'P}]_{B} = [\overrightarrow{OP}]_{B} - [\overrightarrow{OO'}]_{B})$

>[!important] Let $\mathcal{K} = (O,B), \mathcal{K}' = (O',B')$ be frames in $\mathbb{A}^n$. For any point $P \in \mathbb{A}^n$ we have 
> $$[P]_{\mathcal{K}'} = M_{B'B}\cdot([P]_\mathcal{K}-[O']_\mathcal{K}) = M_{BB'}^{-1}\cdot([P]_\mathcal{K}-[O']_\mathcal{K})=M_{B'B}\cdot[P]_\mathcal{K}+[O]_{\mathcal{K}'}$$ 