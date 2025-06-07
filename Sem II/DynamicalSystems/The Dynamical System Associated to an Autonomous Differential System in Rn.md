# The Dynamical System Associated to an Autonomous Differential System in Rn
___
Class: [[DynamicalSystems]]
Type: 
Tags: # 
Date: June 7th, 2025
___

General: $x' = f(x)$, where $f : \mathbb{R}^n \rightarrow \mathbb{R}^n$ is a $C^1$ function. 
- $f$ is said to be *autonomous*, because it lacks $f$

In this case, we can change the notation for the derivative with respect to time: $x' \mapsto \dot x$ 

So $(1): \dot x = f(x) \rightarrow$ law of *motion* / *change* of some physical system. This system is described by a function of time that has values in $\mathbb{R}^n$. So a state of the system is also from $\mathbb{R}^n$ (i.e. $\mathbb{R}^n$ is the state space)

The motion is fully determined by the initial state. 
We consider the IVP $(2)$: $\begin{cases}\dot x = f(x) \\ x(0)=\eta, \eta \in \mathbb{R}^n \end{cases}$

>[!Theorem] Theorem: The existence and uniqueness theorem for the solution of the IVP
>Assume $f \in C^1, \eta \in \mathbb{R}^n$. Then, the IVP $(2)$ has a *unique solution* denoted $\varphi(t,\eta)$ and called the **flow** of the system, which is defined on an open interval $I_\eta=(\alpha_\eta, \beta_\eta)$, with values in $\mathbb{R}^n$
>
> Moreover,
>- if $\varphi(\cdot, \eta)$ is bounded on $(0,\beta_\eta)$, then $\beta_\eta=\infty$
>- if $\varphi(\cdot, \eta)$ is bounded on $(\alpha_\eta, 0]$, then $\alpha_\eta=-\infty$
>- if $\varphi(\cdot, \eta)$ is bounded on $I_eta$, then $I_\eta=\mathbb{R}$

>[!definition]
> Let $\eta^*\in\mathbb{R}^n$. We say that $\eta^*$ is an *equilibrium* (stationary) point (state) of $(1)$ when $\varphi(t, \eta^*)=\eta^*$, $\forall t \in \mathbb{R}$

>[!Remark]
>$\eta^*$ is an equilibrium $\iff$ the unique solution of the IVP $\begin{cases}\dot x = f(x) \\ x(0)=\eta^*\end{cases}$ is the constant motion $\eta^*$ $\iff f(\eta^*)=0$ 

>[!Proposition]
>Let $\eta^*$ be an equilibrium point of $(1)$ and $\eta \in \mathbb{R}^n, \eta \neq \eta^*$. Then, $\varphi(t,\eta) \neq \eta^*$
>>[!proof]-
>>Assume, by contradiction, that $\exists t_0$ s.t. $\varphi(t_0,\eta)=\eta^*$. Since the dependence on $\eta$ is not important, we'll write $\varphi(t,\eta)$ as $\varphi(t)$ $\Rightarrow$ $\varphi(t_0)=\eta^*$.
>>Take $\psi(t)=\varphi(t+t_0)$. 
>>Knowing that $\begin{cases}\varphi'(t)=f(\varphi(t)) \\ \varphi(0)=\eta\end{cases}$, we want to prove that: $\begin{cases}\psi'(t)=f(\psi(t)) \\ \psi(0)=\eta^* \end{cases}$
>>
>>$\begin{rcases}\psi(t) = \varphi(t+t_0)\Rightarrow\psi'(t)=\varphi'(t+t_0)=f(\varphi(t+t_0))=f(\psi(t))\\ \psi(0)=f(t_0)=\eta^*\end{rcases} \Rightarrow$ 
>>$\begin{rcases} \Rightarrow  \psi \text{ is the solution of the IVP } \begin{cases}x'=f(x)\\ x(0)=\eta^*\end{cases} \\ \text{The unique solution of this IVP is the constant function } \eta^* \end{rcases}$ $\Rightarrow \psi(t) = \eta^*, \forall t \in \mathbb{R}$
>>$\Leftrightarrow \varphi(t+t_0)=\eta^*,\forall t \in \mathbb{R}$ $\Rightarrow \varphi(0)=\eta^* \Rightarrow \eta^* = \eta$, contradiction!

>[!Theorem]
>Let $\eta \in \mathbb{R}^n$. Assume that $\exists \lim_{t\rightarrow\infty}\varphi(t,\eta)=\eta^*\in\mathbb{R}^n$. Then, $\eta^*$ is an equilibrium point.
>>[!Proof]
>>By definition, $\dot\varphi(t)=f(\varphi(t))$ $\Rightarrow \lim_{t\rightarrow \infty}\dot \varphi(t)=f(\eta^*) = \eta^*$
($\lim_{t\rightarrow\infty}\varphi(t)=\eta^* \Rightarrow \lim_{t\rightarrow\infty}f(\varphi(t))=f(\eta^*)$ (since $f \in C^1$)) 
>>
>>$\varphi=\begin{pmatrix}\varphi_1 \\ \vdots \\ \varphi_n\end{pmatrix}$. We select intervals of the form $[k,k+1]$ and apply the mean value theorem (on each component): 
>>$\exists \zeta_k \in (k,k+1)$ s.t. $\varphi(k+1)-\varphi(k)=\varphi'(\zeta_k)(k+1-k)=\varphi'(\zeta_k)$
>>$\begin{rcases}\lim_{t\rightarrow\infty} \varphi(k) = \lim_{t\rightarrow\infty}\varphi(k+1)=\eta^* \\ \lim_{t\rightarrow\infty} \varphi'(\zeta_k)=f(\eta^*) \end{rcases}$ $\Rightarrow 0 = f(\eta^*)$, so $\eta^*$ is an equilibrium point, qed.


