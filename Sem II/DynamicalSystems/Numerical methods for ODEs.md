# Numerical methods for ODEs
___
Class: [[DynamicalSystems]]
Type: 
Tags: # 
Date: May 12th, 2025
___
## Euler's numerical formula
Consider the scalar ODE (ordinary differential equation) $y'=f(x,y)$ and the IC (initial condition) $y(x_0)=y_0$. Here, $f : \mathbb{R}^2 \rightarrow \mathbb{R}$ is a $C^1$ function and $(x_0, y_0)\in \mathbb{R}^2$ is fixed.
Theoretically, it is known that this IVP has a unique solution, but, in general, it is not possible to find its expression. 

![[Numerical methods for ODEs 2025-05-12 12.09.46.excalidraw]]
<u>Notations</u>: 
- $\varphi : [x_0, x^*] \rightarrow \mathbb{R}$ denotes the *unique solution* of the IVP
- $x_0 < x_1 < x_2 < \dots < x_n = x^*$ is a *partition* of $[x_0, x^*]$
- $n$ is the *number of steps*
- $x_{k+1}-x_k$ is the *step size* of step $k$

The aim of a **numerical formula** is to find approximate values for $\varphi(x_k)$, denoted by $y_k$/

We get:
$x_0 \mapsto y_0 = \varphi(x_0)$
$x_2 \mapsto y_2 = \varphi(x_2)$
$\dots$
$x_k \mapsto y_k = \varphi(x_k)$
$\dots$

>[!theorem] Euler's numerical formula
>Find $y_1$, using that $(x_1, y_1)$ and $(x_0, y_0)$ are on a line of slope $f(x_0, y_0)$
>$\Rightarrow \begin{cases}\tan \alpha = f(x_0, y_0) \\ \tan \alpha = \cfrac{y_1 - y_0}{x_1-x_0}\end{cases} \Rightarrow \cfrac{y_1-y_0}{x_1-x_0}=f(x_0,y_0)\Rightarrow y_1=y_0 + (x_1-x_0)\cdot f(x_0,y_0)$$\Rightarrow$
>$$y_{k+1} = y_k+(x_{k+1}-x_k)\cdot f(x_k, y_k))$$
>- Particular case: step size is constant, i.e. $\exists h > 0 : x_{k+1}-x_k=h, \forall h$
>If we know $f, x_0, y_0, x^*, n\Rightarrow h=\cfrac{x^*-x_0}{n}\Leftrightarrow x^*=x_0+nh\Leftrightarrow n = \cfrac{x^*-x_0}{h}$, then $$\begin{cases}x_{k+1}=x_k+h \\ y_{k+1}=y_k+h\cdot f(x_k, y_k)\end{cases}$$
>

>[!example] Exercise 
>Consider the IVP $\begin{cases}y'=1+xy^2 \\ y(0)=0\end{cases}$. Write the Euler's numerical formula with constant step size $h > 0$. Flor $h =0.1$, find the number of steps to reach $x^*=2$, then find approximate values of $\varphi(0.1)$ and $\varphi(0.2)$, where $\varphi$ is the exact solution

<u>Solution</u>:
Euler's numerical formula:
$x_{k+1}=x_k+h, y_{k+1}=y_k+h\cdot f(x_k,y_k)=y_k+h\cdot (1+x_ky_k^2))$
$x_0 = 0, y_0 = 0$

Number of steps:
$h = 0.1, x^*=2, n = ?$ 
$n = \cfrac{2-0}{0.1}=20$

Approximation:
$h=0.1 \Rightarrow x_{k+1}=x_k+0.1, x_0 = 0 \Rightarrow x_1=0.1, x_k=0.1+0.1=0.2$ $\Rightarrow y \approx \varphi(0.1)$ and $y_2 \approx \varphi(0.2)$
$y_{k+1}=y_k+0.1\cdot (1+x_ky_k^2), k \geq 0$
$k = 0 \Rightarrow y_1=y_0+0.1\cdot(1+x_0y_0)=0.1$
$k = 1 \Rightarrow y_2=y_1+0.1\cdot(1+x_1y_1)=0.2001$

>[!example] Exercise
>Consider the IVP $y' = y, y_0 = 1$
>- Write the Euler's numerical formula with $n$ steps on the fixed interval $[0, x^*]$. 
>- Denote by $u_n$ the approximation obtained for $\varphi(x^*)$. Note that $\varphi(x)=e^x, \forall x \in \mathbb{R}$. Prove that $\lim_{n\rightarrow \infty}u_n=e^{x^*}$

$h = \cfrac{x^*}{n}$, $x_0 = 0, y_0 = 1$ for a fixed $n$
$x_{k+1}=x_k+h, y_{k+1}=y_k+hy_k, k \geq 0$
Notation $x_k \rightarrow x_{n,k}, y_k \rightarrow y_{n,k}$ %%notations used to highlight the fact that x and y depend on n as well%% So, $u_n = y_{m,n}$
$y_{n, k+1}=(1+h)y_{n,k}, y_{n,0}=1 \Rightarrow$ $y_k = (1+h)k=(1+\cfrac{x^*}{n})^k$ (geometric progression) $\Rightarrow u_n = (1+\cfrac{x^*}{n})^n \rightarrow_{n \rightarrow \infty} e^{x^*}$

>[!tip]
>Due to the formula, the error of step $k$ is $|\varphi(x_k)-y_k|$.
>Other errors are due to *truncations*

It's important to estimate and minimise the errors. The error might be smaller when the interval $[x_0, x^*]$ is small $\rightarrow$ the step size h is small


