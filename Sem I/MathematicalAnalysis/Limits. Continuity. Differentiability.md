# Limits. Continuity. Differentiability
___
Class: [[ MathematicalAnalysis]]
Type: 
Tags: # 
Teacher: [[]]
___

## Def 
- $A' = \{x_{0} \in \mathbb{R}|\forall V \in \mathcal{V}(x), V \cap (A \setminus x_0\}) \neq \emptyset\}$ is the *set of accumulation (cluster) points* of $A$
- $A \setminus A'$ is the set of isolated points of $A$
- $cl(A) = A'\cup$ {isolated points}

## Theorems 
- $x_{0}\in A' \iff \exists (x_n) \in A \setminus \{x_0\}: lim_{n\rightarrow \infty}x_n=x_0$ (*p*)
- **Weierstrass**: Let $f : [a,b]\rightarrow \mathbb{R}$ be continuous. Then $f$ is bounded and it attains its bounds (*p*)
- **Intermediate Value Property**: Let $f : [a,b]\rightarrow \mathbb{R}$ be continuous. Then $\forall y \in (f(a),f(b)),\exists c\in(a,b):f(c)=y$ 
- **Fermat**: Let $f:(a,b) \rightarrow \mathbb{R}$ be continuous. If $x_0$ is a local extremum, and $f$ is differentiable at $x_0$, then $f'(x_0) = 0$ 
- **Rolle**: If $f$ is continuous on $[a,b]$ and differentiable on $(a,b)$, and $f(a) = f(b)$, then $\exists c \in (a,b):f'(c) = 0$ (*p*)
- **Mean Value Theorem**: Let $f:(a,b)\rightarrow \mathbb{R}$ be continuous on $[a,b]$ and differentiable on $(a,b)$. Then $\exists c\in(a,b):$$$f'(c)=\cfrac{f(b)-f(a)}{b-a}$$(*p*)
- **Monotony** - proof! 