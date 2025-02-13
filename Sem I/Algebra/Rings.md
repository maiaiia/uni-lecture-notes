# Rings
___
Class: [[ Algebra]]
Type: 
Tags: # 
Teacher: [[]]
___

## Def 
Let $R$ be a set. A structure with two operations $(R, +, \cdot)$ is called a:
- **ring** if $(R, +)$ is an *[[Groups#^8b212e|abelian group]]*, $(R, \cdot)$ is a [[Groups#^530f0c|semigroup]] and the *distributive law* holds
$$x \cdot (y + z) = x \cdot y + x \cdot z, \forall x,y,z \in R$$
$$(y + z) \cdot x = y \cdot x + z \cdot x, \forall x,y,z \in R$$
- **unitary ring** if $(R, +, \cdot)$ is a ring and $(R, \cdot)$ is a [[Groups#^c4a5fe|monoid]] 
- **division ring / skew field** if $(R^*,\cdot)$ is a group
- **field** if it is a *commutative* division ring 
the ring is called commutative if "$\cdot$" is commutative
![[AlgebraicStructures2]]
>[!important] A ring is a division ring $\iff |R| \geq 2$ and $\forall x \in R^*, \exists x^{-1} \in R^*$
>

## Properties (just the interesting stuff)
in a ring:
- $x \cdot 0 = 0 \cdot x = 0$ 
- $x \cdot (-y) = (-x) \cdot y = - x \cdot y$ 
- $x^0 = 1$, $x^{-n} = (x^{-1})^n$

## Subrings. Characterization Theorems

![[subring_characterization_theorem.png]]
![[field_characterization_theorem.png]]

## Ring homomorphisms 
if $f(x+y) = f(x)+f(y)$ and $f(x\cdot y) = f(x)\cdot f(y)$
- $\forall$ ring homomorphisms, $f(0) = 0'$
- if, additionally, $f(1) = 1'$, f is called *unitary*
### Theorem
Let $(R,+,\cdot), (R',+,\cdot)$ be rings with identity elements 1 and 1' respectively and let $f:R\rightarrow R'$ be a ring homomorphism. 
- if f is surjective, then f is unitary
- if f is a ring isomorphism, then f is unitary
- if f is unitary and x has an inverse element, then f(x) has an inverse and $$(f(x))^{-1} = f(x^{-1})$$