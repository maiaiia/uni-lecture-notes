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
then, the functions $e^{r_1t},...,e^{r_nt}$ are solutions of $(4)$. If they are linearly independent, we can write the general solution
Proof - linear independence
Let $k_1,...,k_n$ s.t. $k_1e^{r_1t},...,k_ne^{r_nt}=0, \forall t \in \mathbb{R}$. $\Rightarrow$
$\begin{cases}r_1k_1e^{r_1t}+...+r_nk_ne^{r_nt}=0, \forall t\in \mathbb{R} \\r_1^2k_1e^{r_1t}+...+r_n^2k_ne^{r_nt}=0, \forall t\in \mathbb{R} \\... \\ r_1^nk_1e^{r_1t}+...+r_n^nk_ne^{r_nt}=0, \forall t\in \mathbb{R}\end{cases}$

Now let $t=0 \Rightarrow$
$\begin{cases}r_1k_1+...+r_nk_n=0, \forall t\in \mathbb{R} \\r_1^2k_1+...+r_n^2k_n=0, \forall t\in \mathbb{R} \\... \\ r_1^nk_1+...+r_n^nk_n=0, \forall t\in \mathbb{R}\end{cases}$ 

This is a linear algebraic system of $n$ equations with $n$ unknowns $k_1,...,k_n$. For this system, $k_1,...,k_n=0$ is a solution. 
$\Delta = \begin{vmatrix*} 1 & 1 & ... & 1 \\ r_1 & r_2 & ... & r_n \\ \vdots \\ r_1^{n-1} & r_2^{n-1} & ...& r_n^{n-1} \end{vmatrix*} = (r_n-r_1)(r_n-r_2)...(r_2-r_1) \neq 0$ (all values are distinct) 

## Def
We say that $r_1 \in \mathbb{C}$ is a root of multiplicity $n \in \mathbb{N}^*$ when $\exists Q$ polynomial s.