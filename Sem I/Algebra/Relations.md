# Relations
___
Class: [[ Algebra]]
Type: 
Tags: # 
___

## Def
- A (binary) relation $r$ is a triple $(A, B, R)$, where $A, B$ are sets and $R \subseteq A \times B$
- if $A = B$, the relation is *homogeneous*
- if $X \subseteq A$, $r(X) = \{b \in B | \exists x \in X : \text{x r b}\}$ is called the *relation class of X with respect to r*
	- for a single element $x \in X$, $r<x> = r(\{x\}) = \{b \in B | \text{x r b}\}$ 
- r is a function $\iff \forall a \in A, |r<a>| = 1$
### Examples 
- $o = (A, B, \emptyset)$ - void relation
- $u = (A,B,A \times B)$ - universal relation 
- $\delta_A = (A, A, \Delta_A)$, where $\Delta_A = \{(a,a)|a \in A\}$  - equality relation 
- every directed graph is a relation
- every function is a relation
## Properties of Relations 
- a *homogeneous* relation $r = (A,A,R)$ can be 
	1. *reflexive* if:      $\forall x \in A, x\text{ r } x$
	2. *transitive* if:     $\forall x, y, z \in A$, $x \text{ r } y$ and $y \text{ r } z \Rightarrow x \text{ r } z$
	3. *symmetric* if:   $\forall x, y \in A$, $x \text{ r } y \Rightarrow y \text{ r } x$
- if r has all the aforementioned properties, it is called an **equivalence relation** ^74d7ea
## Quotient Set 
- for an equivalence relation r in A, the relation class $r<x>$ is called the *equivalence class* of x with respect to r, while x is called the *representative* of $r<x>$
- the set $A/r = \{r<x>|x\in A\}$ is called the *quotient set* of A by r
### Equivalence relations and [[partition|partitions]]
1. if $r$ is an equivalence relation, $A/r$ is a partition
2. if $\pi$ is a partition, $r_\pi$ is an equivalence relation, where
	- $r_\pi = (A, A, R), x r_\pi y \iff \exists i\in I: x,y \in A_i$ (x and y are in the same subset of the partition $\pi$)
3. $F:E(A)\rightarrow P(A), F(r) = A/r$ is a bijection 
 ![[partitions & quotient sets]]