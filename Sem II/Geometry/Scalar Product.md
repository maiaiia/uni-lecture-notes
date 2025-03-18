# Scalar Product
___
Class: [[Geometry]]
Type: Lecture
Tags: # 
Date: March 18th, 2025
___

The *scalar product* of two vectors $a,b \in \mathbb{V}$ is the real number $$(a,b)=\begin{cases}0\text{, if one of the two vectors is zero} \\ |a|\cdot|b|\cdot \cos\angle(a,b) \text{ otherwise} \end{cases}$$
- $Pr_a^\perp(b)=\cfrac{\langle a,b \rangle}{\langle a,a \rangle}a = |b|\cdot \cos \langle a,b\rangle \cdot \cfrac{a}{|a|} = pr_a^\perp(b)\cdot \cfrac{a}{|a|}$

## Properties
The scalar product 
- is *bilinear* - $\forall a,b \in \mathbb{R}$ and $u,v \in \mathbb{V}$, $\langle au + bv, w \rangle = a \langle u ,w \rangle + b\langle v,w \rangle$ 
- is *symmetric* - $\langle v,w \rangle = \langle w,v \rangle$
- is *positive definite* - If $v \neq 0$ then $\langle v,v\rangle>0$
- recognises *right angles* and *unit lengths* - $v \perp w \iff \langle v, w \rangle = 0$; $|v|=1 \iff \langle v,v \rangle = 1$
