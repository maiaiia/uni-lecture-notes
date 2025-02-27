# Sequences. Limits
___
Class: [[ MathematicalAnalysis]]
Type: 
Tags: # 
___

## Def
- A sequence $(x_n)$ has a limit $l \in \overline{\mathbb{R}}$ if $\forall V \in \mathcal{V}(l), \exists N_V \in \mathbb{N} : x_n \in V, \forall n \geq N_v$
- If $l \in \mathbb{R},$ the condition above is $\Leftrightarrow \forall \epsilon > 0, \exists N_{\epsilon}\in \mathbb{N}:|x_n-l|<\epsilon, \forall n \geq N_\epsilon$ 
- The set of *limit points* of a sequence $(x_n)$ is $$LIM(x_n) := {x \in \mathbb{R}|\exists(x_{n_k}):x_{n_k} \rightarrow x}$$ and $$lim_{n\rightarrow \infty}inf(x_n) := inf(LIM(x_n))$$$$lim_{n\rightarrow \infty}sup(x_n) := sup(LIM(x_n))$$
- **Cauchy sequence**: A sequence is called *Cauchy* (or *fundamental*) if $$\forall \epsilon > 0, \exists N_\epsilon: |x_m-x_n| < \epsilon, \forall m,n \geq N_\epsilon$$
## Theorems 
- $x_n \rightarrow l \Leftrightarrow lim_{n\rightarrow \infty}|x_n-l|=0$ 
- Any convergent sequence is bounded (*p*%%pick a random $\epsilon$  and use the definition%%)
- **Weierstrass**: Any monotone and bounded sequence is convergent (*p*%%for increasing, use supS-eps<x%%)
- Any monotone sequence has a limit in $\overline{\mathbb{R}}$ (*p*)
- **Squeeze / Sandwich Theorem**: Let $(x_n),(y_n),(z_n)$ be sequences s.t. $\exists n_0 \in \mathbb{N}:x_n\leq y_n \leq z_n, \forall n>n_0$ and $lim_{n\rightarrow \infty}x_n=lim_{n\rightarrow \infty}z_n = \alpha$. then, $lim_{n\rightarrow \infty}y_n= \alpha$ (*p*)
- **Cantor's nested intervals**: Let $(a_n)$ be increasing and $(b_n)$ decreasing such that $$
a_n \leq a_{n+1} \leq b_{n+1} \leq b_n, \quad \forall n \in \mathbb{N}.$$Consider the closed intervals $I_n := [a_n, b_n]$, with $I_{n+1} \subseteq I_n$. If $$
\lim_{n \to \infty} (b_n - a_n) = 0,$$then there exists $x \in \mathbb{R}$ such that (*p*)$$
\bigcap_{n=1}^\infty I_n = \{x\}.$$
- **Bolzano-Weierstrass**: Any bounded sequence has a convergent subsequence (*p*)
- $lim_{n\rightarrow \infty}x_n = l \Leftrightarrow inf(LIM(x_n)) = sup(LIM(x_n))= l$
- Any Cauchy sequence is bounded (*p*)
- A sequence is convergent $\iff$ it is Cauchy (*p*%%review later!!(i really don't feel like studying it rn)%%)
