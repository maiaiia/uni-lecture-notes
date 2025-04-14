# Planar Dynamical Systems
___
Class: [[DynamicalSystems]]
Type: Lecture
Tags: # 
Date: April 14th, 2025
___

(1) $\dot x=f(x)$, where $f : \mathbb{R}^2 \rightarrow \mathbb{R}^2$ is a $C^1$ function 
>[!definition]
>A solution of $(1)$ is a $C^1$ function $\varphi : I \rightarrow \mathbb{R}^2$, where $I \subset \mathbb{R}$ is an open interval, and $\varphi(t)=f(\varphi(t)), \forall t \in I$

Examples
1. Let $\varphi(t)=(\cos t, \sin t), \forall t \in \mathbb{R}$. Represent the image of $\varphi : \mathbb{R} \rightarrow \mathbb{R}^2$.
The image has the parametric equation: $\begin{cases}x=\cos t \\ y = \sin t\end{cases} \Leftrightarrow \text{ complex notation } z = \cos t + i \sin t, t \in \mathbb{R}$. We eliminate the parameter $t$
$x^2+y^2=1 \Leftrightarrow |z|=1 \Leftrightarrow \rho = 1$
![[UnitCircle]]

2. $\varphi(t)=(e^{-t}\cos t,e^{-t}\sin t, \forall t \in \mathbb{R}$. Represent the image of $\varphi : \mathbb{R} \rightarrow \mathbb{R}^2$.
$\begin{cases}x=e^{-t}\cos t \\ y = e^{-t}\sin t\end{cases} \Leftrightarrow \text{ complex notation } z = e^{-t}(\cos t + i \sin t), t \in \mathbb{R}$ $\Leftrightarrow \rho=e^{-t},\theta=t,t\in\mathbb{R}$. 
Eliminate $t$: $\rho = e^{-\theta}$. This is a *logarithmic spiral*
![[LogarithmicSpiral]]

3. Represent the [[level set |level curves]] of $H : \mathbb{R}^2\rightarrow \mathbb{R}, H(x,y)=x^2+y^2$. 
Let $c \in \mathbb{R}$. Then, the level curve of $H$ has the eq. $x^2+y^2=c$.
- If $c < 0$, the level curve is $\emptyset$
- if $c=0$, the level curve is $\{(0,0)\}$
- if $c > 0$, the level curve is $\mathcal{C}(0,\sqrt{c})$


>[!recall]
>For each $\eta \in \mathbb{R}^2$ denote by $\varphi(t,\eta)$ the unique solution of the IVP $\begin{cases}\dot x=f(x) \\ x(0)=\eta\end{cases}$

>[!definition]
>Let $\Omega \subset \mathbb{R}^2$ open, non-empty and $H : \Omega \rightarrow \mathbb{R}$ be a continuous function. We say that $H$ is a *first integral* in $\Omega$ of (1) if $H$ is not locally constant and $H(\varphi(t,\eta))=H(\eta),\forall \eta \in \Omega, \forall t$ s.t. $\varphi(t,\eta)\in \Omega$.
>If, in addition, $\Omega = \mathbb{R}^2$ and $H$ is a first integral in $\mathbb{R}^2$, then we say that $H$ is a *global* first integral

>[!remark]
> The orbits lie on the level curves of a first integral

**Example**:  Consider the planar system $\begin{cases}\dot x=-y \\ \dot y=x\end{cases}$. Find the flow and check that $H(x^2,y^2)$ is a global first integral. Represent the phase portrait
1. flow 
Let $\eta = \begin{pmatrix} \eta_1 \\ \eta_2 \end{pmatrix}$ and consider the IVP $\begin{cases} \dot x=-y \\ \dot y=x \\ x(0)=\eta_1 \\ y(0)=\eta_2 \end{cases}$ $\Rightarrow \begin{cases}\ddot x=-\dot y=-x \\ y =  -\dot x\end{cases}$ $\Rightarrow \ddot x+x=0; r^2+1=0\Rightarrow r_{1,2}=\pm i \mapsto \cos t, \sin t$ $\Rightarrow \begin{cases}x=c_1\cos t + c_2 \sin t \\ y = c_1\sin t + c_2\cos t\end{cases}$ $\Rightarrow c_1=\eta_1, c_2=\eta_2$ $\Rightarrow \varphi(t,\eta_1,\eta_2)=(\eta_1 \cos t - \eta_2 \sin t, \eta_1 \sin t + \eta_2 \cos t), \forall t \in \mathbb{R}. \forall \begin{pmatrix} \eta_1 \\ \eta_2 \end{pmatrix}\in \mathbb{R}^2$
2. global first integral
Using the definition, we check that $H : \mathbb{R}^2\rightarrow \mathbb{R}$ is a first integral. Let $\eta \in \mathbb{R}^2$ and $t \in \mathbb{R}$. $H(\varphi(t,\eta))=(\eta_1 \cos t - \eta_2 \sin t)^2+ (\eta_1 \sin t + \eta_2 \cos t)^2 = \eta_1^2+\eta_2^2=H(\eta)$. $H$ is not locally constant, $H$ is continuous on $\mathbb{R}^2$ $\Rightarrow H$ is a global first integral
3. phase portrait
We need to first find the equilibria: we solve $\begin{cases}-y=0\\x=0\end{cases}$ in $\mathbb{R}^2$ $\Rightarrow \eta^*=(0,0)$ is the only equilibrium point

$\dot x = -y < 0$ $\varphi(t,1,0)=(\cos t, \sin t)$
![[phasic_portrait]]
**Example**: $\begin{cases}\dot x = -x \\ \dot y = -2y\end{cases}$. Find the flow. Check that the origin is a global attractor. Find a first integral in $\mathbb{R} \times (0,\infty)$. Represent the phase portrait.
Solution:
Let $\eta = \begin{pmatrix}\eta_1 \\ \eta_2 \end{pmatrix} \in \mathbb{R}^2$ and consider the IVP $\begin{cases}\dot x = -x \\ \dot y = -2y \\ x(0)=\eta_1 \\ y(0)=\eta_2\end{cases}$ $\Rightarrow \varphi(t,\eta_1,\eta_2)=(\eta_1e^{-t},\eta_2^{-2t}),\forall t\in\mathbb{R}$
$\lim_{t\rightarrow \infty} \varphi(t,\eta_1,\eta_2)=(0,0), \forall (\eta_1,\eta_2)\in\mathbb{R}^2 \Rightarrow (0,0)$ is a def global attractor.
$\begin{cases}x=\eta_1e^{-t} \\ y=\eta_2e^{-2t}\end{cases}$ 
We choose $H(x,y)=\cfrac{x^2}{y}, (x,y)\in\mathbb{R}\times(0,\infty)$
$H: \mathbb{R} \times (0,\infty) \rightarrow \mathbb{R}$ continuous
$H(\varphi(t,\eta_1,\eta_2)=H(\eta_1,\eta_2),\forall t \in \mathbb{R}$ $\Rightarrow H$ is a first integral in $\mathbb{R}\times (0,\infty)$

Note that $O(0,0)$ is the only equilibrium point.
The level curves of $H$: $\cfrac{x^2}{$
![[pp2]]




 