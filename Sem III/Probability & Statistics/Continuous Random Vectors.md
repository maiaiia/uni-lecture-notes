---
Class: "[[Probability & Statistics]]"
date: 2025-11-03
type:
---
# Continuous Random Vectors

Let $(S, \mathcal{K}, P)$ be a probability space.

A two-dimensional random vector is a function $(X, Y) : S \rightarrow \mathbb{R}^2$ satisfying the condition $$(X \leq x, Y \leq y) = \{e \in S | X(e) \leq x, Y(e) \leq y\} \in \mathcal{K}$$ $\forall (x,y) \in \mathbb{R}^2$.

The function $F : \mathbb{R} \rightarrow \mathbb{R}$ defined by $$F(x,y)=P(X\leq x, Y \leq y)$$ is called the **joint cumulative distribution function** of the vector $(X,Y)$.

>[!Theorem]
>Using the previous definitions, let $F_X, F_Y$ be the cdfs of $X$ and $Y$ respectively. Then,
>	1. If $a_k < b_k, k \in \overline{1,2}$, then $$P(a_1<X\leq b_1, a_2<Y\leq b_2) = F(b_1,b_2) - F(b_1, a_2) - F(a_1, b_2) + F(a_1, a_2)$$
>	2. $F$ is monotonically increasing in each variable
>	3. $F$ is right continuous in each variable
>	4.
>	-  $\lim_{x,y \rightarrow \infty}F(x, y)=1$
>	- $\lim_{y \rightarrow - \infty}F(x, y)= \lim_{x \rightarrow - \infty}F(x, y)=0$
>	- $\lim_{y \rightarrow \infty}F(x, y)=F_X(x)$
>	- $\lim_{x \rightarrow \infty}F(x, y)=F_Y(y)$

A **continuous random vector** is a random vector satisfying the property that the set of values $(X,Y)(S)$ is a continuous subset of $\mathbb{R}^2$

>[!proposition]
>Let $(X, Y)$ be a continuous random vector with joint cdf $F$. Then $F$ is *absolutely continuous*, i.e. $\exists f:\mathbb{R}^2 \rightarrow \mathbb{R}$ s.t. $$F(x,y)=\int_{- \infty}^x \int_{- \infty}^y f(u,v)du dv$$ $\forall x,y \in \mathbb{R}$
>
>If $(X, Y)$ is a continuous random vector, then the function $f$ is called the **joint probability density function (joint pdf)** of $(X, Y)$.

>[!Theorem]
>Let $(X,Y)$ be a continuous random vector with joint cdf $F$ and joint pdf $f$. Let $F_X, F_Y$ be the cdfs of $X$ and $Y$ and $f_X, f_Y$ the pdfs of $X, Y$. Then
>1. $\cfrac{\partial^2F(x,y)}{\partial x \partial y} = f(x,y), \forall (x,y) \in \mathbb{R}^2$
>2. $f(x,y) \geq 0, \forall (x,y)\in \mathbb{R}^2$
>3. $\int\int_{\mathbb{R}^2}f(x,y)dxdy=1$
>4. For any domain $D \subseteq \mathbb{R}^2, P((X, Y) \in D) = \int \int _{D} f(x,y)dxdy$
>5. $f_X(x) = \int_\mathbb{R} f(x,y) dy, \forall x \in \mathbb{R}$ and $f_Y(y) = \int_\mathbb{R} f(x,y) dx, \forall y \in \mathbb{R}$

>[!Remark]
>When obtained from the joint pdf of the vector $(X, Y)$, the pdf's $f_X, f_Y$ are called *marginal* densities

Two continuous random variables $X$ and $Y$ are **independent** $\iff$ $$f_{(X,Y)}(x,y)=f_X(x)f_Y(y)$$ $\forall (x,y) \in \mathbb{R}^2$


## Functions of Continuous Random Variables

>[!Proposition]
>Let $g : \mathbb{R} \rightarrow \mathbb{R}$ be a *strictly monotone* and *differentiable* function, with $g'(x) \neq 0, \forall x$. Let $X$ be a continuous random variable with pdf $f_X$ and let $Y = g(x)$. Then, for $y \in \mathbb{R}$, the pdf of $Y$ is given by $$f_Y(y) = \begin{cases} \cfrac{f_X(g^{-1}(y))}{|g'(g^{-1}(y))|}, & y \in g(\mathbb{R}) \\ 0, & y \notin g(\mathbb{R}) \end{cases}$$


