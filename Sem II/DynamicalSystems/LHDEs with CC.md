# LHDEs with constant coefficients
___
Class: [[DynamicalSystems]]
Type: Lecture
Tags: #LHDE 
Date: March 10th, 2025
___

$(4)$: $x^{(n)}+a_1x^{n-1}+...+a_nx=0$, where $a_1,...,a_n\in \mathbb{R}$.
>[!idea] Look for solutions of the form $x=e^{rt}$

plug $e^{rt}$ in $4$: $x'=re^{rt}, x'' =r^2e^{rt}$,...,$x^{(k)}=r^ke^{rt}$, so 
$(4) \Rightarrow r^n + a_1r^{n-1}+...+a_{n-1}r+a_n=0 (5)$ - **characteristic equation of $(4)$**
- case 1: $(5)$ has $n$ distinct real roots $r_1,...,r_n \in \mathbb{R}$
then, **the values $e^{r_1t},...,e^{r_nt}$ are solutions of $(4)$**. If they are [[Linear independence. Bases|linearly independent]], we can write the general solution
Proof - linear independence
Let $k_1,...,k_n$ s.t. $k_1e^{r_1t},...,k_ne^{r_nt}=0, \forall t \in \mathbb{R}$. $\Rightarrow$
$\begin{cases}r_1k_1e^{r_1t}+...+r_nk_ne^{r_nt}=0, \forall t\in \mathbb{R} \\r_1^2k_1e^{r_1t}+...+r_n^2k_ne^{r_nt}=0, \forall t\in \mathbb{R} \\... \\ r_1^nk_1e^{r_1t}+...+r_n^nk_ne^{r_nt}=0, \forall t\in \mathbb{R}\end{cases}$

Now let $t=0 \Rightarrow$
$\begin{cases}r_1k_1+...+r_nk_n=0, \forall t\in \mathbb{R} \\r_1^2k_1+...+r_n^2k_n=0, \forall t\in \mathbb{R} \\... \\ r_1^nk_1+...+r_n^nk_n=0, \forall t\in \mathbb{R}\end{cases}$ 

This is a linear algebraic system of $n$ equations with $n$ unknowns $k_1,...,k_n$. For this system, $k_1,...,k_n=0$ is a solution. 
$\Delta = \begin{vmatrix*} 1 & 1 & ... & 1 \\ r_1 & r_2 & ... & r_n \\ \vdots \\ r_1^{n-1} & r_2^{n-1} & ...& r_n^{n-1} \end{vmatrix*} = (r_n-r_1)(r_n-r_2)...(r_2-r_1) \neq 0$ (all values are distinct) 

>[!recap]
We say that $r_1 \in \mathbb{C}$ is a root of multiplicity $n \in \mathbb{N}^*$ when $\exists Q$ polynomial s.t. $P(r)=(r-r_1)^mQ(r)$ and $Q(r_1) \neq 0$. In particular, when $m=1$, we say that $r_1$ is a simple root of the polynomial $P$, when $m=2$ we say that $r_1$ is a double root of $P$ and so on.

## The characteristic equation of $(4)$
- **Step 1**: Write the characteristic equation $(5) : P(r) = 0$
- **Step 2**: Find the *roots* of the characteristic equation: $r_1,r_2,...,r_n \in \mathbb{C}$ ($n$ roots, when counting them with their respective multiplicities)
- **Step 3**: Associate $n$ functions according to the following rules:
	1. If $r \in \mathbb{R}$ is a simple root, $\mapsto e^{rt}$
	2. If $r \in \mathbb{R}$ is a root of multiplicity $m$ $\mapsto$ $e^{rt}, te^{rt},...,t^{m-1}e^{rt}$ - $m$ functions
	3. If $r_{1,2} = \alpha \pm i\beta (\alpha, \beta \in \mathbb{R}, \beta > 0)$ are simple roots $\mapsto$ $\{e^{\alpha t} cos(\beta t)\}, \{e^{\alpha t} sin(\beta t)\}$  
	4. If $r_{1,2} = \alpha \pm i\beta (\alpha, \beta \in \mathbb{R}, \beta > 0)$ are roots of multiplicity $m$ $\mapsto$ $\{e^{\alpha t} cos(\beta t), e^{\alpha t} sin(\beta t)\},$$\{te^{\alpha t} cos(\beta t), te^{\alpha t} sin(\beta t)\}$, ...,  $\{t^{m-1}e^{\alpha t} cos(\beta t)\}, \{t^{m-1}e^{\alpha t} sin(\beta t)\}$  - $2m$ functions ($m$ for each root)
- **Step 4** Write the general solution of $(4)$ $x=c_1x_1+...+c_nx_n$, where $x_1,...,x_n$ are found at Step 3
>[!proposition]
>The $n$ functions found at *Step 3* are linearly independent solutions of the LHDE $(4)$

we have proven this proposition for the case of distinct roots and will now prove it for complex roots below:

>[!definition]
> Let $\gamma : I \rightarrow \mathbb{C} \Rightarrow \gamma(t) = u(t)+ir(t)$, where $u, v : I \rightarrow \mathbb{R}$ and $u,v \in C^n(I)$. We define $\gamma'(t) = u'(t) + iv'(t), t \in I$ - *derivative of a complex function*
> We say that $\gamma$ is a *complex solution* of $(4)$ when $\mathcal{L}(\gamma)=0$

>[!Proposition] 
>If $\gamma = u+iv$ is a *complex solution* of $(4)$ when $\mathcal{L}(x)=0$, then both $u$ and $v$ are (real) solutions of $\mathcal{L}(x)=0$

Proof: $\mathcal{L}(\gamma)=\mathcal{L}(u+iv)=\mathcal{L}(u)+i\mathcal{L}(v)=0$ (since $\mathcal{L}$ is linear) $\Rightarrow \mathcal{L}(u)=0$ and $\mathcal{L}(v)=0$.

### [[The Complex Exponential]]
## LHDEs with CC 
Let $n \in \mathbb{N}^*$ and $a_1,...,a_n \in \mathbb{R}$
$\mathcal{L}(x)=x^{(n)}+a_1x^{(n-1)}+...+a_{n-1}x'+a_nx, \mathcal{L}:C^n(\mathbb{R})\rightarrow C^n(\mathbb{R})$
$l(r)=r^n+a_1r^{n-1}+...+a_{n-1}r+a_n, l : \mathbb{C}\rightarrow\mathbb{C}$
>[!Proposition] 
>Let $r \in \mathbb{C}.$ Then $\mathcal{L}(e^{rt}=l(r)e^{rt}, \forall t \in \mathbb{R}$. Consequently, if, in addition,$l(r)=0$ and $r=\alpha + i \beta$, then $e^{\alpha t}cos(\beta t)$ and $e^{\alpha t} sin(\beta t)$ are solutions to $\mathcal{L}(x)=0$

Proof: 
$\cfrac{d}{dt^k}(e^{rt})=r^ke^{rt}, \forall k \in \mathbb{N} \Rightarrow \mathcal{L}(e^rt)=l(r)e^{rt}$ 
Assume that $r=\alpha + i \beta$ with $\alpha, \beta \in \mathbb{R}, \beta > 0$ and $l(r) = 0$. Then, $\mathcal{L}(e^{rt})=0$.
$e^{rt}=e^{\alpha t + i \beta t}=e^{\alpha t}cos(\beta t)+ i e ^ {\alpha t} sin (\beta t) = u(t)+ ir(t)$. Then, $\mathcal{L}(u+iv)=0 \Rightarrow \mathcal{L}(u)=\mathcal{L}(v)=0$. 

### Example - The spring mass system
![[LHDEs with CC 2025-03-17 12.30.57.excalidraw]]
if:
- m > 0 is the mass 
- k > 0  is the elasticity constant 
- $\nu > 0$ is the damping coefficient 
- $f \in C(\mathbb{R})$ is the external force 
then:  
$x''+\cfrac{\nu}{m}x'+\cfrac{k}{m}x=f(t)$ - 2nd order Ln-HDE with CC
We consider the following cases:
1. undamped motion with no external force: $x''+\cfrac{k}{m}x=0$
2. damped motion with no external force: $x''+\cfrac{\nu}{m}x'+\cfrac{k}{m}x=0$ 
3. undamped motion with $f(t)=A\cos (\omega t)$, for some $A, \omega >0$ fixed: $x''+\cfrac{k}{m}x=A \cos (\omega t)$ 

solutions
1) $x''+\cfrac{k}{m}x= x'' + \omega_0^2x=0, \omega_0 = \sqrt{\cfrac{k}{m}}$ the harmonic oscillator 
$r^2+\omega_0^2=0 \Rightarrow r^2 = \omega_0^2 \Rightarrow r_{1,2}=\pm i \omega_0 \mapsto \cos(\omega_0 t), \sin (\omega_0 t)$. The general solution is: $x = c_1 \cos (\omega_0 t)+c_2 \sin (\omega_0 t), c_1,c_2\in \mathbb{R}$. 
Then any non-null solution is periodic with the minimal period $T=\cfrac{2\pi}{\omega_0}$, with the angular frequency $\omega_0$ and the frequency $\cfrac{1}{T}=\cfrac{\omega_0}{2\pi}$. 
$T$ is measured in seconds, $\omega_0$ is measured in radians/second
The frequency is measured in $Hz$, $1Hz$ is the number of oscillations in 1 second.

What is the amplitude of the oscillations?
We write $(c_1,c_2)\in \mathbb{R}^2 \setminus \{(0,0)\}$ in polar coordinates: $c_1=A\cos\varphi_0, c_2=A\sin\varphi_0$, $A > 0, \varphi_0 \in [0,2\pi)$
The general solution $x=A_0\cos\varphi_0\cos(\omega_0t)+A_0\sin\varphi_0\sin(\omega_0t) = A_0cos(\omega_0t-\varphi_0)$. Thus, the amplitude of the oscillation is $A_0$ (because $cos(\omega_0t-\varphi_0) \in [-1,1]$), where $A_0=\sqrt{c_1^2+c_2^2}$
Each motion is oscillatory with constant amplitude.
![[undamped_motion_no_external_force]]
  2) $x''+\cfrac{\nu}{m}x'+\cfrac{k}{m}x=0$, $k,m,\nu>0$
We will prove that for any solution, $\lim_{t\rightarrow \infty}x(t)=0$. 
$r^2+\cfrac{\nu}{m}2+\cfrac{k}{m}=0$, $\Delta = \cfrac{\nu^2}{m^2}-\cfrac{4k}{m}=\cfrac{\nu^2-4km}{m^2}$
Case 2.1: $\nu < \sqrt{4km}$ - <u>Under</u>dampened motion.
$x = e^{\alpha t}(c_1cos{\beta t} + c_2\sin (\beta t) = A_0e^{\alpha t}\cos(\beta t - \varphi_0), A_0 > 0, \varphi_0 \in [0,2\pi)$.
Thus, the amplitude here depends on time
sign $\alpha = ?$ $\alpha = ?$
$r_1+r_2=2\alpha=-\cfrac{\nu}{m}\Rightarrow \alpha = -\cfrac{\nu}{2m}<0 \Rightarrow lim_{t \rightarrow \infty}e^{\alpha t}=0 \Rightarrow \lim_{t\Rightarrow \infty}x(t)=0.$
![[underdamped]]
Case 2.2: $\nu > \sqrt{4km}$ - <u>Over</u>dampened motion.
$\Delta > 0$, $r_1,r_2\in \mathbb{R}, r_1\neq r_2$
$x=c_1e^{r_1t}+c_2e^{r_2t}$. From Viete, we can deduce that $r_1,r_2<0$, so $lim_{t\rightarrow\infty}x(t)=0$
![[overdamped]]
The object goes rapidly to the equilibrium position

3) $x''+\omega_0^2x=A \cos (\omega t)$, where $\omega_0=\sqrt{\cfrac{k}{m}}$ - 2nd order Ln-HDE with CC 
Step 1: We write the LHDE associated: $x''+\omega_0^2x=0$. Its general solution is, as per 1), $x_k=c_1\cos(\omega_0 t)+c_2\sin(\omega_0 t), c_1, c_2 \in \mathbb{R}$
Step 2: We find a particular solution $x_p$ such that $x_p''+\omega_0^2x_p=A \cos (\omega t)$
Remark: $\omega_0$ is said to be the internal angular frequency of the oscillator, while $\omega$ is said to be the external angular frequency.
Case 3.1: $\omega \neq \omega_0$ $\rightarrow$ $x_p = a \cos (\omega t)+b\sin(\omega t)$
$x_p' = -a\omega \sin(\omega t) + b \omega \cos (\omega t)$; $x_p'' = -a\omega^2 \cos(\omega t) - b \omega^2 \sin (\omega t)$
$\Rightarrow$ $-a \omega^2\cos(\omega t)-b\omega^2\sin(\omega t)+a\omega_0^2\cos(\omega t)+b\omega_0^2\sin(\omega t)=A\cos(\omega t), \forall t \in \mathbb{R}$
$\Rightarrow (-a\omega^2+a\omega_0^2-A)\cos(\omega t)+(-b\omega^2+b\omega_0^2)\sin(\omega t) = 0, \forall t \in \mathbb{R}$
The equation above is a linear combination of $\cos(\omega t)$ and $\sin(\omega t)$, which are linearly independent (Proof - take $t = 0$ and $t = \cfrac{\pi}{2\omega}$). Thus, $-a\omega^2+a\omega_0^2-A=0$ and $-b\omega^2+b\omega_0^2=0$ 
Since $\omega \neq \omega_0 \Rightarrow \begin{cases} a = \cfrac{A}{\omega_0^2-\omega^2} \\ b = 0 \end{cases} \Rightarrow x_p = \cfrac{A}{\omega_0^2-\omega^2} \cos (\omega t)$.
Thus, the general solution is $x = c_1\cos(\omega_0 t)+c_2\sin(\omega_0 t)+\cfrac{A}{\omega_0^2-\omega^2}\cos(\omega t), c_1,c_2 \in \mathbb{R}$
Any solution is bounded and oscillatory. It is periodic $\iff \cfrac{\omega}{\omega_0}\in  \mathbb{Q}$

Case 3.2: $\omega = \omega_0$ $\rightarrow$ $x_p = t(a\cos(\omega t)+b\sin(\omega t)), a,b\in\mathbb{R}$
$x_p'=a\cos(\omega t)+b\sin(\omega t)+t(-a\omega\sin(\omega t)+b\omega \cos(\omega t))$
$x_p''+\omega_0^2x_p=A\cos(\omega t)$
$\Rightarrow -2a \omega \sin (\omega t)+2b\omega cos(\omega t)+t(-a\omega^2cos(\omega t)-b\omega^2\sin(\omega t))+t(a\omega^2cos(\omega t)+b\omega^2\sin(\omega t))=A \cos(\omega t)$
since $\cos (\omega t), \sin (\omega t)$ are linearly independent, we get that $\begin{cases} -2a\omega = 0 \\ 2b\omega = A \end{cases} \Rightarrow \begin{cases}a = 0 \\ b = \cfrac{A}{2\omega}\end{cases} \Rightarrow x_p=\cfrac{A}{2\omega}t\sin(\omega t)$
The general solution is: $x = c_1 cos(\omega t)+c_2\sin(\omega t)+\cfrac{A}{2\omega}t\sin(\omega t), t \in \mathbb{R}$
Conclusion: oscillations with unbounded amplitude occur when the external and the internal angular frequencies are equal (*resonance*)