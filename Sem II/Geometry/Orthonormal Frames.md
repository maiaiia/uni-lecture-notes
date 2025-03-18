# Orthonormal Frames
___
Class: [[Geometry]]
Type: Lecture
Tags: # 
Date: March 18th, 2025
___

A basis is called **orthogonal** is all its vectors are *mutually orthogonal*. Additionally, if all vectors are *unit vectors*, the frame is called **orthonormal**. $$[P]_\mathcal{K}=\begin{bmatrix}x_1\\\vdots\\x_n\end{bmatrix} = \begin{bmatrix}[a]cos\angle(a,e_1)\\\vdots\\ [a]cos(a,e_n)\end{bmatrix}=[\overrightarrow{OP}]_\mathcal{B}$$

>[!Proposition]
>Let $\mathcal{K}=(O,\mathcal{B})$ be an orthonormal frame. Then
>- $\langle a, b \rangle = a_1b_1+...+a_nb_n$
>- $|a|=\sqrt{a_z^2+...+a_n^2}$
>- $\cos\angle(a,b)=\cfrac{a_1b_1+...+a_nb_n}{\sqrt{a_z^2+...+a_n^2}\sqrt{b_z^2+...+b_n^2}}$

## Gram-Schmidt algorithm
Let $\mathcal{B}=(e_1,...,e_n)$ be a basis of $\mathbb{V}$
1. Construct an orthogonal basis $e_1',...,e_n'$ as follows:
	$e_1'=e_1$
	 $e_2'=e_2-\cfrac{\langle e_1',e_2 \rangle}{\langle e_1',e_1' \rangle}e_1'$ (subtract the magnitude necessary for getting a right angle between $e_1$ and $e_2$)
	 $e_3'= e_3-\cfrac{\langle e_1',e_3 \rangle}{\langle e_1',e_1' \rangle}e_1'-\cfrac{\langle e_2',e_3 \rangle}{\langle e_2',e_2' \rangle}e_2'$
	$\vdots$
2. Normalise the vectors to obtain the basis $$\mathcal{B'}=\Big{\{}\cfrac{e_i'}{|e_i|}\Big{\}}$$