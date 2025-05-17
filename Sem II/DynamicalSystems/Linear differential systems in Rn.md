# Linear differential systems in $\mathbb{R}^n$
___
Class: [[DynamicalSystems]]
Type: 
Tags: #Systems 
Date: March 24th, 2025
___

1. $X'=A(t)X+F(t)$, where
$n \in \mathbb{N}^*$, 
$I \subset \mathbb{R}$ open interval
$F:I \rightarrow \mathbb{R}^n$ continuous
$A : I \rightarrow \mathcal{M}_n(\mathbb{R})$ continuous

A solution of (1) is a function $\varphi : I \rightarrow \mathbb{R}$  of class $C^1$ s.t. $\varphi ' (t) = A(t)\varphi(t)+F(t), \forall t \in I$
For example, for $n = 2$, denote $F(t) = \begin{pmatrix}f_1(t)\\f_2(t)\end{pmatrix}$, $A(t)=\begin{pmatrix} a_{11}(t) && a_{12}(t) \\ a_{21}(t) && a_{22}(t) \end{pmatrix}$
$X = \begin{pmatrix} x_1 \\ x_2 \end{pmatrix}$ $(1) \Leftrightarrow \begin{cases} x_1' = a_{11}(t)x_1 + a_{12}(t)x_2+f_1(t) \\ x_2' = a_{21}(t)x_1 + a_{22}(t)x_2+f_2(t) \end{cases}$

*Remark*: Any LDE of order $n$ can be written in the form $(1)$ with the unknown $X = \begin{pmatrix} x_1 \\ x_2 \\ \vdots \\ x_n \end{pmatrix} = \begin{pmatrix} x \\ x' \\ \vdots \\ x^{(n-1)} \end{pmatrix}$

For example, when $n = 2$, the second order LDE $x''+\alpha_1(t)x'+\alpha_2(t)x=f(t)$ can be written, considering $X = \begin{pmatrix} x_1 \\ x_2 \end{pmatrix} = \begin{pmatrix} x \\ x' \end{pmatrix}$ as $\begin{pmatrix} x_1=x \\ x_2=x' \end{pmatrix}$
$\begin{cases} x_1'=x_2 \\ x_2'=-\alpha_2(t)x_1-\alpha_1(t)x_2+f(t) \end{cases}$, $A(t) := \begin{pmatrix} 0 && 1 \\ -\alpha_2(t) && -\alpha_1(t) \end{pmatrix}$, $F(t) := \begin{pmatrix} 0 \\ f(t) \end{pmatrix}$

## The existence and Uniqueness theorem for the IVP
Let $t_0 \in I$ and $\eta \in \mathbb{R}^n$. Then the IVP $\begin{cases} X'-A(t)X+F(t) \\ X(t_0)=\eta \end{cases}$ has a unique solution

First, we associate a map $\mathcal{L}(X)(t) = X'(t)-A(t)X(t)$, $\mathcal{L}:C^1(I, \mathbb{R}^n)\rightarrow C(I,\mathbb{R}^n)$
We can notice that $\mathcal{L}$ is a linear map, i.e. $\mathcal{L}(k_1X+k_2Y)=k_1\mathcal{L}(X)+k_2\mathcal{L}(Y), \forall X,Y \in C^1$
>[!property] 
>$X'=A(t)X \Leftrightarrow \mathcal{L}(X)=0 \Leftrightarrow X \in Ker\mathcal{L}$
>$X'=A(t)X+F(t)\Leftrightarrow \mathcal{L}(X)=F \Leftrightarrow X \in Ker\mathcal{L}+\{x_p\}$, where $\mathcal{L}(x_p) = F$

## The fundamental theorem for LHSs in $\mathbb{R}^n$
The set of all solutions of $X'=A(t)X$ is a linear space of dimension $n$. Thus. $\exists X_1,...,X_n$ [[Linear independence. Bases|linearly independent]] solutions and the general solution is $$X=c_1X_1+...+c_nX_n$$where $c_1,...,c_n \in \mathbb{R}$
**Proof**
We have to prove that $dim(Ker(\mathcal{L}))=null\mathcal{L}=n$. This can be done by finding an isomorphism from $Ker\mathcal{L}$ to $\mathbb{R}$, using the existence and uniqueness theorem 

Let $T : Ker\mathcal{L} \rightarrow \mathbb{R}^n, T(\varphi) = \varphi(t_0)$, with $t_0$ fixed
$T$ is bijective $\iff \forall \eta \in \mathbb{R}^n, \exists ! \varphi \in Ker \mathcal{L}$ s.t. $T(\varphi)=\eta$ $\iff \forall \eta \in \mathbb{R}^n, \exists ! \varphi$ solution of $X' = A(t)X$ s.t. $\varphi(t_0)=\eta$ $\iff \forall \eta \in \mathbb{R}^n, \exists !$ solution of $\begin{cases} X' = A(t)X \\ X(t_0)=\eta \end{cases}$, which is True by the existence and uniqueness theorem   

$T$ is also linear: $T(k_1\varphi+k_2\psi)=k_1T(\varphi)+k_2T(\psi), \forall k_1,k_2 \in \mathbb{R}, \varphi, \psi \in Ker\mathcal{L}$.
Thus, $T$ is an isomorphism of linear space $\Rightarrow$ $dim(Ker(\mathcal{L}))=n$ and we have the conclusion as an immediate consequence.

>[!Tip] Remark
>Each solution of the system is a vector. Thus, we can write the matrix $$U(t)=\begin{pmatrix}X_1(t) | X_2(t) | ... | X_n(t)\end{pmatrix}$$
>Then, the solution of $X' = A(t)X$ can be written as $X=U(t)\cdot C, C \in \mathbb{R}^n$


### Proposition 
(i) $\det U(t) \neq 0, \forall t \in \mathbb{R}$
(ii) the general solution of $X'=A(t)X+F(t)$ is $X = U(t)C + U(t)\int_{t_0}^t U(s)^{-1}F(s)ds$, $C \in \mathbb{R}^n$

*Proof*:
(i) Assume by contradiction that $\exists t_0 \in I$ s.t. $\det U(t_0)=0$. Then, $\exists k_1, ..., k_n \in \mathbb{R}$ not all $0$ s.t. $k_1X_1(t_0)+..+k_nX_n(t_0)=0$. Let $\varphi(t)=k_1X_1(t)+..+k_nX_n(t)=0$ and $T$ be a linear isomorphism between $Ker \mathcal{L}$ and $\mathbb{R}^n$, $T(\varphi)=\varphi(t_0)$
$T(\varphi)=\varphi(t_0)=k_1X_1(t_0)+..+k_nX_n(t_0)=0$. From here we can have a contradiction (the solutions $X_1,...,X_n$ are linearly independent)

(ii) $X' = A(t|)X+F(t)$ Ln-HDS
$X = X_h + X_p$, $X'=A(t)X$, $X_h = U(t)C, C\in\mathbb{R}^n$
To find $X_p$ we use the Lagrange method
$X_p(t)=U(t)\varphi(t),\varphi:I\rightarrow\mathbb{R}^n, \varphi=?, X_p'=A(t)X_p+F(t)$
$U'(t)\varphi(t)+U(t)\varphi'(t)=A(t)U(t)\varphi(t)+F(t), \forall t \in I$ 
$U'(t) = A(t)U(t)$
$\Rightarrow U(t)\varphi'(t)=F(t) \Rightarrow \varphi'(t)=U(t)^{-1}F(t) \Rightarrow \varphi(t)=\int_{t_0}^tU(s)^{-1}F(s)ds$
$X_p=U(t)C+ U(t)\int_{t_0}^tU(s)^{-1}F(s)ds$, $C \in \mathbb{R}^n$




