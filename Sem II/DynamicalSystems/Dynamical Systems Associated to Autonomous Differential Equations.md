# Dynamical Systems Associated to Autonomous Differential Equations
___
Class: [[DynamicalSystems]]
Type: Lecture
Tags: # 
Date: April 28th, 2025
___

$(1) \dot x = f(x)$, where $f : \mathbb{R}^n \rightarrow \mathbb{R}^n$ is a $C^1$ function 
>[!recall]
 >- $\varphi(t,\eta)$ the unique solution of the IVP $\dot x = f(x), x(0)= \eta$
 >- $\eta^*\in\mathbb{R}^n$ is an equilibrium point $\iff f(\eta^*$=0 
>
 >We presented the notions: *attractor / repeller* equilibrium point.
 >![[recall-equil-points]]
 

>[!definition]
>Let $\eta^*$ be an equilibrium point of $(1)$. We say that $\eta^*$ is a *stable equilibrium* of $(1)$ if $\forall \eta > 0, \exists \delta > 0$ s.t. $\|\eta - \eta^*\| < \delta$ we have $$\|\varphi(t,\eta)-\eta^*\|<\epsilon$$, $\forall t \in [0, \infty]$

>[!remark]
>In the previous definition, $\|\cdot\|$ is a norm that can be chosen to our advantage, since any two norms in $\mathbb{R}^n$ are equivalent

>[!Definition]
> An orbit $\gamma_\eta$ is said to be a *periodic* / *closed* orbit when the corresponding solution $\varphi(t,\eta)$ is a periodic function

<u>Example</u>: For the system $\begin{cases}\dot x = -y \\ y = x\end{cases}$, any solution is $2\pi$ periodic, and the corresponding orbits are closed curves (in fact, they are circles).

## Planar linear systems (n = 2)

$(2) \dot X = AX$ where $A \in \mathcal{M}_2(\mathbb{R})$. Let $\lambda_1, \lambda_2 \in \mathbb{C}$ be the eigenvalues of $A$ 
The phase portrait of $(2)$, in particular to decide when $(2)$ has a global first integral and when the equilibrium point  at the origin is an attractor / repeller / stable / unstable

>[!remark]
> $(0,0)$ is the only equilibrium point of system $(2)$ $\iff \det A \neq 0 \iff \lambda_1 \neq 0$ and $\lambda_2 \neq 0$
> >[!recall]
> >$\det A = \lambda_1 \lambda_2$

### Classification of linear systems with $\det A \neq 0$
We say that system $(2)$ is a 
- *NODE* when $\lambda_1,\lambda_2 \in \mathbb{R}$ have the same sign
- *SADDLE* when $\lambda_1,\lambda_2 \in \mathbb{R}$ have opposite signs
- *CENTER* when $\lambda_{1,2} = \pm i\beta$ with $\beta > 0$
- *FOCUS* when $\lambda_{1,2} = \alpha \pm i\beta$ with $\alpha \neq 0$ and $\beta > 0$

#### Theorems
>[!Theorem] Theorem 1
>Let $A \in \mathcal{M}_2(\mathbb{R})$ be s.t. the system $\dot X = AX$ is a center. Then, this system has a *global first integral*

<u>Proof</u>
- $\begin{cases}\dot x = y \\ \dot y = -x\end{cases}$ has $H : \mathbb{R}^2 \rightarrow \mathbb{R}, H(x,y)=x^2+y^2$ is a global first integral and this is a center since $A = \begin{pmatrix} 0 && -1 \\ 1 && 0 \end{pmatrix}$ has the eigenvalues $\lambda_{1,2} = \pm i$
- $\begin{cases}\dot x = - \beta y \\ \dot y = \beta x\end{cases}$ with $\beta > 0$. This is also a center since $ $A = \begin{pmatrix} 0 && -\beta \\ \beta && 0 \end{pmatrix}$ has the eigenvalues $\lambda_{1,2} = \pm i \beta$ and $ $H : \mathbb{R}^2 \rightarrow \mathbb{R}, H(x,y)=x^2+y^2$ is a global first integral 
($-\beta y \cdot \cfrac{\partial H}{\partial x} + \beta x \cdot \cfrac{\partial H}{\partial y} = 0$)
From linear algebra: If $A$ has the eigenvalues $\pm i \beta$, then $\exists P \in \mathcal{M}_2(\mathbb{R})$ invertible s.t. $$A = P \begin{pmatrix} 0 && -\beta \\ \beta && 0\end{pmatrix}P^{-1}$$
Then, $e^{tA} = Pe^{t\begin{pmatrix} 0 && -\beta \\ \beta && 0\end{pmatrix}}P^{-1}$
The unique solution of $\begin{cases}\dot X = AX \\ X(0)=\eta\end{cases}$ is $\varphi(t,\eta)=e^{tA}\eta=Pe^{t\begin{pmatrix} 0 && -\beta \\ \beta && 0\end{pmatrix}}P^{-1}\eta$ $\Rightarrow P^{-1}\varphi(t,\eta)=e^{t\begin{pmatrix} 0 && -\beta \\ \beta && 0\end{pmatrix}}P^{-1}\eta$.
Let $H(x,y) = x^2 + y^2$. Denote $\tilde H(\eta) = H(P^{-1}\eta), \forall \eta \in \mathbb{R}^2$
We check using the definition that $\tilde H$ is a first integral.
$\tilde H(\varphi(t,\eta))=H(P^{-1}\varphi(t,\eta))=H(e^{t\begin{pmatrix} 0 && -\beta \\ \beta && 0\end{pmatrix}}P^{-1}\eta)=H(P^{-1}\eta)=\tilde H(\eta)$ (we used the fact that $H$ is a first integral of $\begin{cases}\dot x = - \beta y \\ \dot y = \beta x\end{cases}$)

>[!Theorem] Theorem 2
>Let $A \in \mathcal{M}_2(\mathbb{R})$ be s.t. the system $\dot X = AX$ is a saddle. Then, the system $\dot X = AX$ has a *global first integral*

>[!Theorem] Theorem 3 - Stability of the eq. $(0,0)$ of $\dot X = AX$
>1. if $Re(\lambda_1) < 0$ and $Re(\lambda_2) < 0$, then $(0,0)$ is an *attractor*
>2. if $Re(\lambda_1) > 0$ and $Re(\lambda_2) > 0$, then $(0,0)$ is a *reppeller
>3. if $\dot X = AX$ is a center then $(0,0)$ is stable
>4. if $\dot X = AX$ is a saddle then $(0,0)$ is not stable

<u>Proof</u>
1. The proof is given only in the case that $A$ is a diagonalizable matrix in $\mathbb{C}$, i.e. $\exists P \in \mathcal{M}_2(\mathbb{C})$ s.t. $A = P \begin{pmatrix} \lambda_1 && 0 \\ 0 && \lambda_2 \end{pmatrix}P^{-1}$
We use the definition of a global attractor, i.e. we want to prove that $$\lim_{t\rightarrow \infty}\varphi(t,\eta)=(0,0), \forall \eta \in \mathbb{R}^2$$
We have $\varphi(t,\eta)=e^{tA}\eta=P e^{\begin{pmatrix} \lambda_1 && 0 \\ 0 && \lambda_2 \end{pmatrix}}P^{-1}\eta = P \begin{pmatrix} e^{t\lambda_1} && 0 \\ 0 && e^{t\lambda_2} \end{pmatrix}P^{-1}\eta$
Our aim is to prove that $\lim_{t\rightarrow \infty}e^{t\lambda_1}=\lim_{t\rightarrow \infty}e^{t\lambda_2}=0$
If $\lambda_1 \in \mathbb{R}$ and $\lambda_1 < 0$, this is true
If $\lambda_1 = \alpha + i \beta$ and $\alpha < 0$, then $e^{t\lambda_1}=e^{t\alpha}(\cos \beta t + i \sin \beta t) \rightarrow 0$ (since $\cos \beta t + i \sin \beta t$ is bounded)
2. Similar to 1 
3. $\dot X=AX$ is a center
We want to prove that $(0,0)$ is stable, i.e. $\forall \epsilon > 0, \exists \delta > 0$ s.t. whenever $\|\eta\| < \delta$, we have $\|\varphi(t,\eta)\|<\epsilon \forall t \in [0,\infty)$.
We denote by $\|\cdot\|_E$ the euclidean norm, i.e. for $\eta =n \begin{pmatrix} \eta_1 \\ \eta_2 \end{pmatrix}$, $\|\eta\|^2_E = \eta_1^2 + \eta_2^2$. 
We know that $\tilde H(\eta) = \|P\eta\|_E^2$ is a global first integral
We define $\|\eta\|=\|P^{-1}\eta\|_E, \forall \eta \in \mathbb{R}^2$ and prove that this is a norm in $\mathbb{R}^2$. If 
4. $\dot X=AX$ is a saddle



