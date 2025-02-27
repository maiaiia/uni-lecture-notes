# Partial derivatives and Differentiability in Rn
___
Class: [[ MathematicalAnalysis]]
Type: 
Tags: # 
Date: January 2nd 2025
___
## Definitions
### Partial derivatives 
A **partial derivative** varies the function along a single variable only, while keeping the other variables fixed 
$$\cfrac{\partial f}{\partial x_i}(x)=\partial_i f := \lim_{h\rightarrow0}\cfrac{f(x+he_i)-f(x)}{h}$$
The **gradient** of a function at x is given by the vector $$\nabla f(x) := \Big{(}\cfrac{\partial f}{\partial x_1}(x),...,\cfrac{\partial f}{\partial x_n}(x)\Big{)}$$
### Differentiability in $\mathbb{R}^n$
We say that $f:A\subseteq\mathbb{R}^n\rightarrow\mathbb{R}$ is differentiable at $x_0$ if $\exists Df(x_0)\in \mathbb{R}^n$, called the **differential / derivative** of $f$ at $x_0$ s.t. $$\lim_{x \rightarrow x_0}\cfrac{f(x)-f(x_0)-Df(x_0)\cdot(x-x_0)}{\|x-x_0\|} = 0$$ or, equivalently, $$\lim_{h \rightarrow 0}\cfrac{f(x_0+h)-f(x_0)-Df(x_0)\cdot h}{\|h\|} = 0$$
An easy way to remember this is by remembering that differentiability is equivalent to $$f(x) = f(x_0)+Df(x_0)\cdot(x-x_0)+R(x-x_0)\text{, with }\cfrac{R(x-x_0)}{\|x-x_0\|}\rightarrow 0$$
For a function $f : A \subseteq\mathbb{R}^n \rightarrow \mathbb{R}^m$, we have that $f$ is differentiable at $x_0$ if $\exists Df(x_0) \in \mathbb{R}^{m\times n}$ s.t. $$\lim_{x \rightarrow x_0}\cfrac{\|f(x)-f(x_0)-Df(x_0)(x-x_0)\|}{\|x-x_0\|} = 0$$
## Theorems 
- Let $A \subseteq \mathbb{R}^n$ be an open set and $f : A \rightarrow \mathbb{R}^m$. Then, if $f$ is differentiable at $x_0$, then it is continuous at $x_0$.
- If $f:A\rightarrow \mathbb{R}$ is differentiable at $x$, then its partial derivatives exist at $x$ and $Df(x)=\triangledown f(x)$ 
- Let $f:A \subseteq \mathbb{R}^n \rightarrow \mathbb{R}^m, f = (f_1, f_2,...,f_m)$ be differentiable at $x$. Then, $$Df(x)=J=\begin{bmatrix}\nabla f_1(x)\\ \vdots \\ \nabla f_m(x) \end{bmatrix} = \begin{bmatrix} \frac{\partial f_1}{\partial x_1}(x) \dots \frac{\partial f_1}{\partial x_n}(x) \\ \vdots \\ \frac{\partial f_1}{\partial x_1}(x) \dots \frac{\partial f_m}{\partial x_n}(x) \end{bmatrix}$$ This is called the *Jacobian matrix*
- **Chain Rule**: Let $g : \mathbb{R}^n \rightarrow \mathbb{R}^m$ and $f : \mathbb{R}^m \rightarrow \mathbb{R}^p$ be differentiable at $x$ and $g(x)$, respectively. Then $$D(f \circ g)(x) = Df(g(x))Dg(x)$$