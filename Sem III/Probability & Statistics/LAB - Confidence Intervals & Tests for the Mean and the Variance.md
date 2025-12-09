---
Class: "[[Probability & Statistics]]"
date: 2025-12-09
type: Lab
---
# LAB - Confidence Intervals & Tests for the Mean and the Variance

$X$ is a population
$\theta$ (unknown, target parameter) is a characteristic of $X$ (mean, std, variance)

## Confidence intervals

We can analyse just a sample of a population to determine an estimate of the true value of $\theta$. One method of doing so is using **Confidence intervals**.

>[!Definition] Confidence intervals
>$$P(\theta \in (\theta_L, \theta_U)) = 1 - \alpha,$$
>where 
>- $1 - \alpha$ is the *confidence level*
>- $\alpha$ is the *significance level* (error; usually should be at most 5%)
>- $(\theta_L, \theta_U)$ is the ($100(1-\alpha)$) *confidence interval*
>

e.g. $P(\mu \in (160, 180)) = 99\%$

>[!Important]
>Note that confidence intervals for a specific confidence level are **not unique** 
>
>e.g. for the set of values 1 2 3 4 5 and $\alpha = 25\%$, we may choose both (1, 4) and (2,5)

There are multiple types of confidence intervals
- **two tailed** - when both $\theta_L, \theta_U \in \mathbb{R}$
- **left tailed** - when the interval only has a left margin
- **right tailed**

## Hypothesis testing

This is used when we have a set of data and we want to prove how it has changed

>[!Definition]
>The null hypothesis: $$H_0: \theta = \theta_0$$
>The alternative / research hypothesis: $$H_1: \begin{cases} \theta \neq \theta_0 & \text{two-tailed test}\\ \theta > \theta_0 & \text{right-tailed test}\\ \theta < \theta_0 & \text{left-tailed test}\end{cases}$$
>

For a hypothesis test, we must always have a question in mind: **do we reject H0**? 

Note that if the answer to this question is negative, the conclusion is not that $H_0$ holds, but rather that there's not enough data to conclude that it's false.

## Matlab stuff
- \[H, P, CI, ZVAL] = **ztest**($X, \mu_0, \sigma, \alpha$, TAIL)
	- input
		- $X$ - sample vector
		- $\mu_0$ - initial hypothesis
		- $\sigma$ - 
		- $\alpha$ - 
		- TAIL - interval type (two tailed, left tailed, right tailed)
	- output
		- H - 
		- P - 
		- CI - confidence interval
		- ZVAL - 

## Exercises

>[!Question]
> In order to ensure efficient usage of a server, it is necessary to estimate the average number of concurrent users. Those numbers of concurrent users were recorded at 40 randomly selected times (given in the problem statement, i'm not typing all that here);
> Past experience indicates that the number of concurrent users at all times has a standard deviation of $10.5$.
> 
> 1. construct a $99\%$ confidence interval for the expectation of the number of concurrent users
> 2. At the $5\%$ significance level, does this data provide significant evidence that the average number of concurrent users is greater than $70$? What about at $8\%$? Find the rejection region for this test.
> 3. A manager questions the assumptions above. She says that the sample of $40$ numbers of concurrent users has a sample standard deviation of $s = 13.2392$, which is significantly different from the assumed value of $\sigma = 10.5$. Do you agree with the manager? Assuming that the number of concurrent users has a Normal distribution, conduct a suitable test for the standard deviation.


