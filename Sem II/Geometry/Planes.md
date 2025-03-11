# Planes
___
Class: [[Geometry]]
Type: Lecture
Tags: # 
Date: March 11th, 2025
___

## Equations
Planes are sets of points in S with the property that, if you fix a point in S
$\phi^3_Q(S) = \{\overrightarrow{QP}:B\in S\}$ is a 2D subspace of $\mathbb{V}$
$S = \{P \in \mathbb{A}^3:\overrightarrow{QP}=sv+tw$ for some $s,t\in \mathbb{R}$
$S : z = \begin{bmatrix} x \\ y \\ z \end{bmatrix}=\begin{bmatrix} x_Q \\ y_Q \\ z_Q \end{bmatrix}+t\begin{bmatrix} v_x \\ v_y \\ v_z \end{bmatrix}+s\begin{bmatrix} w_x \\ w_y \\ w_z \end{bmatrix}$

$\overrightarrow{QP}$ linearly dependent on $v,w$ $\Rightarrow (S): \begin{bmatrix} x-x_Q & y-y_Q & z-z_Q \\ v_x & v_y & v_z \\ w_x & w_y & w_z \end{bmatrix} = 0$

Use the formula above to obtain 
$\pi : \cfrac{x}{\alpha}+\cfrac{y}{\beta}+\cfrac{z}{\gamma}=1$, where $\alpha = \cfrac{-d}{a}$, $\beta = \cfrac{-d}{b}$ and $\gamma = \cfrac{-d}{c}$

## Relative positions of planes 
Let $\pi_1: a_1x+b_1y+c_1z+d_1=0$ and $\pi_2: a_2x+b_2y+c_2z+d_2=0$
$\begin{cases}\pi_1: a_1x+b_1y+c_1z+d_1=0 \\ \pi_2: a_2x+b_2y+c_2z+d_2=0\end{cases}$
If the rank of the matrix of coefficients is 1, the planes intersect in a line. If the rank is 2, the planes are parallel
$(t=)\cfrac{x-x_Q}{v_x}=\cfrac{y-y_Q}{v_y}=\cfrac{z-z_Q}{v_z}$ %%take 2 pairs out of these in order to find the line%%

