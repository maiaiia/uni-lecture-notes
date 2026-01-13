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

```matlab
A = [85, 92, 97, 65, 75, 96];
B = [81, 79, 76, 84, 83, 77, 78, 82];

[H, P, CI, STATS] = vartest2(A, B, 'Alpha', 0.05, 'Tail','both')


fprintf("======= TEST 1 =======\n")
if H == 1
    fprintf("We reject the original hypothesis.\nThe variances are different.\n")
else
    fprintf("We do not reject H0.\nThe variances are equal.\n")
end

% but how can we do hypothesis testing if our software doesn't do it 
% automatically? (like MATLAB does via H)

fprintf("======= TEST 2 =======\n")
if 0.05 >= P % alpha >= P
    fprintf("We reject the original hypothesis.\nThe variances are different.\n")
else
    fprintf("We do not reject H0.\nThe variances are equal.\n")
end

fprintf("======= TEST 3 =======\n")
t1 = finv(0.05/2, STATS.df1, STATS.df2);
t2 = finv(1 - (0.05/2), STATS.df1, STATS.df2); %find the quartiles 

% the rejection region is (-inf, t1) U (t2, inf)
% check if STATS.fstat is in that region. if it is, we reject the
% hypothesis

if STATS.fstat <= t1 | STATS.fstat >= t2 
    fprintf("We reject the original hypothesis.\nThe variances are different.\n")
else
    fprintf("We do not reject H0.\nThe variances are equal.\n")
end

% we can return to the first hypothesis, 
% now that we know that the variances are not equal
fprintf("======= TEST 1 =======\n")
[H, P, CI, STATS2] = ttest2(A, B, 'alpha', 0.05, 'tail', 'right', 'vartype', 'unequal');
if H == 1 
	fprintf("We reject H0.\nPlayer A's claim is correct.\n")
else
    fprintf("We do not reject H0.\nPlayer A's claim is wrong.\n")
end

fprintf("======= TEST 2 =======\n")
if 0.05 >= P
	fprintf("We reject H0.\nPlayer A's claim is correct.\n")
else
    fprintf("We do not reject H0.\nPlayer A's claim is wrong.\n")
end

t_alpha = tinv(1 - 0.05, STATS2.df);

fprintf("======= TEST 3 =======\n")
if STATS2.tstat >= t_alpha
	fprintf("We reject H0.\nPlayer A's claim is correct.\n")
else
    fprintf("We do not reject H0.\nPlayer A's claim is wrong.\n")
end

fprintf("\n********** PART B **********\n")
[H, P, CI, STATS] = vartest2(A, B, 'alpha', 0.05, 'Tail', 'right');
fprintf("======= TEST 1 =======\n")
if H == 1 
	fprintf("We reject H0.\nPlayer B's claim is correct.\n")
else
    fprintf("We do not reject H0.\nPlayer B's claim is wrong.\n")
end

fprintf("======= TEST 2 =======\n")
if 0.05 >= P 
	fprintf("We reject H0.\nPlayer B's claim is correct.\n")
else
    fprintf("We do not reject H0.\nPlayer B's claim is wrong.\n")
end

fprintf("======= TEST 3 =======\n")
t1 = finv(0.05/2, STATS.df1, STATS.df2);
t2 = finv(1 - (0.05/2), STATS.df1, STATS.df2); 

if STATS.fstat <= t1 | STATS.fstat >= t2 
    fprintf("We reject the original hypothesis.\nThe variances are different.\n")
else
    fprintf("We do not reject H0.\nThe variances are equal.\n")
end

% CI from ttest2 and vartype is unequal

[H, P, CI, STATS] = ttest2(A, B, 'alpha', 0.1, 'tail', 'both', 'vartype', 'unequal');

fprintf("CI: [%f, %f]\n", CI(1), CI(2))

[H, P, CI, STATS] = vartest2(A, B, 'alpha', 0.08, 'tail', 'both');
fprintf("CI: [%f, %f]\n", sqrt(CI(1)), sqrt(CI(2)))
```