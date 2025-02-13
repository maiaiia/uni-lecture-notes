# Optimization with Constraints. Lagrange Multipliers
___
Class: [[ MathematicalAnalysis]]
Tags: # 
Date: January 20th 2025
___

## Problem statement
Amongst the points that satisfy a constraint $g$, find those that maximise / minimise a function $f$. That is, find the minimum / maximum of $f$ on the level set $S = \{x | g(x)=c\}$

## Lagrangian function. Lagrange multipliers
If $x_0 \in \mathbb{R}^n$ optimises $f(x)$ and is subject to $g(x_0) = c$, then $x_0$ is a *critical point* of $$L(x, \lambda) = f(x) - \lambda(g(x)-c)$$ where $L$ is called the **Lagrangian function**, meaning that $\exists \lambda \in \mathbb{R}$ s.t. $\nabla f(x_0) = \lambda \nabla g(x_0)$. 
