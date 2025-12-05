---
Class: "[[Probability & Statistics]]"
date: 2025-11-03
type: Lecture
aliases:
  - continuous random variable
---
# Continuous Random Variables

Let $(S, \mathcal{K}, P)$ be a probability space.

A random variable $X : S \rightarrow \mathbb{R}$ is a **continuous random variable** if the set of values that it takes, $X(S)$, is any infinite interval in $\mathbb{R}$.

>[!Proposition]
>Let $X$ be a continuous random variable with cdf $F$. Then $F$ is *absolutely continuous*, i.e. $\exists f : \mathbb{R} \rightarrow \mathbb{R}$ s.t. $$F(x) = \int_{-\infty}^{x}f(t)dt$$ $\forall x \in \mathbb{R}$

The function $f$ is called the **probability density function** of $X$.

>[!Theorem]
>Let $X$ be a continuous random variable with cdf $F$ and pdf $f$. Then the following properties hold:
>1. $F'(x)=f(x) \forall x \in \mathbb{R}$
>2. $f(x) \geq 0 \forall x \in \mathbb{R}$
>3. $\int_\mathbb{R} f(t)dt = 1$
>4. $\forall x \in \mathbb{R}, P(X=x)=0$ and $\forall a,b\in \mathbb{R}$ with $a < b$ $$P(a \leq X \leq b) = P(a < X < b) = \int_a^bf(t)dt$$

>[!Remark]
>So, probabilities involving continuous random variables can be computed by integrating the density function over the given sets. Thus, geometrically, probabilities are represented by areas. The *total area* under the graph of a density function is equal to 1.