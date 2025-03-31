# Linear differential equations of order n $\in \mathbb{N}$
___
Class: [[DynamicalSystems]]
Type: Lecture
Tags: #LHDE 
Date: March 10th, 2025
___
## Def 
$\mathcal{L}(x)(t) = x^{(n)}(t)+a_1x^{(n-1)}(t)+...+a_n(t)x(t), t\in I$ where $I \subset \mathbb{R}$ nonempty, open interval, $a_1, ....,a_n \in C(I)$. We consider the LHDE $(1)$ $\mathcal{L}(x)=0$.
We also consider the Ln-HDE $(2)$ $\mathcal{L}(x)=f$ with $f \in C(I)$ given.

## The fundamental theorems 
### for LHDEs
The set of solutions of equation $(1)$ is a *linear space of dimension **n*** 
Thus, $\exists$ $x_1,...,x_n$ [[Linear independence. Bases|linearly independent]] solutions of equation $(1)$ and the general solution is: $$c_1x_1+c_2x_2+...+c_nx_n$$, where $c_1,...c_n \in \mathbb{R}$.
In particular:
- for $n = 1$: $x'+a(t)x = 0$ if $x_1 \neq 0$, then $x=cx, c\in\mathbb{R}$
- for $n=2$: $x''+a_1(t)x'+a_2(t)=0$. If $x_1,x_2$ are linearly independent solutions,  then $x=c_1x_1+c_2x_2,c_1,c_2\in\mathbb{R}$
### for Ln-HDEs
The set of all solutions of equation $(2)$ is $Ker\mathcal{L}+\{x_p\}$. In other words, the general solution of $(2)$ is $$x=x_k+x_p$$ where $x_k$ denotes the general solution of $\mathcal{L}(x)=0$ and $x_p$ is a particular solution of $\mathcal{L}(x)=f$

In particular:
- for $n = 1$ $(3) x'+a(t)x=f(t)$
#### Proposition 
Let $A(t)=\int_{t_0}^ta(s)ds$, with $t_0\in I$ fixed 
a) We have that $e^{-A(t)}$ is a solution of $x'+a(t)x=0$, thus the general solution of this equation is $x=ce^{A(t)},c\in \mathbb{R}$.
b) Let $\varphi \in C^1(I)$ be a solution of $x'+a(t)x=0$. Then either $\varphi(t)=0, \forall t \in I$ is a solution or $\varphi(t) \neq 0, \forall t \in I$
c) The general soltuion of $(3)$ is $$x = ce^{-A(t)} + \int _{t_0}^t e^{A(t)-A(s)}f(s)ds,c\in\mathbb{R}$$
##### Proof
a) $x=e^{A(t)} \Rightarrow x'=e^{A(t)}\cdot A'(t) = e^{A(t)}\cdot a(t) \Rightarrow -e^{-A(t)}a(t)+a(t)e^{-A(t)}=0,\forall t \in I$ is True
b) The fundamental th. 
$\varphi$ is a solution $\Rightarrow \exists c \in \mathbb{R}$ s.t. $\varphi(t)=ce^{-A(t)}, \forall t \in I$
- case 1: $c=0 \Rightarrow \varphi(t)=0,\forall t \in I$
- case 2: $c \neq 0 \Rightarrow \varphi(t)\neq0,\forall t \in I$
c) In the seminar - Lagrange method. Now we present the integrating factor method to find the general solution of equation $(3)$
###### Integrating factor method
Idea: $e^{A(t)}$ is an integrating factor for $(3)$ (after multiplying the equation with this factor, it can be integrated) 
$x'+a(t)x=f(t)|\cdot e^{A(t)} \Rightarrow x'\cdot e^{A(t)}+a(t)x \cdot e^{A(t)}=f(t)\cdot e^{A(t)} \Rightarrow (x \cdot e^{A(t)})'=f(t)\cdot e^{A(t)} \Rightarrow$ $x \cdot e^{A(t)} = \int _{t_0}^tf(s)\cdot e^{A(t)}ds+c,c\in\mathbb{R}|\cdot e^{-A(t)} \Rightarrow$ $$x=c\cdot e^{-A(t)} + e^{-A(t)}\int _{t_0}^tf(s)\cdot e^{A(t)}ds$$ 