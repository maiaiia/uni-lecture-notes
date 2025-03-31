# Linear Homogeneous Differential Equations (LHDE)
___
Class: [[DynamicalSystems]]
Type: Lecture
Tags: #LHDE 
Date: March 3rd, 2025
___
## General form of an nth order LHDE
Given: $n \in \mathbb{N}^*, I \subset \mathbb{R}$ non-empty open interval, $a_1,...,a_n:I\rightarrow \mathbb{R}$ continuous.
Find: $x:\mathbb{I}\rightarrow \mathbb{R}$ s.t.
 $$x^{(n)}+a_1(t)x^{(n-1)}+a_2(t)x^{(n-2)}+...+a_n(t)x=0 (1)$$
 > $n$ is the *order*, and $a_1,...,a_n$ are the coefficients

### Examples 
1. Let $a \in \mathbb{R}$ and consider $x'+ax=0$. The general solution is $x = ce^{-at}, c \in \mathbb{R}$. In other words, the set of all solutions of the equation is $\{ce^{-at}:c\in \mathbb{R}\}$
2. $x'-2tx = 0$ is a first order LHDE with non-variable coefficients. $x = 0$ is a solution. We can also notice that $x = ce^{t^2}$ is also a solution, $\forall c \in \mathbb{R}$. 
*Proof* that there are no other solutions:
- Method 1:
	Let $x$ be a solution of $x'-2tx=0$ and $y = xe^{-t^2} \Rightarrow y' = x'e^{-t^2}+x\cdot (-2te^{-t^2}) = e^{-t^2}(x'-2tx)=0$ . Thus $y\ = 0 \Rightarrow y - c, c \in \mathbb{R} \Rightarrow xe^{-t^2} = c, c \in \mathbb{R} \Rightarrow x = ce^{t^2}$
- Method 2:
	$x'-2tx=0|\cdot e^{-t^2} \Rightarrow x'\cdot e^{-t^2}-2tx\cdot e^{-t^2}=0 \Rightarrow (x\cdot e^{-t^2}) = 0\Rightarrow x=c e^{t^2}$
*Conclusion*: The general solution of the equation is $x=ce^{t^2}, c\in \mathbb{R}$ or, in other words, the set of all its solutions is $$\{ce^{t^2}:c\in \mathbb{R}\}$$
## Linear Algebra Recap
Given: $X,Y$ linear spaces and $\mathcal{L} : X \rightarrow Y$ a  linear map 
Prove: $\mathcal{L}(x) = 0$ is a linear homogeneous equation
Find: $x \in X$ s.t. $\mathcal{L}(x) = 0$

Recall notations from mathematical analysis: 
- $C(I) = \{f:I\rightarrow \mathbb{R}\}$
- $C^n(I) = \{f:I\rightarrow \mathbb{R}: \exists f,f',...,f^{(n)} \}$ 
$C(I)$ is a linear space over $\mathbb{R}$ and $C^n(I)$ is a linear subspace of $C(I)$

Let $x : I \rightarrow \mathbb{R} \Rightarrow \mathcal{L}(x):I\rightarrow \mathbb{R}$ is a function
$\mathcal{L}(x) =^{def} x^{(n)}(t)+a_1(t)x^{(n-1)}+...+a_n(t)x(t), \forall t \in I$ ${(2)}$ 
So $X = C(I), Y = C(I) \Rightarrow \mathcal{L}:C^{(n)}(I)\rightarrow C(I)$

**Proposition**: The map $\mathcal{L}:C^{(n)}(I)\rightarrow C(I)$ defined by (2) is linear, i.e. $\mathcal{L}(\alpha x)= \alpha \mathcal{L}(x)$ and $\mathcal{L}(x_1+x_2) = \mathcal{L}(x_1)+\mathcal{L}(x_2)$ 

*Proof* - $\mathcal{L}(x)$ is a linear equation: 
$n = 1: \mathcal{L}(x)(t) = x'(t)+a_1(t)x(t)$
- $\mathcal{L}(\alpha x)(t) = (\alpha x)'(t)+a_1(t)(\alpha x(t)) = \alpha \mathcal{L}(x)(t)$
- $\mathcal{L}(x_1+x_2) = (x_1+x_2)'(t)+a_1(t)(x_1(t)+x_2(t)) = \mathcal{L}(x_1)(t)+\mathcal{L}(x_2)(t)$ 
$\Rightarrow$ $\mathcal{L}(x) = 0$ is a linear homogeneous equation

The set of solutions of $\mathcal{L}(x) = 0$ is denoted by $Ker \mathcal{L}$ and it is a linear subspace of $X$.  

> Remark: Indeed, the set of solutions of the sample equation $x'-2tx=0$ is a linear space of *dimension 1*

## Solutions of a LHDE 
### Def 
Let $\varphi : I \rightarrow \mathbb{R}$ be a function. We say that $\varphi$ is a solution  of the LHDE $(1)$ when $\varphi \in C^n(I)$ and $$\varphi^{(n)}+a_1(t)\varphi^{(n-1)}+a_2(t)\varphi^{(n-2)}+...+a_n(t)\varphi=0 $$
Practical consequences of the fact that eq $(1)$ is linear:
1. if $\varphi$ is a solution of $(1)$ then $\alpha \varphi$ is also a solution, $\forall \alpha \in \mathbb{R}$
	Proof: $\varphi$ is a sol of $(1) \iff \mathcal{L}(\varphi) = 0$. But $\mathcal{L}(\alpha \varphi) = \alpha \mathcal{L}(\varphi) = 0 \Rightarrow \alpha \varphi$ is a solution of $(1)$
2. If $\varphi_1, ..., \varphi_k$ are solutions of $(1)$, then their sum is a solution of $(1)$
	Proof: $\varphi_1, ..., \varphi_k$ solutions $\Rightarrow \mathcal{L}(\varphi_1) = 0, ...\mathcal{L}(\varphi_k) = 0$. But since $\mathcal{L}$ is linear,  $\mathcal{L}(\varphi_1+...+\varphi_n) = \mathcal{L}(\varphi_1)+...+\mathcal{L}(\varphi_n) = 0 \Rightarrow \varphi_1 + ... + \varphi_n$ is a solution of $(1)$  

>[!important] Existence and Uniqueness Theorem 
> Let $t_0 \in I$ and $\eta_1,...,\eta+n \in \mathbb{R}.$ Then the IVP $(\mathcal{L}(x) = 0; x(t_0) = \eta_n; x'(t_0)=\eta_2;...;x^{(n-1)}(t_0)=\eta_n)$ has a **unique solution**. 

#### Remarks
1. $\begin{cases}x''+\cfrac{g}{L}(x)=0 \\ x(0)=0 \\ x'(0) = 0\end{cases}$ is an IVP with a unique solution (due to the existence and uniqueness theorem), and this is $\varphi(t) = 0, \forall t \in \mathbb{R}$
2. $\begin{cases} x''+t^2x=0 \\ x(0) = 0 \\  x'(0) = 0\end{cases}$ is a well formulated IVP, so it has a unique solution. Note that $\phi(t) = 0,\forall t\in \mathbb{R}$ is a solution. 

### The fundamental theorem of LHDEs
>[!important] The fundamental theorem of LHDEs
>$Ker \mathcal{L}$, the set of solutions of $(1)$, is a **linear space of dimension $n$** (the order of the differential equation)

*Proof*: We know that $\mathbb{R}^n$ is a linear space of dimension $n$, so, if finding an *isomorphism* (bijective linear map) between $Ker\mathcal{L}$ and $\mathbb{R}^n$ would be enough.
Let $T : Ker \mathcal{L} \rightarrow \mathbb{R}^n$ and $x \in Ker \mathcal{L} \mapsto^T \begin{pmatrix}x(t_0) \\ x'(t_0) \\ \vdots \\ x^{(n-1)(t_0)} \end{pmatrix}$  . $T$ is bijective $\iff \forall \eta \in \mathbb{R}^n \exists! \varphi \in Ker \mathcal{L}$ s.t.  $T(\varphi) = \eta \iff \forall \eta = \begin{pmatrix} \eta_1 \\ \eta_2 \\ \vdots \\ \eta_n \end{pmatrix} \in \mathbb{R}^n \exists! \varphi \in C^n(I)$ s.t. $\mathcal{L}(\varphi) = 0$ and $\varphi(t_0) = \eta_1, ..., \varphi^{(n-1)}(t_0) = \eta_n \iff \forall \eta, \varphi$ is the unique solution of the IVP and this is true by the existence and uniqueness theorem. Thus, $T$ is bijective 

%%Optional HW - Write the proof that T is linear%%

So, $T : Ker\mathcal{L} \rightarrow \mathbb{R}^n$ is an isomorphism and since $dim(\mathbb{R}^n) = n$, we can deduce that $dim(Ker\mathcal{L}) = n$. 

#### Important consequence
If $x_1, ..., x_n$ are [[Linear independence. Bases]] solutions of the LHDE $(1)$, then its general solution is $$x = c_1x_1+...+c_nx_n$$
## LHDEs with constant coefficients
$$(4): x^{(n)} + a_1x^{(n-1)}+...+a_nx = 0, \text{ where } a_1,...,a_n \in \mathbb{R}$$
*Idea*: Look for solutions of the form $e^{rt}, r \in \mathbb{R}$
$x = e^{rt}, x'= re^{rt},...,x^{(n)} = r^ne^{rt}$
$x = e^{rt}$ verifies $(4) \iff e ^{rt}(r^n+a_1r^{n-1}+...+a_n) = 0, \forall t \in \mathbb{R}$.
>[!tip] 
>$r^n+a_1r^{n-1}+...+a_n = 0$ is called the **characteristic equation** of $4$

### Example: n = 2
$x''+a_1x'+a_2x=0, a_1,a_2 \in \mathbb{R} \Rightarrow x = e^{rt} \iff r^2+a_1r+a_2 = 0$. 
1. Case 1: $r_1, r_2 \in \mathbb{R}, r_1 \neq r_2 \mapsto e^{r_1t} \text{ and } e^{r_2t}$  are solutions of $(5)$ %%since r1 and r2 are different, the solutions are linearly independent%%
	*General solution*: $x = c_1e^{r_1t}+c_2e^{r_2t}$
2. Case 2: $r_{1,2} = \alpha \pm i \beta; \alpha , \beta \in \mathbb{R}, \beta \neq 0$. $e^{rt}, r \in \mathbb{C} \setminus \mathbb{R}$ 