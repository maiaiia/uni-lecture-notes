---
Class: "[[Probability & Statistics]]"
date: 2026-01-13
type: Lab
---
# Confidence Intervals and Tests for the Difference of Means and Ratio of Variances

## Theory

ttest2 compares the means: $\mu_1 - \mu_2 > 0$ or $< 0$ or $\neq 0$ 
vartest2 compares the variances: $\cfrac{\sigma_1^2}{\sigma_2^2}$ (compare with 1: $> 1$, $< 1$, $\neq 1$)

>[!Important] 
>In order to use the ttest2 command, we need to check if the variances are equal

\[H, P, CI, STATS] = vartest2(A, B, $\alpha$, tail)
\[H, P, CI, STATS] = ttest2(A, B, 'alpha', $\alpha$, 'tail', (left / right / both), 'vartype', (equal / unequal))
- STATS: 
	- tstat: observed value of the stat.test
	- df
	- sd - an estimation of the standard deviation
## Exercises
player A's claim: $\mu_A > \mu_B$
player B's claim: $\sigma_A^2 > \sigma_B^2$
Presume the players' scores are independent and Normally distributed 

Player A: 85 92 97 65 75 96 (n1 = 6) %%length%%
Player B: 81 79 76 84 77 78 82 (n2 = 8)


 %%Note that the scores here are just samples - this is not the entire population; had it been the entire population, we could have simply checked if their claims are correct. we need to resort to hypothesis testing instead%% 

>[!Remember]
>The old hypothesis must always contain the equality 

For the first claim:
$H_0: \mu_A \leq \mu_B$, 
$H_1: \mu_A > \mu_B$

This is equivalent in theory to 
$H_0: \mu_A - \mu_B \leq 0$, 
$H_1: \mu_A - \mu_B > 0$

$H_0$ is player A's claim 

We now need to check the variances (check if $\sigma_A^2 = \sigma_B^2$)

$H_0: \sigma_A^2 = \sigma_B^2$
$H_1: \sigma_A^2 \neq \sigma_B^2$ 
(two-tailed test --> uses vartest2)


----
part B

$H_0: \sigma_A^2 \leq \sigma_B^2$
$H_1: \sigma_A^2 > \sigma_B^2$

