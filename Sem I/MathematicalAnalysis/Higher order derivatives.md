# Higher order derivatives
___
Class: [[ MathematicalAnalysis]]
Type: 
Tags: # 
Date: January 3rd 2025
Teacher: [[]]
___

## Definitions 
- The second order partial derivative with respect to $x_i$: $\cfrac{\partial}{\partial x_i }\Big{(} \cfrac{\partial f}{\partial x_i} \Big{)} := \cfrac{\partial ^ 2 f}{\partial x_i^2} = \partial ^2_if$
- The mixed second order partial derivative: $\cfrac{\partial}{\partial x_i }\Big{(} \cfrac{\partial f}{\partial x_j} \Big{)} := \cfrac{\partial ^ 2 f}{\partial x_i \partial x_j} = \partial ^2_{i,j}f$ 
- The Hessian matrix: $$H(x)=D^2f(x)=D(\nabla f)(x)=\begin{bmatrix} \nabla \big{(}\frac{\partial f}{\partial x_1} \big{)} \\ \nabla \big{(}\frac{\partial f}{\partial x_2} \big{)} \\ \vdots \\ \nabla \big{(}\frac{\partial f}{\partial x_n} \big{)} \end{bmatrix}$$
- $C^2$ : Class of functions $f : \mathbb{R}^n \rightarrow R$ that are twice differentiable, with continuous 2nd order partial derivatives
### Linear Algebra Stuff for Theorems
- An $n \times n$ matrix $A$ is called 
	- *positive-definite* if $x^T A x > 0, \forall x \in \mathbb{R}^n$
	- *negative-definite* if $x^T A x < 0, \forall x \in \mathbb{R}^n$
	- *indefinite* otherwise
- A matrix is 
	- positive-definite $\iff$ all its eigenvalues > 0
	- negative-definite $\iff$ all its eigenvalues < 0
	- indefinite otherwise
- **Sylvester's Theorem**:
	- instead of the eigenvalues, we can compute all the values of $\Delta_k$, where $\Delta _ k$ is the determinant of the matrix composed of the first $k$ rows and columns
		- If $\Delta_k > 0, \forall k$ then the matrix is positive-definite
		- If $\Delta_k > 0, \forall k$, then the matrix is negative-definite
		- note that if there are both positive and negative values for $\Delta_k$, this test is inconclusive

## Theorems
- **Schwarz**: If $f : A \subseteq \mathbb{R}^n \rightarrow \mathbb{R}$ has continuous second order partial derivatives, then $\cfrac{\partial^2 f}{\partial x_i \partial x_j} = \cfrac{\partial^2 f}{\partial x_j \partial x_i}$
- If the second order derivatives are continuous, the Hessian matrix is symmetric
- **Taylor**: for $f \in C^2$: $$f(x) = f(x_0) + \nabla f(x_0)\cdot (x-x_0) + \frac{1}{2}(x-x_0)^TH(x_0)(x-x_0)+R(x-x_0)$$, where $\cfrac{R(x-x_0)}{\|x-x_0\|^2}\rightarrow 0$ as $x \rightarrow x_0$. Taylor's expansion can also be written as: $$f(x_0+h)=f(x_0)+\nabla f(x_0)\cdot h+\frac{1}{2}h^TH(x_0)\cdot h+R(h)$$
- Let $H$ be an $n \times n$ matrix s.t. $x^T H x > 0, \forall x \in \mathbb{R}^n$$\Rightarrow \exists M > 0: x^T H x \geq M \|x\|^2, \forall x \in \mathbb{R}^n$ 
- Let $f : A \subseteq \mathbb{R}^n \rightarrow \mathbb{R}, f \in C^2$ and $x_0 \in A : \nabla f(x_0) = 0$. Then:
	- If $h^T H(x_0) h > 0, \forall h \in \mathbb{R}^n$, then $x_0$ is a *local maximum*
	-  If $h^T H(x_0) h < 0, \forall h \in \mathbb{R}^n$, then $x_0$ is a *local minimum*
- *Local extremum conditions*: Let $f \in C^2$ and $x$ a critical point of $f$
	- if $H(x)$ is positive definite, $x$ is a local minimum
	- if $H(x)$ is negative definite, $x$ is a local maximum
	- if $H(x)$ is indefinite, $x$ is called a *saddle point*