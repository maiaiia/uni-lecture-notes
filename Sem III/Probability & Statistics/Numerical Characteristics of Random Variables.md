---
Class: "[[Probability & Statistics]]"
date: 2025-12-05
type: Lecture
---
# Numerical Characteristics of Random Variables

## Expectation

- If $X\begin{pmatrix}x_i \\ p_i\end{pmatrix}$ is a [[Discrete Random Variables|discrete random variable]], then the **expectation** (**expected value**, **mean value**) of $X$ is the real number $$E(X) = \sum_{i \in I}x_iP(X = x_i) = \sum_{i\in I}x_ip_i$$
- If $X$ is a [[Continuous Random Variables|continuous random variable]], then its expectation is the real number $$E(X) = \int_{\mathbb{R}}xf(x)dx$$
The expected value can be thought of as a *long term average value*. It can also be interpreted as a point of equilibrium, a center of gravity.

>[!Tip]
>Notice how the first formula is actually a weighted mean

>[!Remark]
>For a Normal variable $X \in N(\mu, \sigma)$, the expected value is $E(X) = \mu$
### Properties
- $E(aX + b) = aE(X) + b$
- $E(\sum X_i) = \sum E(X_i)$
- if $X_1,...,X_n$ are independent, then $E(\prod X_i)=\prod E(X_i)$
- if $X \leq Y$ i.e. $X(e) \leq Y(e) \forall e \in S$, then $E(X) \leq E(Y)$

## Variance and Standard Deviation

## Median

## Moments

