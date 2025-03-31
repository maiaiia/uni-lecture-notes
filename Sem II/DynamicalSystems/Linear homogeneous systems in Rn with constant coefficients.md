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

**The fundamental theorem for LH systems**: System $(1)$ has $n$ linearly independent solutions $x_1,...,x_n$ and its general solution can be written as $x = c_1x_1+...+c_nx_n$, where $c_1,...,c_n \in \mathbb{R}$
Moreover, if we denote $U(t) = (x_1(t)...x_n(t))$, the gen. sol. can be written as $$X = U(t)C$$, where $C \in \mathbb{R}^n$

### Today
- the role of *eigenvalues* and *eigenvectors* of $A$.
- we define the *exponential matrix* and see that the unique solution of the IVP $\begin{cases} X' = AX \\ X(0) = \eta \end{cases}$ is $X=e^{At}\eta$
- we introduce the notion of *diagonizable matrices* 
- we find the general solution of $(1)$ when $A$ is diagonizable

## Lecture
**Recall**: By definition, $\lambda \in \mathbb{C}$ is an *eigenvalue* of $A$ when $$\exists u \in \mathbb{C}^n, u \neq 0, \text{ s.t. } Au = \lambda u$$ $u$ is called an *eigenvector* corresponding to $A$.
>[!Property] 
>$\lambda \in \mathbb{C}$ is an eigenvalue of $A \iff \det(A - \lambda I_n) = 0$


>[!Property] 
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
>[!Definition]
>A $C^1$ matrix function $E : \mathbb{R} \rightarrow \mathcal{M}_n(\mathbb{R})$ is said to be the *principal matrix solution* of $X'=AX$, when $E'(t)=AE(t)$, $\forall t \in \mathbb{R}$ and $E(0)=I_n$

>[!Definition]
>Two matrices $A, B \in \mathcal{M}_n(\mathbb{C})$ are *similar* when $\exists$ an invertible matrix $P \in \mathcal{M}_n(\mathbb{C})$ s.t. $A = PBP^{-1}$

>[!Property]
> If $A$ and $B$ are similar, then they have the same *eigenvalues*.
> Additionally, if $\lambda$ is an eigenvalue of $A$ and $B$, with $Au = \lambda u$ and $Bv = \lambda v$, then $$v = P^{-1}u$$

<u>Proof</u>: $Bv = B(P^{-1}u) = (P^{-1}P)(BP^{-1})u = P^{-1}(PBP^{-1})u = P^{-1}(Au)=P^{-1}(\lambda u)=\lambda v$

>[!Definition]
>Let $A \in \mathcal{M}_n(\mathbb{R})$.
>- We say that $A$ is *diagonalizable over $\mathbb{R}$* when $\exists$ a *diagonal matrix* $D \in \mathcal{M}_n(\mathbb{R})$ s.t. $A$ and $D$ are similar.
>- We say that $A$ is *diagonalizable over $\mathbb{C}$* when $\exists$ a *diagonal matrix* $D \in \mathcal{M}_n(\mathbb{C})$ s.t. $A$ and $D$ are similar.
>


 

