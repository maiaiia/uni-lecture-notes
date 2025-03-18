# Normal Vectors
___
Class: [[Geometry]]
Type: Lecture
Tags: # 
Date: March 18th, 2025
___

Let $\mathcal{H}: a_1x_1+...+a_nx_n=b$ be a [[Affine subspaces of An#^f0b0a5|hyperplane]] and $Q \in \mathcal{H}$. Then, $P \in \mathcal{H}$ if and only if $\langle n, \overrightarrow{QP} \rangle = 0$, equivalently, if and only if $n \perp \overrightarrow{QP}$, where $n = (a_1,...,a_n)$

## Angles between lines and hyperplanes
- $cos \angle (v_1,v_2)=\cfrac{\langle v_1,v_2 \rangle}{|v_1|\cdot|v_2|}$
### Dihedral angle between 2 planes
![[dihedral_angle]]
## Distance from a point to a hyperplane 
Let $\mathcal{K}$ be an *orthonormal* frame. Consider the point $P(p_1,...,p_n)$ and a hyperplane $\mathcal{H}:a_1x_1+...+a_nx_n=b$. Then $$d(P,\mathcal{H})=\cfrac{|a_1p_1+...+a_np_n-b|}{\sqrt{a_1^2+...+a_n^2}}$$
Proof:
Let $Q$ be an arbitrary point on the hyperplane and $n = \begin{bmatrix}a_1\\\vdots \\ a_n\end{bmatrix}$. Then $d(P,\mathcal{H})=|Pr_n^\perp(\overrightarrow{QP})|=\big{|}\cfrac{\langle n, \overrightarrow{QP} \rangle}{\langle n, n \rangle}n\big{|} = \Big{|}\cfrac{\begin{bmatrix}a_1\\\vdots \\ a_n\end{bmatrix}\cdot \begin{bmatrix}p_1-q_1\\\vdots \\ p_n-q_n\end{bmatrix}}{\sqrt{a_1^2+...+a_n^2}}\Big{|}= \cfrac{|a_1(p_1-q_1)+...+a_n(p_n-q_n)|}{\sqrt{a_1^2+...+a_n^2}}$

