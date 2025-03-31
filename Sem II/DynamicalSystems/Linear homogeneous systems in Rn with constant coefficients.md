# Linear homogeneous systems in Rn with constant coefficients
___
Class: [[DynamicalSystems]]
Type: Lecture
Tags: #Systems
Date: March 31st, 2025
___
## Introduction
### Prerequisites

Let $n \in \mathbb{N}^*, A \in \mathcal{M}_n(\mathbb{R})$ and consider $(1) X' = AX$.
**Recall**: A solution of $(1)$ is a $C^1$ function $\varphi : \mathbb{R} \rightarrow \mathbb{R}^n$ s.t. $\varphi'(t)=A\varphi(t)$ $\forall t \in \mathbb{R}$
Here, $\varphi(t)\in \mathbb{R}^n$ is a column vector
**Remark**: For $n = 1$: $(1) \Leftrightarrow x'=ax$, where $a \in \mathbb{R}$ fixed 
For $n = 2$: in the seminar we learn, for coupled systems, the reduction method

**Recall from the previous lecture**:
We know from the existence and uniqueness theorem: $\forall \eta \in \mathbb{R}^n$, the IVP $\begin{cases} X' = AX \\ X(0) = \eta \end{cases}$ has a unique solution. 

**The fundamental theorem for LH systems**: System $(1)$ has $n$ [[Linear independence. Bases|linearly independent]] solutions $x_1,...,x_n$ and its general solution can be written as $x = c_1x_1+...+c_nx_n$, where $c_1,...,c_n \in \mathbb{R}$
Moreover, if we denote $U(t) = (x_1(t)...x_n(t))$, the gen. sol. can be written as $$X = U(t)C$$, where $C \in \mathbb{R}^n$

### Today
- the role of *eigenvalues* and *eigenvectors* of $A$.
- we define the *exponential matrix* and see that the unique solution of the IVP $\begin{cases} X' = AX \\ X(0) = \eta \end{cases}$ is $X=e^{At}\eta$
- we introduce the notion of *diagonizable matrices* 
- we find the general solution of $(1)$ when $A$ is diagonizable

## Lecture
**Recall**: By definition, $\lambda \in \mathbb{C}$ is an *[[eigenvalue]]* of $A$ when $$\exists u \in \mathbb{C}^n, u \neq 0, \text{ s.t. } Au = \lambda u$$ $u$ is called an *eigenvector* corresponding to $A$.
>[!property] 
>$\lambda \in \mathbb{C}$ is an eigenvalue of $A \iff \det(A - \lambda I_n) = 0$


>[!property] 
>The function $\varphi(t)=e^{\lambda t}u$ with $\lambda \in \mathbb{C}$ and $u \in \mathbb{C}^n$ verifies $$\varphi'(t)=A\varphi(t) \iff Au = \lambda u$$

<u>Proof</u>: $\varphi'(t)=A\varphi(t),\forall t\in\mathbb{R}$ with $\varphi(t)=e^{\lambda t}u$ $\iff \lambda e^{\lambda t}u=A(e^{\lambda t}u),\forall t \in \mathbb{R} \iff \lambda u = Au$
Example: Find the general solution of $\begin{cases} x_1'=x_1+3x_2 \\ x_2'=x_1-x_2 \end{cases}$

$A = \begin{pmatrix} 1 && 3 \\ 1 && -1 \end{pmatrix}$
1. Find the eigenvalues of $A$
$\det(A-\lambda I_2) = 0 \iff \begin{vmatrix} 1 - \lambda && 3 \\ 1 && -1-\lambda \end{vmatrix} = 0 \iff$ $(1-\lambda)(\lambda+1)-3 = 0 \iff$ $\lambda_1 = -2$ and $\lambda_2 = 2$. 
2. Find the eigenvectors corresponding to $\lambda_1 = -2$
$u = \begin{pmatrix} a \\ b \end{pmatrix}$. $Au= \lambda_1u \iff \begin{pmatrix} 1 && 3 \\ 1 && -1 \end{pmatrix} \cdot \begin{pmatrix} a \\ b \end{pmatrix} = \begin{pmatrix} -2a \\ -2b \end{pmatrix}$ $\iff \begin{cases}a + 3b = -2a \\ a - b = -2b\end{cases}$ $\iff a = 1, b = -1$ $\Rightarrow u = \begin{pmatrix} 1 \\ -1\end{pmatrix}$ is an eigenvector corresponding to $\lambda_1 = -2$
3. Find the eigenvectors corresp. to $\lambda_2=2$
Similarly, we obtain $u_2 = \begin{pmatrix}3 \\ 1\end{pmatrix}$
4. Find $x_1$ and $x_2$
Thus, $x_1 = e^{-2t}\begin{pmatrix} 1 \\ -1\end{pmatrix}$ and $x_2 = e^{2t}\begin{pmatrix} 3 \\ 1\end{pmatrix}$ are solutions of the system.
5. Prove that $x_1, x_2$ are linearly independent
Assume by contradiction that $x_1,x_2$ are not linearly independent. Then $\exists k_1,k_2$ s.t. $k_1x_1 + k_2x_2 = 0, \forall t \in \mathbb{R}$, with $k_1,k_2$ not both $0$. Take $t=0$. Then $k_1u_1+k_2u_2=0$ $\iff \begin{cases} k_1+3k_2 = 0 \\ -k_1+k_2 = 0 \end{cases}$ $\iff \begin{vmatrix}u_1 && u_2 \end{vmatrix} = 0$. But $\begin{vmatrix} u_1 && u_2 \end{vmatrix} = 4$, contradiction! 

>[!important] Note that $u_1$ and $u_2$ are always *linearly independent*
>Meaning that this reasoning can be applied for any system

Thus, $x_1, x_2$ are linearly independent and, by the fundamental theorem, the general solution of the system is $X = c_1 \begin{pmatrix} e^{-2t} \\ -e^{2t} \end{pmatrix} + c_2 \begin{pmatrix} 3e^{-2t} \\ e^{2t} \end{pmatrix}$

### Diagonalizable matrices
>[!definition]
>A $C^1$ matrix function $E : \mathbb{R} \rightarrow \mathcal{M}_n(\mathbb{R})$ is said to be the *principal matrix solution* of $X'=AX$, when $E'(t)=AE(t)$, $\forall t \in \mathbb{R}$ and $E(0)=I_n$

>[!Definition]
>Two matrices $A, B \in \mathcal{M}_n(\mathbb{C})$ are *similar* when $\exists$ an invertible matrix $P \in \mathcal{M}_n(\mathbb{C})$ s.t. $A = PBP^{-1}$

>[!property]
> If $A$ and $B$ are similar, then they have the same *eigenvalues*.
> Additionally, if $\lambda$ is an eigenvalue of $A$ and $B$, with $Au = \lambda u$ and $Bv = \lambda v$, then $$v = P^{-1}u$$

<u>Proof</u>: $Bv = B(P^{-1}u) = (P^{-1}P)(BP^{-1})u = P^{-1}(PBP^{-1})u = P^{-1}(Au)=P^{-1}(\lambda u)=\lambda v$

>[!Definition]
>Let $A \in \mathcal{M}_n(\mathbb{R})$.
>- We say that $A$ is *diagonalizable over $\mathbb{R}$* when $\exists$ a *diagonal matrix* $D \in \mathcal{M}_n(\mathbb{R})$ s.t. $A$ and $D$ are similar.
>- We say that $A$ is *diagonalizable over $\mathbb{C}$* when $\exists$ a *diagonal matrix* $D \in \mathcal{M}_n(\mathbb{C})$ s.t. $A$ and $D$ are similar.
>

A matrix that is not diagonalizable on $\mathbb{C}$ is said to be *deffective*.
>[!property]
>Let $A \in \mathcal{M}_n(\mathbb{R})$. We have that $A$ is *diagonalizable over $\mathbb{R} iff$ any eigenvalue of $A$ is real and there are $n$ linearly independent eigenvectors in $\mathbb{R}^n$ 

>[!definition] Definition - The exponential matrix
> Let $A \in \mathcal{M}_n(\mathbb{R})$.
> By definition, $e^A \in \mathcal{M}_n(\mathbb{R})$ is the sum of the series of matrices $\sum_{k=0}^{\infty} \cfrac{1}{k!}A^k$

<u>Examples</u>: 
- $e^A = I_n + A + \cfrac{1}{2!}A^2+...++\cfrac{1}{k!}A^k+...$
$e^{O_n} = I_n$, $e^{tI_n} = \sum_{k=0}^{\infty} \cfrac{t^k}{k!}I_n = (\sum_{k=0}^{\infty} \cfrac{t^k}{k!})I_n = e^tI_n$ 
$A = \text{ diag}(\lambda_1,...,\lambda_n)=\begin{pmatrix} \lambda_1 && 0 && ... && 0 \\ \lambda_1 && 0 && ... && 0 \\ 0 &&\lambda_2 &&  ... && \lambda_n \end{pmatrix}$ $\Rightarrow A^k = \text{ diag}(\lambda_1^k,...,\lambda_n^k), \forall k \in \mathbb{N}$
$e^{t \text{ diag}(\lambda_1,...,\lambda_n)}=\sum_{k=0}^{\infty} \cfrac{1}{k!}\text{ diag}((t\lambda_1)^k,...,(t\lambda_n)^k)$ $= \text{ diag}(e^{t\lambda_1},...,e^{t\lambda_n})$

In particular, $e^{t\begin{pmatrix} \lambda_1 && 0 \\ 0 && \lambda_2 \end{pmatrix}} =\begin{pmatrix} e^{t\lambda_1} && 0 \\ 0 && e^{t\lambda_2} \end{pmatrix}$

$e^{t\begin{pmatrix} 0 && -1 \\ 1 && 0 \end{pmatrix}} =\begin{pmatrix} \cos t && -\sin t \\ \sin t && \cos t \end{pmatrix}$

>[!property]
>- $e^{A+B}=e^A\cdot e^B$ if $AB=BA$
>- $E(t)=e^{tA}, t \in \mathbb{R}$ is the *principal matrix solution* of $X'=AX$

>[!property]
>Let $A,B \in \mathcal{M}_n(\mathbb{R})$ s.t. $A$ and $B$ are similar, $A = PBP^{-1}$. Then
>1. $A^k=PB^kP^{-1}, k\in\mathbb{N}^*$
>2. $e^{tA} = Pe^{tB}P^{-1},t\in\mathbb{R}$

<u>Proof</u>:
1. induction
	I) 
$k = 1$: $A = PBP^{-1}$, true
$k = 2$: $A^2=(PBP^{-1})^2 = (PBP^{-1}PBP^{-1}) = PBI_nBP^{-1}=PB^2P^{-1}$  
	II) assume for $k$: $A^k = PB^kP^{-1}$. prove for $k+1$: $A^{k+2} = PB^{k+1}P^{-1}$. 
$A^{k+1} = A^kA = (PB^kP^{-1})(PBP^{-1}) = PB^kI_nBP^{-1}=PB^{k+1}P^{-1}$.
2. $e^{tA} = \sum_{k=0}^{\infty} \cfrac{t^k}{k!}A^k=\sum_{k=0}^{\infty} \cfrac{t^k}{k!}PB^kP^{-1}=P(\sum_{k=0}^{\infty} \cfrac{t^k}{k!}B^k)P^{-1}=Pe^{tB}P^{-1}$

### General solution of (1) for $A$ diagonalizable over $\mathbb{R}$
Let $\lambda_1,...,\lambda_n \in \mathbb{R}$ be the eigenvalues of $A$ (not necessarily distinct) and $u_1,...,u_n\in\mathbb{R}^n$ be the $n$ linearly independent eigenvectors. 
Denote $X = \text{ diag}(\lambda_1,...,\lambda_n)$. It can be proven that $P = (u_1 | ... | u_n)$ (each eigenvector being a column of $P$)

>[!property] 
>1. $A = PDP^{-1} \iff AP = PD$
>2. $A^k = P \text{ diag}(\lambda_1,...,\lambda_n)P^{-1}, \forall k \in \mathbb{N}^*$
>3. $e^{tA}=P \text{ diag}(e^{t\lambda_1},...,e^{t\lambda_n})P^{-1}$
>4. $e^{t\lambda_1}u_1,...,e^{t\lambda_n}u_n$ are $n$ linearly independent solutions of $X' = AX$

<u>Proof</u>: 
1. .
$AP = A(u_1...u_n)=(Au_1...Au_n)=(\lambda_1u_1...\lambda_nu_n)$ 
$PD = (u_1...u_n)\begin{pmatrix} \lambda_1 && 0 && ... && 0 \\ 0 && \lambda_2 && ... && 0 \\ && && \vdots \\ 0 && 0 && ... && \lambda_n \end{pmatrix}= (\lambda_1u_1...\lambda_nu_n)$
2. $A = PDP^{-1} \Rightarrow A^k = PD^kP^{-1}$
3. $e^{tA}=Pe^{tD}P^{-1}$
4. We have already proven that $e^{t\lambda_1}u_1,...,e^{t\lambda_n}u_n$ are solutions of the equations, so we only need to prove linear independence
Let $k_1,...,k_n \in \mathbb{R}$ s.t. $k_1e^{t\lambda_1}u_1+...+k_ne^{t\lambda_n}u_n = 0, \forall t$ $\Rightarrow$ (for $t=0$) $k_1u_1+...+k_nu_n=0$ $\Rightarrow k_1=...=k_n=0$ (we have already proven that $u_1,...,u_n$ are linearly independent) $\Rightarrow$ qed.

### The characteristic method to find the general solution of $X'=AX$, where $A$ is diagonalizable over $\mathbb{R}$

**Step 1**
We find the eigenvalues and the eigenvectors of $A$. Decide whether or not $A$ is diagonalizable over $\mathbb{R}$
**Step 2**
Denote $\lambda_1,...,\lambda_n$ the eigenvalues and $u_1,...,u_n$ the corresponding eigenvectors and associate the functions $e^{t\lambda_1}u_1,...,e^{t\lambda_n}u_n$
**Step 3**
Write the general solution $$X = c_1e^{t\lambda_1}u_1+...+c_ne^{t\lambda_n}u_n\text{, }c_1,...,c_n\in\mathbb{R}$$
Alternatively,
**Step 2'**
$e^{tA}=P\text{ diag}(e^{t\lambda_1},...,e^{t\lambda_n})P^{-1}$
**Step 3'**
The general solution $X = e^{tA}C\text{, }C\in\mathbb{R}^n$


### Misc
<u>Idea</u>: Find $\lambda \in \mathbb{R}$ s.t. $\exists$ a solution $u(x) \neq 0$ for the problem $\begin{cases} -u''(x)=\lambda u(x) \\ u(0)=u(\pi)=0 \end{cases}$

$\Rightarrow \lambda_k = k^2,k\in\mathbb{N}$. Notice that there is an infinite number of eigenvalues. We can define the *eigenfunctions* $u_k(x)=\sin(kx)$ 

>[!info]
>Joseph Fourier discovered these functions, which are used for approximating functions
>Look up Fourier series


