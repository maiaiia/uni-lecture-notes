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

## Scalar maps
We consider $f : \mathbb{R} \rightarrow \mathbb{R}$ continuous (or $f : I \rightarrow I$ continuous, where $I \subseteq \mathbb{R}$ nonempty). 
- $(1) x_{k+1}=f(x_k)$, $x_0=\eta \in \mathbb{R}$ given.
- $f^2 = f \circ f$, $f^3 = f \circ f \circ f$ and so on
- $f^k$ is called the $k$'th iteration of $f$
- $f^0$ denotes the *identity*

The unique solution of $(1)$ is $x_k = f^k(\eta)$, $\forall k \geq 0$
$\gamma_\eta = \{\eta, f(\eta), f^2(\eta), \dots\}$ is called a *positive* orbit (since it only contains future states)

$\eta^*\in\mathbb{R}$ is a fixed point of $f \iff f(\eta^*)=\eta^*$
Note that if $\eta^*$ is a fixed point of $f$, then $\eta^*$ is a fixed point of $f^k$, $\forall k \geq 2$

>[!property]
>If $\eta, \eta^*\in \mathbb{R}$ are s.t. $\lim_{t\rightarrow \infty}f^k(\eta)=\eta^*$, then $\eta^*$ is a fixed point of f 

We defined the notion of an attractor:
>[!definition]
>We say that $\eta^*$ is an *attractor* of the map $f$ when $\exists$ an open neighbourhood $V$ of $\eta^*$ s.t. $$\lim_{t\rightarrow \infty}f^k(\eta)=\eta^*,\forall \eta \in V$$
>

>[!Example]
A linear map $f(x)=ax$, $a \in \mathbb{R}$ fixed.
$x_{k+1}=ax_k$, $k>0$ and $x_0=\eta\in\mathbb{R}$

$\Rightarrow x_k = f^k(\eta)=a^k\eta, \forall k \geq 0$
Solve $f(x)=x$ in order to find the fixed points. We egt:
 if $a\neq 1$, then $\eta^*=0$ is the unique fixed point 
- if $|a|<1$, then $\lim_{k\rightarrow \infty}a^k=0$, thus $\lim_{k\rightarrow \infty}f^k(\eta)=0, \forall \eta\in\mathbb{R}$, meaning that the fixed point $0$ is a global attractor for $f$
- if $|a| >1$, then $a^k$ is an unbounded sequence, thus $\forall \eta \in \mathbb{R}^*$, the sequence $f^k(\eta)$ is unbounded 

![[cobwebDiagram]]

### The linearization method
Let $f : \mathbb{R} \rightarrow \mathbb{R}$ be a $C^1$ map and $\eta^*\in\mathbb{R}$ be a fixed point of $f$.
- If $|f'(\eta^*)|<1$, then $\eta^*$ is an attractor
- If $|f'(\eta^*)|>1$, then $\eta^*$ is a repeller

![[Discrete Dynamical Systems 2025-05-19 12.35.49.excalidraw]]

>[!Example]
>$f:(0,\infty)\rightarrow \mathbb{R}, f(x)=\cfrac{x^2+5}{2x}$
>1.  Note that $f(x)>0,\forall x\in(0,\infty)$. thus, $f:(0,\infty)\rightarrow(0,\infty)$
>2.  Check that $\eta^*=\sqrt{5}$ is the unique fixed point of $f$ and it is an attractor 
>3.  Represent the cob-web diagram and note that it seems like$\lim_{k\rightarrow \infty} f(\eta)= \sqrt{5},\forall \eta \in (0, \infty)$ 
>4. Prove that $\lim_{k\rightarrow \infty} f^k(\eta)=\sqrt{5}, \forall \eta \in (0,\infty)$

2. $f(x)=x\Leftrightarrow \cfrac{x^2+5}{2x}=x\Leftrightarrow x^2-5=0\Leftrightarrow x_{1,2}=\pm\sqrt{5}$. Since $x>0$, we have that the only fixed point $f$ ~ $\sqrt{5}$. $f'(x) = \cfrac{x^2-5}{2x^2}$. $f'(\sqrt{5})=0$ (it is said that $\sqrt{5}$ is a *super-attractor*)
3. ![[Discrete Dynamical Systems 2025-05-19 12.49.33.excalidraw]]
Let $\eta \in (\sqrt{5}, +\infty)$. Then $f^k(\eta)\in(\sqrt{5},+\infty), \forall k \geq 0$ (1).
We claim that $f(x)<x,\forall x\in(\sqrt{5},\infty)$ (2)
Indeed, $f(x)<x\Leftrightarrow \cfrac{x^2+5}{2x}<x\Leftrightarrow\cfrac{x^2+5-2x^2}{2x}\Leftrightarrow\cfrac{x^2-5}{2x}>0$, true $\forall x\in(\sqrt{5},\infty)$

(1), (2) $\Rightarrow$ $f(f^k(\eta))<f^k(\eta),\forall \eta > \sqrt{5}$. Thus, the sequence is strictly decreasing 
$\Rightarrow \sqrt{5}<f^k(\eta) < \eta, \forall k \geq 0$
Thus, $(f^k(\eta))$ is convergent $\Rightarrow$ its limit is a fixed point of $f$. But $\sqrt{5}$ is the only fixed point  of $f$ $\Rightarrow$ $\lim_{k\rightarrow \infty}f^k(\eta)=\sqrt{5}, \forall \eta \in (\sqrt{5}, \infty)$
Let $\eta \in (0,\sqrt{5}) \Rightarrow f(\eta)\in(\sqrt{5},\infty)\Rightarrow \lim_{k\rightarrow\infty}f^k(f(\eta))=\sqrt{5}$ $\Rightarrow \lim_{k\rightarrow\infty}f^{k+1}(\eta)=\sqrt{5}$
Let $\eta = \sqrt{5}$ fixed point, so $f^k(\sqrt{5})=\sqrt{5}, \forall k \geq 0$

### The Newton - Raphson Method
This is a method used for approximating the roots of a map $g$
>[!theorem]
>Let $V\subset \mathbb{R}$ be an open interval and $g: V \rightarrow \mathbb{R}$ be a $C^2$ map s.t. $g'(x)\neq 0, \forall x \in V$. For each $\eta \in V$ we consider a sequence defined by $$x_{k+1}=x_k-\cfrac{g(x_k)}{g'(x_k)}, x_0=\eta$$
>
>Let $\eta^*\in V$ be s.t. $g(\eta^*)=0$.
>Then, there exists a neighbourhood of $\eta^*$ $\tilde V$ s.t. $\forall \eta \in \tilde V$ we have $\lim_{t\rightarrow\infty}x_k=\eta^*$

<u>Proof</u>:
Consider $f(x)=x-\cfrac{g(x)}{g'(x)}$ $\Rightarrow x_k=f^k(\eta)$. Thus, the conclusion $\Leftrightarrow$ $\eta^*$ is an attractor for $f$
1. We prove that $f(\eta^*)=\eta^*$ - true, since $g(\eta^*)=0$ 
2. $f'(\eta^*)=?$
$f'(x)=1-\cfrac{g'(x)\cdot g'(x) - g(x)\cdot g''(x)}{(g'(x))^2}$
$f'(\eta^*)=1-1=0 \Rightarrow \eta^*$ is a super-attractor


>[!Example]
>$g(x)=x^2-5$

![[Discrete Dynamical Systems 2025-05-19 13.21.37.excalidraw]]
$x_{k+1}=x_k-\cfrac{g(x_k)}{g'(x_k)}$

### P-cycles
Let $f:\mathbb{R}\rightarrow\mathbb{R}$ be a continuous map.
>[!definition]
>Let $\eta^*\in\mathbb{R}$ and $p\in\mathbb{N}, p \geq 2$
>
>- We say that $\eta^*$ is a $p$-periodic point of $f$ (equivalently, $\gamma_{\eta^*}$ is a p-cycle) when $\eta^*$ is a fixed point of the iterate $f^p$, but it is not a fixed point of $f,f^2,\dots,f^{n-1}$
>- We say that a $p$-cycle $\gamma_{\eta^*}$ is an *attractor* when $\eta^*$ is an attracting fixed point of the iterate $f^p$
>

>[!remark] Remarks
> 1. Let $\eta^*$ be a $p$-periodic point. Then, the corresponding $p$-cycle is $$\gamma_{\eta^*}=\{\eta^*, f(\eta^*),\dots,f^{p-1}(\eta^*)\}$$
> (it contains $p$ different values)
> 
>2. If, in addition, $\gamma_{\eta^*}$ is an attractor $\forall \eta$ in the basin of attraction of the fixed point $\eta^*$ of $f^p$ we have $$\lim_{k\rightarrow\infty}(f^p)^k(\eta)=\eta^*$$

>[!Example]
>for $p = 3$
>$\gamma_{\eta}=\{\eta, f(\eta), f^2(\eta), f^3(\eta),\dots\}$
>$p = 3 \Rightarrow \lim_{k\rightarrow \infty}f^{3k}(\eta)=\eta^*$
>$\lim_{k\rightarrow \infty}f^{3k+1}(\eta)=f(\eta^*)$
>$\lim_{k\rightarrow \infty}f^{3k+2}(\eta)=f^2(\eta^*)$
>(i.e. we can decompose the orbit of $\eta$ into $p$ subsequences that converge to different values, thus getting a $2^p$ cycle)









![[Discrete Dynamical Systems 2025-05-19 13.37.57.excalidraw]]