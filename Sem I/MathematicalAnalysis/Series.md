# Series
___
Class: [[ MathematicalAnalysis]]
Type: 
Tags: # 
Teacher: [[]]
___

## Def  
- For a sequence $(x_n),$ the sum $\sum_{n=1}^\infty x_n$ is called a *series* and $s_n = \sum_{k=1}^n x_k$ is the called the *partial sum of the series*
- A series converges if its associated sequence of partial sums converges

## Theorems 
- If the series  $\sum_{n=1}^\infty x_n$ converges, then $lim_{n\rightarrow \infty}x_n = 0$. Thus, if the limit is not 0, the series diverges
- **Comparison Test 1**: Let $\sum_{n=1}^\infty x_n, \sum_{n=1}^\infty y_n$ be series with *nonnegative* terms. If $\exists n_0 \in \mathbb{N}:x_n \leq y_n, \forall n \geq n_0$: 
	- if $\sum_{n=1}^\infty y_n$ converges, $\sum_{n=1}^\infty x_n$ converges
	- if $\sum_{n=1}^\infty x_n$ diverges, $\sum_{n=1}^\infty y_n$ diverges (*p*)
- **Comparison Test 2** Let $\sum_{n=1}^\infty x_n, \sum_{n=1}^\infty y_n$ be series with *nonnegative* terms and $lim_{n\rightarrow \infty}\cfrac{x_n}{y_n} = l$.
	- if $l \in (0,\infty),$ then $\sum_{n=1}^\infty x_n, \sum_{n=1}^\infty y_n$ have the same nature
	- if $l = 0$, then if the series $\sum_{n=1}^\infty y_n$ converges, then $\sum_{n=1}^\infty x_n$ also converges
	- if $l = \infty$, then if the series $\sum_{n=1}^\infty y_n$ diverges, then $\sum_{n=1}^\infty x_n$ also diverges
- **Ratio Test**: Let $\sum_{n=1}^\infty x_n$ be a series with *nonnegative* terms s.t. $lim_{n\rightarrow \infty}\cfrac{x_{n+1}}{x_n} = l$ (*p*)
	- if $l < 1$, the series is convergent 
	- if $l > 1$, the series is divergent 
- **Root Test**: Let $\sum_{n=1}^\infty x_n$ be a series with *nonnegative* terms s.t. $lim_{n\rightarrow \infty}\sqrt[n]{x_n} = l$ (*p*)
	- if $l < 1$, the series is convergent 
	- if $l > 1$, the series is divergent 
- **Cauchy condensation test**: Let $\sum_{n=1}^\infty x_n$ be a series with *decreasing, nonnegative* terms. The series $\sum_{n=1}^\infty x_n, \sum_{n=1}^\infty 2^n x_{2^n}$ have the same nature (*p*)
>[!important] The series $\sum_{n=1}^\infty \cfrac{1}{n^p}$ converges $\iff p > 1$
- **Kummer's test** (optional proof): Let $(x_n),(c_n)$ be *positive* sequences and $lim_{n\rightarrow \infty}(c_n\cfrac{x_n}{x_{n+1}}-c_{n+1}) = l$
	- if $l > 0$, $\sum_{n=1}^\infty x_n$ is convergent 
	- if $l < 0$ and $\sum_{n=1}^\infty c_n = \infty$, then $\sum_{n=1}^\infty x_n$ is divergent
- **Raabe-Duhamel**: Let $\sum_{n=1}^\infty x_n$ be a series with *positive* terms and $lim_{n\rightarrow \infty}n(\cfrac{x_n}{x_{n+1}}-1) = R$ (*p* - $c_n = n$ in Kummer's test)
	- if $R > 1$, the series is convergent 
	- if $R < 1$, the series is divergent