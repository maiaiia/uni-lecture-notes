---
Class: "[[Probability & Statistics]]"
date: 2025-11-03
type:
---
# Common Continuous Distributions

| Distribution                  | Notation              | PDF                                                                                    | CDF                                                                                                 |
| ----------------------------- | --------------------- | -------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------- |
| Uniform Distribution          | $U(a,b)$              | $f(x)= \begin{cases}\cfrac{1}{b - 1}, & x \in [a,b] \\ 0, & x \notin [a,b]\end{cases}$ | $F(x) = \begin{cases}0, & x \leq a \\ \cfrac{x-a}{b-a}, & a < x \leq b \\ 1, & x \geq b\end{cases}$ |
| Standard Uniform Distribution | $U(0,1)$              | $f(x)= \begin{cases}1, & x \in [0,1] \\ 0, & x \notin [0,1]\end{cases}$                | $F(x) = \begin{cases}0, & x \leq 0 \\ x, & 0 < x \leq 1 \\ 1, & x \geq 1\end{cases}$                |
| Normal Distribution           | $N(\mu, \sigma)$      | $f(x) = \cfrac{1}{\sigma\sqrt{2\pi}}e^{-\cfrac{(x-\mu)^2}{2\sigma^2}},x\in\mathbb{R}$  | $F(x) = \cfrac{1}{\sqrt{2\pi}}\int_{-\infty}^{\cfrac{x-\mu}{\sigma}}e^{-\cfrac{t^2}{2}}dt$          |
| Standard Normal Distribution  | $Z = N(0,1)$          | $f_Z(x) = \cfrac{1}{\sqrt{2\pi}}e^\cfrac{-x^2}{2},x\in\mathbb{R}$                      | $F_Z(x) = \cfrac{1}{\sqrt{2\pi}}\int_{-\infty}^x e^{-\cfrac{t^2}{2}}dt$                             |
| Exponential Distribution      | $\text{Exp}(\lambda)$ | $f(x) = \begin{cases}\lambda e^{-\lambda x}, & x \geq 0 \\ 0, & x < 0\end{cases}$      | $F(x) = \begin{cases}1 - e^{-\lambda x}, & x \geq 0 \\ 0, & x < 0\end{cases}$                       |
| Gamma Distribution            | $Gamma(a,b)$          |                                                                                        |                                                                                                     |
## Uniform Distribution
The uniform distribution is used when a variable can take *any* value in a given interval, equally probable.

A special case is that of a **Standard Uniform Distribution**, where $a = 0$ and $b = 1$. Standard Uniform variables play an important rol in stochastic[^1] modeling; in fact, *any* random variable, with any thinkable distribution (discrete or continuous) can be generated from Standard Uniform variables.

### Graphs

![[normal_distribution_graphs]]

[^1]: having a random probability distribution or pattern that may be analysed statistically but may not be predicted precisely
## Normal Distribution
By far the most important distribution, underlying many of the modern statistical methods used in data analysis. It is also referred to as the *Gaussian* distribution.

The graph of the Normal density is a symmetric, bell shaped curve centered at the value of the first parameter $\mu$.

There is an important particular case of a Normal distribution, namely $N(0,1)$, called the **Standard Normal Distribution** (or Reduced Normal Distribution). A variable having a Standard Normal distribution is usually denoted by $Z$. The function $F_Z$ is known as *Laplace's function* (or the *error function*) and its values can be found in tables or can be computed by most mathematical software.

>[!Info]
>$$F_X(x) = F_Z\big{(}\cfrac{x - \mu}{\sigma}\big{)}$$

### Graphs
![[bellcurve-pdf]]
## Exponential Distribution
Often used to model time. In a sequence of *rare events* (where the number of rare events has a Poisson distribution), the time between two consecutive rare events is Exponential. The parameter $\lambda$ represents the frequency of rare events, measured in $\text{time}^{-1}$ units.

The exponential distribution is a *special case* of a more general distribution, namely the $\text{Gamma}(a, b)$ distribution, which models the *total* time of a multistage scheme. If $\alpha \in \mathbb{N}$, then the sum of $\alpha$ independent $\text{Exp}(\lambda)$ variables has a $\text{Gamma}(\alpha, \cfrac{1}{\lambda})$ distribution.

>[!Warning]
>In MATLAB, the parameter $\mu$ is actually $\cfrac{1}{\lambda}$.

### Graphs
![[exponential_distribution]]