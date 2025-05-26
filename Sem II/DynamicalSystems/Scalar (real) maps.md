# Scalar (real) maps
___
Class: [[DynamicalSystems]]
Type: Lecture
Tags: # 
Date: May 26th, 2025
___

We consider $f : \mathbb{R} \rightarrow \mathbb{R}$ continuous (or $f : I \rightarrow I$ continuous, where $I \subseteq \mathbb{R}$ nonempty). 
- $(1) x_{k+1}=f(x_k)$, $x_0=\eta \in \mathbb{R}$ given.
- $f^2 = f \circ f$, $f^3 = f \circ f \circ f$ and so on
- $f^k$ is called the $k$'th iteration of $f$
- $f^0$ denotes the *identity*

The unique solution of $(1)$ is $x_k = f^k(\eta)$, $\forall k \geq 0$
## Orbits
>[!definition]
$\gamma_\eta = \{\eta, f(\eta), f^2(\eta), \dots\}$ is called a *positive* orbit (since it only contains *future* states)

What about past states?
We have: $x_{k+1}=f(x_k),\forall k \in \mathbb{Z}$. In order to find $x_{-1}$, we may use this recurrence. Meaning that if, in addition, $f$ is invertible and $f^{-1}$ is the *inverse* of $f$, then $x_{-1}=f^{-1}(x_0)=f^{-1}(\eta)$
Similarly, $x_{-2}=f^{-1}(f^{-1}(\eta)) = f^{-1}\circ f^{-1}(\eta)$
In this situation, if we make a notation $(f^{-1})^k=:f^{-k}$, then we can say that the solution of $x_{k+1}=f(x_k), x_0=\eta$ is $x_k={f^k(\eta)}, k \in \mathbb{Z}$.

## Definitions
>[!Definition]
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
Solve $f(x)=x$ in order to find the fixed points. We get:
 if $a\neq 1$, then $\eta^*=0$ is the unique fixed point 
- if $|a|<1$, then $\lim_{k\rightarrow \infty}a^k=0$, thus $\lim_{k\rightarrow \infty}f^k(\eta)=0, \forall \eta\in\mathbb{R}$, meaning that the fixed point $0$ is a global attractor for $f$
- if $|a| >1$, then $a^k$ is an unbounded sequence, thus $\forall \eta \in \mathbb{R}^*$, the sequence $f^k(\eta)$ is unbounded 

![[cobwebDiagram]]

## The linearization method
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

## The Newton - Raphson Method
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

## P-cycles
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


## Stability of a fixed point

>[!theorem] Theorem 1 (The linearization method for the fixed points of scalar maps)
>Let $f:\mathbb{R}\rightarrow\mathbb{R}$ be a $C^1$ map and $\eta^*\in\mathbb{R}$ be a fixed point of $f$.
>- if $|f'(\eta^*)|<1$, then $\eta^*$ is an *attractor* fixed point of $f$
>- if $|f'(\eta^*)|>1$, then $\eta^*$ is *not* an attractor of $f$, but, in case $f$ is invertible, we have that $\eta^*$ is an *attractor* fixed point of $f^{-1}$ (so like a repeller of $f$)

<u>Proof</u>: 
I. Assume that $|f'(\eta^*)|<1$. 
![[Scalar (real) maps 2025-05-26 12.22.50.excalidraw]]
Then, $\exists L \in (0,1)$ s.t. $|f'(\eta^*)|<L$. Denote $\epsilon = L - |f'(\eta^*)|<1$. 
$g : \mathbb{R} \rightarrow \mathbb{R}, g(\eta)=|f'(\eta^*)|, \forall \eta \in \mathbb{R}$. We have that $g$ is  continuous in $\eta^*$ $\Rightarrow$ for $\eta > 0, \exists \delta > 0$ s.t. if $|\eta - \eta^*|<\delta$, then $|g(\eta) - g(\eta^*)|<\epsilon$ (definition op continuity) $\Rightarrow \exists \delta > 0$ s.t. if $|\eta - \eta^*|<\delta$, then $-\epsilon < g(\eta)-g(\eta^*)<\epsilon$ $\Rightarrow$ $-L+|f'(\eta)| < g(\eta)-g(\eta^*)<L-|f'(\eta)|$
Conclusion: $|f'(\eta)|<L$, when $|\eta-\eta^*|<\delta$.

$\rightarrow$ We prove that $|f(\eta)-\eta^*|\leq L|\eta-\eta^*|$ when $|\eta-\eta^*|<\delta$ (1)
![[Scalar (real) maps 2025-05-26 12.31.02.excalidraw]]

We use the mean value theorem to get $\exists \xi_\eta$ between $\eta$ and $\eta^*$ s.t. $f(\eta)-f(\eta^*)=f'(\xi_\eta)(\eta-\eta^*)$ $\Rightarrow$ $\eta \in (\eta^*-\delta,\eta^*+\delta)$ $\Rightarrow$ $\xi_eta \in (\eta^*-\delta, \eta^*+\delta)$ $\Rightarrow$ $|f'(\xi_\eta)|<L$ $\Rightarrow$ $|f(\eta)-\eta^*|=|f'(\xi_eta)|\cdot |\eta-\eta^*|<L|\eta-\eta^*|^{f(\eta^*)-\eta^*}$

$\rightarrow$ We prove that $|f^k(\eta)-\eta^*|\leq L^k|\eta-\eta^*|$ when $|\eta-\eta^*|<\delta$
We do this by induction
1. $k=1$ - the previous step
2. assume for $k$ and prove for $k+1$
Let $\eta$ be s.t. $|\eta-\eta^*|<\delta$ $\Rightarrow$ $|f^{k+1}(\eta)-\eta|=|f(f^k(\eta))-\eta^*|$ 
$|f^k(\eta)-\eta^*|\leq L^k(\eta-\eta^*)<1\cdot\delta=\delta$, so we can use (1)
$\Rightarrow |f^{k+1}(\eta)-\eta| < L \cdot |f^k(\eta)-\eta^*|\leq L \cdot L^k|\eta-\eta^*|$
Conclusion: For $\eta$ s.t. $|\eta-\eta^*|<\delta$ we have that $\lim_{k\rightarrow \infty}|f^k(\eta)-\eta^*|=0$ since $\lim_{k\rightarrow \infty}L^k=0$ $\Rightarrow \lim_{k\rightarrow \infty}f^k(\eta)=\eta^*$
Thus, $\eta^*$ is an attractor fixed point of $f$ 

>[!tip]
>these functions are called *contractions*

II. 
$\exists f^{-1}$
$f(\eta^*)=\eta^* \Rightarrow \eta^*$ is a fixed point of $f^{-1}$
Since $f^{-1}(f(x))=x,\forall x \in \mathbb{R}$, we have $(f^{-1})'(f(x))\cdot f'(x)=1,\forall x \in \mathbb{R}$ $\Rightarrow$ $(f^{-1})'(\eta^*)=\cfrac{1}{f'(\eta^*)}$
If $|f'(\eta^*)|>1$, then $|(f^{-1})'(\eta^*)|<1$ and, using I, we have that $\eta^*$ is an attractor of $f^{-1}$. (which is, by definition, a repeller fixed point of $f$).


![[Scalar (real) maps 2025-05-26 13.28.57.excalidraw]]

 
