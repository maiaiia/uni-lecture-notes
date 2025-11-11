#  Continuous Random Variables
___
Class: [[Probability & Statistics]]
Type: Lab
Tags: # 
Date: November 11th, 2025
___
## Theory

For $X$ a continuous random variable:

- $\text{cdf}(x) = F_X(x) = P(X \leq x) = \int_{-\infty}^{\infty}f(t)dt = P(X < x)$

>[!Tip]
>The major difference between discrete and continuous random variables is that there's no difference between strict and un-strict inequalities

- $pdf(x) = f(x) = P(a \leq x \leq b) = \int_a^b f(t)dt = cdf(b) - cdf(a)$

>[!Important]
>$$P(X=a) = 0, \forall a$$


MATLAB: \[abbr. if the model] pdf \ cdf (where to compute., param. of the model)


![[LAB - Continuous Random Variables 2025-11-11 14.25.11.excalidraw]]

>[!Definition] The Box-Muller Transformations
>If you have $U_1$ and $U_2$ random variables that are randomly distributed through (0,1) ($U_1, U_2 \in \mathcal{U}(0,1)$) and you create 2 new variables $$z_1 = \sqrt{-2 \ln U_1} \cdot \cos(2 \pi U_2)$$ and $$z_2 = \sqrt{-2 \ln U_1} \cdot \sin(2 \pi U_2)$$, then $z_1, z_2 \in \mathcal{N}(0,1)$

>[!Definition]
>If $Z \in \mathcal{N}(0,1)$, then $X = \sigma \cdot Z + \mu \in \mathcal{N}(\mu, \sigma)$

### Quantiles
We have solved problems following the pattern $P(X < y) = ?$, but not $P(X < ?) = p$. Here, the $?$ denotes the **quantile**. 

>[!Definition]
>$P(X < q_\alpha) = \alpha$. $q_\alpha$ is called **the quantile of order $\alpha$**

We have: 
$P(X < q_\alpha = \alpha)$ We know that the cdf is a *bijective* function. Thus, $q_\alpha = \text{cdf}^{-1}(\alpha) = \text{inv}(\alpha)$

### Exponential model 
$$X \in \mathcal{Exp}(\lambda)$$where $\lambda$ is the frequency of rare events, $\lambda = \cfrac{1}{t}$
## Exercises

 >[!Question] 
 >The average height of NBA professional basketball players is around $1.98$ m, and the standard deviation is $8.8$ cm (= $0.088$ m). Assuming a Normal distribution of heights within this group,
 >
>a) what percent of professional basketball players are taller than $2.1$m? 
>b) what is the probability that the height of a player is exactly $2.1$m?
>c) what proportion of professional basketball players are at least $2.1$m tall?
>d) what percentage of basketball players have heights between $1.9$ and $2.2$m?
>e) estimate by simulations the probabilities above
>f) if your favorite player is within the shortest $20\%$ of players, what can his height be?
>g) if your favorite player is within the tallest $15\%$ of all players, what can his height be?

$X =$ the height of a random player. $X \in \mathcal{N}(\mu, \sigma)$ 
- $\mu$ - average 
- $\sigma$ - standard deviation

a)-d)
```matlab
a = 1 - normcdf(2.1, 1.98, 0.088); %P(X > 2.1)
b = 0; %equality means 0
c = a; %P(x >= 2.1) = P(x > 2.1)
d = normcdf(2.2, 1.98, 0.088) - normcdf(1.9, 1.98, 0.088); %P(1.9 <= X <= 2.2)

```

e)
$N$ = the number of simulations 
```matlab
 % simulation
N = 10000;
s = 0.088;
mu = 1.98;

a_count = 0;
b_count = 0; 
c_count = 0;
d_count = 0;

for i = 1:N
    U = rand(1,2);
    z1 = sqrt(-2 * log(U(1))) * cos(2 * pi * U(2));
    z2 = sqrt(-2 * log(U(1))) * sin(2 * pi * U(2));
    x = s * z1 + mu;
    if (x > 2.1)
        a_count = a_count + 1;
    end
    if (x == 2.1)
        b_count = b_count + 1;
    end 
    if (x >= 2.1)
        c_count = c_count + 1;
    end
    if (1.9 <= x && x <= 2.2)
        d_count = d_count + 1;
    end

end

a_sim = a_count / N
b_sim = b_count / N 
c_sim = c_count / N
d_sim = d_count / N
```

f) $P(X < k) = 20\%$. $k = ?$
g) $P(X \geq k) = 15\% = 1 - P(X < k)$ $\Rightarrow P(x < k) = 1 - 15\% = 85\%$ $\Rightarrow k = \text{inv}(0.85)$

>[!Question]
>The time it takes a printer to print a job is an Exponential random variable with the expectation of 12 seconds.
>a) what is the probability that a document will take more than 30 seconds to be printed?
>b) if you send a job to the printer at 10:00 am and it appears to be third in line, how likely is it that your document will be ready before 10:01?
>c) estimate by simulations the probabilities above

$X = \mathcal{Exp}(\cfrac{1}{12}\text{sec})$


