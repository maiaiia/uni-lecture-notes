# Formulas
___
Class: [[Probability & Statistics]]
Type: Cheat Sheet
Date: October 7th, 2025
___

$A\cup (B \cap C) = (A \cup B) \cap (A \cup C)$ 
## Lecture 2
- $P(A | B) = \cfrac{P(A \cap B)}{P(B)}$
- $P(A | B) = 1 - P(\bar{A}|B)$ 
- $P(B) = P(A)P(B|A)+P(\bar{A})P(B|\bar{A})$  
	- if the probability of an event under certain conditions is given, then the probability of said event can be computed if said conditions form a partition of the sample space

- Total Probability Rule: $P(A) = \sum_{i\in I} P(A_i)P(A | A_i)$  
- The events $\{A_n\}_{n\in \mathbb{N}}$ are said to be (**mutually**) **independent** if $P(A_{i_1}\cap ... \cap A_{i_k})=P(A_{i_1}...P(A_{i_k})$, $\forall$ finite subset $\{i_1...i_n\}$
- Let $A$ and $B$ be independent. Then, $A$ and $\bar{B}$ are independent


## Formulas
## Models

>[!Definition] Bernoulli trials
>A trial is called a Bernoulli trial if it satisfies the following condition
>- it's independent of other trials
>- it has 2 possible outcomes only (called *success* and *failure*)
>- the probability of success is the same for each trial

### Binomial model
#### use for 
Bernoulli trials

#### model
Given $n$ Bernoulli trials with probability of success $p$, find the probability $P(n;k)$ of exactly $k$ successes occurring.
#### formula
$$P(n;k) = C_n^kp^kq^{n-k}$$ which is the coefficient of $x^k$ in the binomial expansion $$(px+q)^n = \sum_{k=0}^nP(n;k)x^k$$
### Hypergeometric model
#### use for
Binomial model without replacement.
#### model
There are $N$ objects, $n_1$ of which have a certain trait. A number of $n$ objects are selected, one at a time, **without replacement**. Find the probability $P(n;k)$ of exactly $k$ of the $n$ objects selected, having that trait.
#### formula
$$P(n, k) = \cfrac{C_{n_1}^k\cdot C_{N-n_1}^{n-k}}{C_N^n}$$
### Poisson model
#### use for
Generalisation of the hypergeometric model, when the probability of success can vary. Won't appear on the final exam.
#### formula
The number $P(n;k)$ is the coefficient of $x^k$ in the polynomial expansion $$(p_1x+q_1)...(p_nx+q_n)=\sum_{k=0}^nP(n;k)x^k$$
### Pascal (negative binomial) model
#### use for
When both the number of successes and failures AND the order of occurrence are of interest.
#### model
Consider an infinite sequence of Bernoulli trials with probability of success $p$ (and failure $q = 1-p$) in each trial. Find the probability $P(n;k)$ of the $n$th success occurring after $k$ failures.
#### formula
$$P(n;k)=C_{n+k-1}^k p^n q^k$$ which is the coefficient of $x^k$ in the expansion $$\Big(\cfrac{p}{1-qx} \Big)^n$$
#### what I noticed
the pascal model can easily be derived from the binomial model. just break the problem down into 2 subproblems:
1. the probability of $n-1$ successes and $k$ failures occurring (in $n+k-1$ trials, obviously)
	- computed using the binomial model
	- probability is $C_{n+k-1}p^{n-1}q^k$
2. the probability of a success occurring after that
	- probability: $p$
since the order of occurrence for the first $n-1$ successes and $k$ failures is of no interest.
### Geometric model

#### use for
A particular case of the Pascal Model ($n = 1$)

#### model
Consider an infinite sequence of Bernoulli trials with probability of success $p$ in each trial. Find the probability $p_k$ that the first success occurs after $k$ failures.

#### formula
$$P(k)=pq^k$$