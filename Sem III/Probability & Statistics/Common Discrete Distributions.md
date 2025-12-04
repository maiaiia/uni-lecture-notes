---
Class: "[[Probability & Statistics]]"
date: October 26th, 2025
type: Lecture
---
# Common Discrete Distributions

| Distribution                            | Notation         | PDF                                                                                                 |
| --------------------------------------- | ---------------- | --------------------------------------------------------------------------------------------------- |
| Bernoulli Distribution                  | $\text{Bern}(p)$ | $X\begin{pmatrix}0 & 1 \\ 1 - p & p\end{pmatrix}$                                                   |
| Discrete Uniform Distribution           | $\text{U}(m)$    | $X\begin{pmatrix}k \\ \cfrac{1}{m} \end{pmatrix}$                                                   |
| Binomial Distribution                   | $\text{B}(n, p)$ | $X\begin{pmatrix}k \\ C_n^kp^kq^{n-k} \end{pmatrix}$                                                |
| Hypergeometric Distribution             | $H(N, n_1, n)$   | $X\begin{pmatrix}k \\ \cfrac{C_{n_1}^kC_{N-n_1}^{n-k}}{C_N^n} \end{pmatrix}_{k \in \overline{0,n}}$ |
| Negative Binomial (Pascal) Distribution | $\text{NB}(n,p)$ | $X\begin{pmatrix}k \\ C_{n+k-1}^kp^nq^k \end{pmatrix}$                                              |
| Geometric Distribution                  | $\text{Geo}(p)$  | $X\begin{pmatrix}k \\ pq^{k-1} \end{pmatrix}_{k = 1,2,...}$                                         |
| Poisson Distribution                    | $P(\lambda)$     | $X\begin{pmatrix}k \\ \cfrac{\lambda^k}{k!}e^{-\lambda} \end{pmatrix}$                              |

## Bernoulli Distribution $\text{Bern}(p)$
A Bernoulli random variable models the occurrence or nonoccurrence of an event

## Discrete Uniform Distribution $\text{U}(m)$
An example of a random variable having a Discrete Uniform distribution with parameter 6 is the number rolled on a die ($\in U(6)$)

## Binomial Distribution $B(n, p)$
This distribution corresponds to the [[Binomial Model]]. Given $n$ Bernoulli trials with probability of success $p$, let $X$ denote the number of successes. Then $X \in B(n, p)$

>[!Remark]
>Notice that the Bernoulli distribution is a particular case of the Binomial one, for $n = 1$

## Hypergeometric Distribution $H(N, n_1, n)$
This distribution corresponds to the [[Hypergeometric Model]], where $X$ is the number of successes.

## Negative Binomial (Pascal) Distribution
This distribution corresponds to the Negative Binomial model. $X$ denotes the number of failures that occurred before the occurrence of the $n^{th}$ success in a Negative Binomial model.

## Geometric Distribution

Particular case of the Negative Binomial, for $n = 1$

## Poisson Distribution 

A Poisson rand