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
- Let $A$ and $B$ be independent. Then, $A$ and $\bar{B}$ are independen


Binomial Model:

This model is used when the trials of an experiment sarisfy three conditions:
1. they are independent
2. each trial has only two possible outcomes, which we refer to as "success" ($A$) and "failure" ($\bar{A}$)
3. the probability of success $p = P(A)$ is the same for each trial (we denote by $q = 1-p = P(\bar{A})$) the probability of failure

>[!Tip]
>The probability $P(n;k)$ is the coefficient of $x^k$ in the Binomial expansion, hence the name of the model


