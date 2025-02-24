# Introduction to Dynamical Systems
___
Class: [[DynamicalSystems]]
Type: Lecture
Tags: # 
Date: February 24th, 2025
Teacher: [[Buica Adriana]]
___
## Notions
**time** $x \in \mathbb{R}^n$ the state of the system, as a function of *time* 
**law**  of change for x $\rightarrow$ *mathematical equation*.

## Equation Types 
- **difference equations** - where the time is a *discrete* variable ($t \in \mathbb{Z}$) 
- **differential equations** - where the time is a *continuous* variable ($t \in \mathbb{R}$)
### Examples 
#### Difference equations
1. $x_{k+} = x_{k+1}+x_k, x_0 = 0, x_1 = 1$ - second order *difference* equation with the given initial values $x_0 = 0, x_1 = 1 \Rightarrow$ here, the time is *discrete*. The solution of this problem is the Fibonacci sequence. This is an example of a linear homogeneous difference equation 

>[!tip] the purpose of this course is expressing $x_k$ as a function depending on $k$ only 

2. $x_{k+1} = a\cdot x_k \cdot (1-x_k)$, $a \in \mathbb{R}$ - first order nonlinear difference equation. This is the sequence corresponding to the *logistic map* $f: \mathbb{R}\rightarrow \mathbb{R}, f(x) = ax(1-x)$  
3. $z_{k+1} = z_k - \cfrac{z_k^3-1}{3z_k}, z_0 \in \mathbb{C}^*$ - *Newton's fractal* 

#### Differential equations 
$t \in \mathbb{R}$ - variable; $x(t)$ - function;  $x'(t)$  - rate of change; $x''(t)$ - acceleration 

- $x'(t) = -ax(t)$; $x(0) = N_0$

$\Rightarrow x(t) = N_0 e^{-at}$
$T$ - present moment (unknown. we wish to find $T$)
$N_1$ - concentration at time $T$
$N_0 e^{-aT}=N_1 \Rightarrow -aT = ln \cfrac{N_1}{N_0} \Rightarrow T = \cfrac{1}{a} ln \cfrac{N_0}{N_1}$
$x' = -ax$ - first order linear homogeneous differential equation with constant coefficients (technically, $x'(t) = -ax(t)$)

- Find all functions that verify the equation $x' = x$
$x' = x \Leftrightarrow x'-x = 0 / \cdot e^{-t} \Leftrightarrow x'e^{-t}+ x e^{-t} = 0 \Leftrightarrow (xe^{-t})' = 0 \Leftrightarrow x = ce^{-t}$     

- Now, for $ex'=-ax$ 
$\Rightarrow x' + ax = 0 \Rightarrow x' \cdot e^{at}+ax \cdot e^{at}=0 \Rightarrow (x \cdot e^{at})' = 0$  

**Algorithm**
$x'+ax = 0$
$r + a = 0, r = -a \rightarrow e^{-at}$
$x = c e^{-at}, c \in \mathbb{R}$

##### The simple harmonic oscillator
![[harmonic_oscillator.excalidraw]] 
$F = ma = -kx \Rightarrow mx'' = -kx \Leftrightarrow x'' + \cfrac{k}{m}x = 0$
##### The simple planar pendulum
![[pendulum.excalidraw]]
$F = ma = -mg \sin \varphi \Leftrightarrow \varphi '' + \cfrac{g}{L} \sin \varphi = 0$ - second order *nonlinear* differentiable equation
We approximate this nonlinear equation with the linear one $\varphi '' + \cfrac{g}{L} \varphi = 0$, since $\sin \varphi \approx \varphi$ for $\varphi$ small 