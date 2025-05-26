# Discrete Dynamical Systems
___
Class: [[DynamicalSystems]]
Type: 
Tags: # 
Date: May 12th, 2025 / May 19th, 2025
___

Instead of differential equations, we will consider difference equations:

| differential eq.                | difference eq.                 |
| ------------------------------- | ------------------------------ |
| $t \in \mathbb{R} \mapsto x(t)$ | $k \in \mathbb{N} \mapsto x_k$ |
| $e^{rt}$                        | $r^k$                          |
The fundamental theorems are essentially "the same".
## Linear difference equations
If we consider a LHDE with CC of order $n$: $$x_{k+n}+a_1\cdot x_{k+n-1}+\dots+a_nx_k=0, k \in \mathbb{N}\text{ }(1)$$
The unknown is now the sequence $(x_k)_{k\in\mathbb{N}}$
A number $r\in\mathbb{C}$ s.t. $x_k=r^k$ is a solution of $(1)$: $r^{k+}+a_1\cdot r^{k+n-1}+\dots+a_nr^k=0, \forall k \in \mathbb{N} \Rightarrow$ $$r^n+a_1r^{n-1}+\dots+a_n=0 \text{ (characteristic equation of (1))}$$

1. First order Linear Difference Equations with CC

$x_{k+1}+ax_k=b_k$, where $a\in\mathbb{R}^*$ is given and $(b_k)_{k\geq0}$ is given.

The general solution is $x=x^k+x^p$, where 
- $x_k$ is the general solution of $x_{k+1}+ax_k=b_k$ and 
- $x_p$ is a particular solution of the given LnHE

The general solution of $x_{k+1}+ax_k=b_k$ can be found by using the characteristic equation:
$r+a=0 \Rightarrow r = -a \mapsto (-a)^k$. 
Thus, the general solution is $x_k = c \cdot (-a)^k, c \in \mathbb{R}$

2. Second order LHDifferenceE with CC

$x_{k+2}+a_1x_{k+1}+a_2x_k=0$, where $a_1, a_2 \in \mathbb{R}$, $a_2 \neq 0$
The characteristic equation method:
- Step 1: $r^2+a_1r+a_2=0$ and find its roots $r_1, r_2 \in \mathbb{C}$
- Step 2: Associate two sequences, denoted $x_k^{(1)}, x_k^{(2)}$
	- if $r_1, r_2 \in \mathbb{R}, r_1 \neq r_2 \mapsto r_1^k, r_2^k$
	- if $r_1 = r_2 \in \mathbb{R} \mapsto r_1^k, kr_1^k$
	- if $r_1 = \overline{r_2} \in \mathbb{C} \setminus \mathbb{R} \mapsto Re(r_1^k), Im(r_1^k)$
- Step 3: The general solution is: $x_k = c_1x_k^{(1)}+c_2x_k^{(2)}, c_1, c_2 \in \mathbb{R}$

## Scalar difference equations

Given: $f: \mathbb{R}\rightarrow\mathbb{R}$ continuous
$$(2): x_{k+1}=f(x_k),k\in\mathbb{N}$$
Note that for each $\eta \in \mathbb{R}$, the IVP $\begin{cases}(2) \\ x_0=\eta \end{cases}$ has a unique solution $x_1=f(x_0)=f(\eta), x_2=f(x_1)=f(f(\eta)), x_2=f(f(f(\eta))) \dots$
Notation: $f^2 = f \circ f, f^k = f \circ \dots \circ f \text{ (k times)}$ 
So, $x_k=f^k(\eta), \forall k \in \mathbb{N}$
$\gamma_\eta=\{\eta, f(\eta), f^2(\eta),\dots\}$ is the (positive) orbit of the initial value $\eta$

>[!Example]
>Let $f : \mathbb{R} \rightarrow \mathbb{R}$, $f(x)= 1-2x^2$. find $f^k(\eta), k \in \mathbb{N}$ and $\eta \in \{-1, \cfrac{1}{2}, \cfrac{1+\sqrt{5}}{4}, \cfrac{1-\sqrt{5}}{4}\}$. In other words, find the solution of the IVP $\begin{cases}x_{k+1}=1-2x_k^2\\x_0=\eta\end{cases}$

<u>Solution</u>: 
$\eta = -1:  x_0 = \eta = -1, x_1 = f(\eta) = f(-1)=-1 \Rightarrow x_k = f^k(-1)=-1, \forall k \in \mathbb{N}$
$\eta = \cfrac{1+\sqrt{5}}{4}: x_0 = \eta = \cfrac{1+\sqrt{5}}{4}, x_1 = f(\cfrac{1+\sqrt{5}}{4}) = \cfrac{1-\sqrt{5}}{4}$
$\eta = \cfrac{1-\sqrt{5}}{4}: x_0 = \eta = \cfrac{11\sqrt{5}}{4}, x_1 = f(\cfrac{1-\sqrt{5}}{4}) = \cfrac{1+\sqrt{5}}{4}$
$f^k(\cfrac{1+\sqrt{5}}{4})=\begin{cases}\cfrac{1+\sqrt{5}}{4}, k \text{ even} \\ \cfrac{1-\sqrt{5}}{4}, k \text{ odd}\end{cases}$, $\Rightarrow$ $\gamma_{\cfrac{1+\sqrt{5}}{4}}=\{\cfrac{1+\sqrt{5}}{4},\cfrac{1-\sqrt{5}}{4}\}$ is a 2-cycle

>[!definition]
>$\eta^*\in \mathbb{R}$ s.t. $f(\eta^*)=\eta^*$ is a fixed point of f
>>[!remark]
>>if $\eta^*$ is a fixed point of f $\Rightarrow f^k(\eta^*)=\eta^*, \forall k \in \mathbb{N}$ and $\gamma_{\eta^*}=\{\eta^*\}$

>[!theorem]
>Let $\eta, \eta^* \in \mathbb{R}$ be s.t. $\lim_{k\rightarrow \infty}f^k(\eta)=\eta^*$. Then, $\eta^*$ is a *fixed point* of $f$.
>
><u> Proof </u>:
>$x_k=f^k(\eta)\Rightarrow x_{k+1}=f(x_k)$. But $\lim_{k\rightarrow \infty}x_k=\eta^*\Rightarrow\lim_{k\rightarrow \infty}=\eta^* \Rightarrow$ $\eta^*=\lim_{k\rightarrow \infty}f(x_k)=f(\eta^*)$, since $f$ is continuous

The cobweb diagram or Stein-step diagram
![[Discrete Dynamical Systems 2025-05-12 13.45.13.excalidraw]]

In order to graphically find the fixed points of the function, we need to find the intersection of the graph with the graph of $y = x$

$x_0 = \eta$
$x_1 = f(\eta)$

In summary:
start with $x_0 = \eta$. Then, move vertically until you find the graph of $f$. Then, horizontally until you find the graph of $y = x$. Then, again, vertically...

## [[Scalar (real) maps]]









![[Discrete Dynamical Systems 2025-05-19 13.37.57.excalidraw]]