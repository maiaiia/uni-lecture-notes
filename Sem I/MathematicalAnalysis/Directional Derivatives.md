# Directional Derivatives
___
Class: [[ MathematicalAnalysis]]
Type: 
Tags: # 
Date: January 2nd 2025
___
## Definitions 
### Directional derivatives
Let $f : A \subseteq \mathbb{R}^n \rightarrow \mathbb{R}$ and a vector $v \in \mathbb{R}^n$. The derivative of $f$ in the direction of $v$ at $x \in A$, called the *directional derivative*, is given by $$Df_v := \lim_{h\rightarrow 0}\cfrac{f(x+hv) - f(x)}{h}$$where h is a scalar
 
## Theorems
- If $f$ is differentiable at $x \in A$, then $Df_v(x)=\nabla f(x)\cdot v$
- Let $f : A \subseteq \mathbb{R}^n \rightarrow \mathbb{R}$ be differentiable at $x \in A$. If $x$ is a local extremum, then it is a critical point, i.e. $\nabla f = 0$
- *steepest ascent*: $\nabla f$ / *steepest descent*: $-\nabla f$ 
- The gradient of $x_0$ is perpendicular to the level set defined by $f(x) = f(x_0)$: $Df_v(x_0) = \nabla f(x_0)\cdot v = 0$, where $v$ is tangent to the level set of $x_0$