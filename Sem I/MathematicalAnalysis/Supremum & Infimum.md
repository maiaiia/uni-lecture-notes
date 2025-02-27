# Supremum. Infimum
___
Class: [[ MathematicalAnalysis]]
Type: 
Tags: # 
___

## Upper & Lower Bounds 
$x$ is an *upper bound* for set $A$ if $x \leq a, \forall a \in A$
- $lb(A) := \{x \in \mathbb{R} | x \leq a, \forall a \in A\}$ 
- if $lb(A) \neq \emptyset , A$ is *bounded from below* 
- the *minimum* of $A$ (if it exists) is $lb(A)\cap A$

$x$ is a *lower bound* for set $A$ if $x \geq a, \forall a \in A$
- $ub(A) := \{x \in \mathbb{R} | x \geq a, \forall a \in A\}$ 
- if $ub(A) \neq \emptyset , A$ is *bounded from above* 
- the *maximum* of $A$ (if it exists) is $ub(A)\cap A$

## Supremum & Infimum 
$x \in \mathbb{R}$ is the *supremum* of $A, x := sup(A) \iff$
- $x \in ub(A)$
- $x \leq u, \forall u \in ub(A)$
- ($sup(x) := min(ub(A))$) 
$\forall \epsilon > 0, \exists x \in A: sup(A)-\epsilon < x$

$x \in \mathbb{R}$ is the *infimum* of $A, x := inf(A) \iff$
- $x \in lb(A)$
- $x \geq l, \forall l \in lb(A)$
- ($inf(x) := max(lb(A))$) 
$\forall \epsilon > 0, \exists x \in A: x<inf(A)+\epsilon$

>[!tip] $sup(\emptyset) = -\infty; inf(\emptyset) = \infty$

### Completeness Axiom
- Every set that is bounded from above has a supremum
- Every set that is bounded from below has an infimum

### Theorems 
- Let $A \subseteq B \subseteq \mathbb{R}$ be a nonempty bounded sets. Then $$inf(B) \leq inf(A) \leq sup(A) \leq sup(B)$$ $$sup(A \cup B) = max\{sup(A),sup(B)\}$$ $$inf(A\cup B) = min\{inf(A),inf(B)\}$$

