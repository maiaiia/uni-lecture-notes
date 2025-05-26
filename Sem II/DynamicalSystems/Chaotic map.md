# Chaotic map
___
Class: [[DynamicalSystems]]
Type: 
Tags: # 
Date: May 26th, 2025
___

>[!example]
>$f(x)=4x(1-x)$

$f^{40}(0.67)=?$
$\rightarrow$ For $\eta \in [0,1]$ there exists $\theta \in \mathbb{R}$ s.t. $\eta = \sin^2(\theta)$
$\rightarrow$ For $\eta = \sin^2\theta$ We have $f^k(\eta)=\sin^2(2^k\theta),\forall k \geq 1$

We use induction
I.
$k = 0$ - $\eta = \sin^2\theta$
$k = 1$ - $f(\eta)=4\eta(1-\eta)=4\sin^2\theta(1-\sin^2\theta)=(2\sin\theta\cos\theta)^2=\sin^2(2\theta)$

II.
$f^{k+1}(\eta)=4\sin^2(2^k\theta)\cdot(1-\sin^2(2^k\theta)) = (\sin(2\cdot2^k(\theta))^2=sin^2(2^{k+1}\theta)$

So, $f^{40}(0.67)=\sin^2(2^{40}\arcsin\sqrt{0.67})$

$\rightarrow$ Let's prove that $f$ has a 3-cycle
$\theta=?$ $\eta=\sin^2\theta$ $f(\eta)=\sin^2(2\theta)\neq\eta$ $f^2(\eta)=sin^2(8\theta)=\eta=sin^2\theta$

We look for $\theta$ s.t. $\theta = 8\theta + 2k\pi$, $k\in\mathbb{Z}$ and $\theta \neq 2\theta+2k\pi$, $\theta \neq 4\theta+2k\pi$

2 potential solutions are $\eta = \cfrac{2\pi}{7}$ and $\eta = \cfrac{\pi}{7}$

$\rightarrow$ Prove that $f$ has a $p$-cycle. $\forall p \in \mathbb{N}^*$
(the following theorem can also be used: if a function has a 3-cycle,  it has a p-cycle, for all p)

$p=1$: $f(x)=x \Leftrightarrow 4x-4x^2=x \Leftrightarrow 4x^2-3x=0\Leftrightarrow x \in \{0.\cfrac{3}{4}\}$
$p \geq 2$: $\eta = \sin^2\theta \Rightarrow f^p(\eta)=\sin^2(2^p\theta)=\sin^2(\theta)$ $\Rightarrow 2^p\theta=\theta+2\pi$ $\Rightarrow \theta = \cfrac{2\pi}{2^p-1}$

$\rightarrow$ $\forall \eta \in [0,1]$ and $\forall \epsilon > 0$ $\exists \tilde \eta \in [0,1]$ and $K \in \mathbb{N}^*$ s.t. $|\eta - \tilde\eta|< \epsilon$ and $|f^k(\eta)-f^k(\tilde \eta)| \geq \cfrac{1}{2}$

>[!lemma]
>$$|\sin^2\theta_1-\sin^2\theta_2|\leq|\theta_1-\theta_2|,\forall \theta_1,\theta_2 \in \mathbb{R}$$
>
><u>Proof</u>
We apply the mean value theorem: $\exists \xi$ between $\theta_1$ and $\theta_2$ s.t. $\sin^2\theta_1-\sin^2\theta_2=2\xi(\theta_1-\theta_2)\Rightarrow$ $|\sin^2\theta_1-\sin^2\theta_2|\leq|\theta_1-\theta_2|$

$k=?$
![[Chaotic map 2025-05-26 13.28.51.excalidraw]]


Fix $\eta \in [0,1]$
$\tilde\eta=\sin^2\tilde\theta$
$|f^k(\eta)-f^k(\tilde\eta)|=|\sin^2(2^k\theta)-\sin^2(2^k\tilde\theta)|\geq\cfrac{1}{2}$
$\exists\zeta \in [0,\pi]$ s.t. $|\sin^2(2^k\theta)-\sin(2^k\theta+\zeta)|\geq\cfrac{1}{2}$
$2^k\tilde\theta=2^k\theta+\zeta$ $\Leftrightarrow \tilde \theta = \theta+\cfrac{\zeta}{2^k}$

$|\eta-\tilde\eta|=|\sin^2\theta-\sin^2\tilde\theta|\leq|\theta-\tilde\theta|=\cfrac{\zeta}{2^k}\leq\cfrac{\pi}{2^k}<\eta$
We choose $k$ sufficiently large s.t. $\cfrac{\pi}{2^k}<\epsilon$

$\rightarrow$ it has a dense orbit in $[0,1]$ i.e. $\exists \eta \in [0,1]$ s.t. the closure of $\{f^k(\eta):k\in\mathbb{N}\}$ is $[2,1]$. In other words, $\forall x \in [0,1]$, the sequence $f^k(\eta)$ has a subsequence convergent to $x$.

(the butterfly effect)

>[!definition]
>A function having all these properties is called *chaotic*


>[!exercise]
>Prove that $f(x)=3x(1-x)$ has no $2$-cycles. Find the fixed points of $f$

$f(x)=x \Leftrightarrow 3x^2-2x=0 \Leftrightarrow x\in \{0,\cfrac{2}{3}\}$
Suppose $f$ has a $2$-cycle
$\{\eta^*,f(\eta^*)\}$ is a $2$-cycle $\iff$ $f^2(\eta^*)=\eta^*$ and $f(\eta^*)\neq(\eta^*)$.
So, $\eta^*$ is a fixed point of $(f^2)^k$
$f^2(x)=3f(x)-3(f(x))^2=3(3x-3x^2)-3(3x-3x^2)^2=9x-9x^2-27(x^2-2x^3+x^4)$ $=-27x^4+54x^3-x^2+9x$











