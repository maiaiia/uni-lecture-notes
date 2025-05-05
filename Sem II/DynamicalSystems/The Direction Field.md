# The Direction Field
___
Class: [[DynamicalSystems]]
Type: Lecture
Tags: # 
Date: May 5th, 2025
___
(the geometry behind a differential equation)

>[!definition] 
>Consider a planar system $\begin{cases}\dot x = f_1(x,y)\\ \dot y = f_2(x,y)\end{cases}$. Fix $(x_0, y_0) \in \mathbb{R}^2$ and consider the vector based in $(x_0, y_0)$ and parallel to $v(f_1(x_0, y_0), f_2(x_0, y_0))$. Then, the collection of all these vectors is the *direction field*.

<u>Example</u>: Prove that the direction field of the system $\begin{cases}\dot x = -y\\ \dot y = x\end{cases}$ is orthogonal to the position vector in each point of $\mathbb{R}^2$.

<u>Sol</u>: Let $(x_0, y_0) \in \mathbb{R}^2$. The direction field is parallel to $(-y_0, x_0)$.
Since the scalar product $(x_0, y_0) \cdot (-y_0, x_0) = 0$, we deduce that the 2 vectors are orthogonal.


 
>[!definition] 
>Consider the diff. eq $\cfrac{dy}{dx}=g(x,y)$. 
Let $(x_0, y_0) \in \mathbb{R}^2$. Consider the vector base l in $\mathbb{R}^2$ of slope $g(x_0, y_0)$.The collection of all these vectors is the direction field associated to $\cfrac{dy}{dx} = g(x,y)$.

<u>Example</u>: $\cfrac{dy}{dx}=-\cfrac{x}{y}$. Justify that the direction field is orthogonal to the position vector. 
<u>Sol</u>: The slope of the direction field is $-\cfrac{x_0}{y_0}$. In addition, the slope of the position vector is $\cfrac{y_0}{x_0}$. Since $\cfrac{y_0}{x_0} \cdot - \cfrac{x_0}{y_0} = -1$, we deduce the orthogonality.

Conclusion: $\begin{cases} \dot x = -y \\ \dot y = x \end{cases}$ and $\cfrac{dy}{dx}=-\cfrac{x}{y}$ have the same direction field.

<u>Exercise</u>: $\cfrac{dy}{dx}=1-\cfrac{x}{y^2}$. Represent the direction field in the points $(1,1), (0,1)$ and $(1,0)$
Let $g(x,y)=1-\cfrac{x}{y^2}$.
$(1,1) \mapsto g(1,1)=0$. We have to represent the vector based in $(1,1)$ of slope $m=g(1,1)=0$
$(0,1) \mapsto g(0,1)=1$. We have to represent the vector based in $(0,1)$ of slope $m=g(0,1)=1$
$(1,0) \mapsto g(1,0)=-\infty$. We have to represent the vector based in $(1,0)$ of slope $m=g(1,0)=\infty$
![[The Direction Field 2025-05-05 12.21.58.excalidraw]]

>[!property] 
>The direction is tangent to the orbits of the planar system, respctively is tangent to the solution curves of the differential equation.

<u>Proof</u>:
First we consider the differential equation $\cfrac{dy}{dx}=g(x_0,y_0)$. Fix $(x_0,y_0)\in \mathbb{R}^2$ and consider the solution $\psi$ of this differential equation whose graph contains $(x_0, y_0)$. Then
$(1)\begin{cases} \psi'(x)=g(x,\psi(x)), \forall x \in I \\ \psi(x_0)= y_0 \end{cases}$. We know that the slope of the direction field in $(x_0,y_0)$ is $g(x_0, y_0)$
We also know that the slope of the graph of $\psi$ in $(x_0, y_0)$ is $\psi'(x_0)$.
We only need to prove that $g(x_0,y_0)=\psi'(x_0)$
But $(1) \Rightarrow \psi'(x_0)=g(x_0, \psi(x_0))=g(x_0,y_0)$, qed.

Now, we consider $\begin{cases} \dot x = f_1(x,y) \\ \dot y = f_2(x,y) \end{cases}$. Fix $(x_0, y_0)$. Let $\varphi(\varphi_1, \varphi_2)$ be a solution of this system, whose orbit (image) contains $(x_0, y_0)$ $\Rightarrow \begin{cases} \dot \varphi_1(t) = f_1(\varphi_1(t), \varphi_2(t)) \\ \dot \varphi_2(t) = f_2(\varphi_1(t), \varphi_2(t)) \\ \varphi_1(t_0) = x_0, \varphi_2(t_0) = y_0 \end{cases}, \forall t \in I$. We know (by definition) that the direction field $(x_0, y_0)$ is parallel to $(f_1(x_0, y_0), f_2(x_0, y_0))$. 
The tangent to the orbit $\begin{cases} x = \varphi_1(t) \\ y = \varphi_2(t)\end{cases} t \in I$ in the point $(x_0, y_0)=(\varphi_1(t_0), \varphi_2(t_0))$ is parallel to the vector $(\dot \varphi_1(t_0), \dot \varphi_2(t_0))$. 
But $\varphi_1'(t_0) = f_1(\varphi_1(t_0),\varphi_2(t_0)) = f_1(x_0, y_0)$. Similarly, $\varphi_2'(t_0) = f_2(\varphi_1(t_0),\varphi_2(t_0)) = f_2(x_0, y_0)$.

<u>Conclusion</u>: The direction field in $(x_0, y_0)$ is tangent to the orbit that passes through $(x_0, y_0)$. 

>[!remark]
>The planar system $\begin{cases} \dot x = f_1(x,y) \\ \dot y = f_2(x,y) \end{cases}$ and the differential equation $\cfrac{dy}{dx}=\cfrac{f_2(x,y)}{f_1(x,y)}$ have the same direction field, since the slope of the vector $(f_1(x_0, y_0), f_2(x_0, y_0))$ is $\cfrac{f_2(x_0, y_0)}{f_1(x_0, y_0)}$

<u>Exercise</u> We consider the nonlinear planar system $\begin{cases} \dot x = -y - x(x^2+y^2) \\ \dot y = x - y(x^2+y^2) \end{cases}$
a) Justify that $(0,0)$ is a non-hyperbolic equilibrium point.
b) Using polar coordinates, represent the phase portrait. 
c) Reading the phase portrait, decide the stability of $(0,0)$

<u>Sol</u>:
a) Let $f_1(x,y) = -y - x(x^2+y^2)$ and $f_2(x,y) = x - y(x^2+y^2)$. Note that $f : \mathbb{R}^2 \rightarrow \mathbb{R}^2, f = \begin{pmatrix} f_1 \\ f_2 \end{pmatrix}$ is a $C^1$ function.
$$


