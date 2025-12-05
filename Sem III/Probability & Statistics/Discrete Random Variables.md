---
Class: "[[Probability & Statistics]]"
date: 2025-10-26
type: Lecture
aliases:
  - discrete random variable
---
# Discrete Random Variables

Let $(S, \mathcal{K}, P)$ be a probability space.

A **random variable** is a function $X : S \rightarrow \mathbb{R}$ satisfying the property that $\forall x \in \mathbb{R}$, the event $$(X < x) := \{e\in S | X(e) \leq x \} \in \mathcal{K}$$
A random variable $X$ is a **discrete random variable** if the set of values that it takes, $X(S)$, is at most countable (i.e. finite or countably infinite) in $\mathbb{R}$.

>[!Remark]
>A discrete random variable that takes only a finite set of values is called a **simple discrete random variable**. 

## Probability Distribution Function
Let $X : S \rightarrow \mathbb{R}$ be a discrete random variable. The **probability distribution function** (pdf), or **probability mass function** (pmf) of $X$ is an array of the form $$X\begin{pmatrix}x_i \\ p_i\end{pmatrix}$$ where $x_i \in \mathbb{R}, i \in I$, are the values that $X$ takes and $p_i = P(X = x_i)$ are the probabilities that $X$ takes each value $x_i$.

>[!Remark]
>1. All values $x_i$ are distinct.
>2. All probabilities $p_i \neq 0$
>3. If $X$ is a discrete random variable, then $\sum_{i\in I} p_i = 1$

## Cumulative Distribution Function
Let $X : S \rightarrow \mathbb{R}$ be a random variable (of *any* type). The function $F = F_X : \mathbb{R} \rightarrow \mathbb{R}$, defined by $$F_X(x) = P(X \leq x)$$ is called the **cumulative distribution function** (cdf) of $X$.

>[!Remark]
>For a discrete random variable with pdf $X\begin{pmatrix}x_i \\ p_i\end{pmatrix}$, the cdf is computed by $$F_X(x) = \sum_{x_i\leq x}p_i$$

>[!Theorem]
>Let $X$ be a random variable with cdf $F : \mathbb{R} \rightarrow \mathbb{R}$. Then $F$ has the following properties:
>1. If $a < b$ are real numbers, then $P(a < X \leq b) = F(b) - F(a)$
>2. $F$ is monotonely increasing
>3. $F$ is right continuous, i.e. $F(x+0)=F(x), \forall x \in \mathbb{R}$
>4. $\lim_{x\rightarrow - \infty}F(x) = 0$ and $\lim_{x\rightarrow \infty}F(x) = 1$
>5. $\forall x \in \mathbb{R}, P(X < x) = F(x - 0)$ and $P(X = x) = F(x) - F(x - 0)$

