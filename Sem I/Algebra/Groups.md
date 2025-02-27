# Groups
___
Class: [[ Algebra]]
Type: 
Tags: # 
___

## Def 
Let $\cdot$ be an operation on A. $(G,\cdot)$ is a:
- *semigroup*, if the [[Operations#^b63bfa|associative law]] holds  ^530f0c
- *monoid* if it is a semigroup with an [[Operations#^34efed|identity element]] ^c4a5fe
- *group* if it is a monoid in which every element has an [[Operations#^f9ca6a|inverse]] ^8b212e

if the operation is also [[Operations#^545de4|commutative]], the structure is called commutative or *abelian*

![[Algebraic_Structures]]
### Example - Klein's group 
| $\cdot$ | e   | a   | b   | c   |
| ------- | --- | --- | --- | --- |
| e       | e   | a   | b   | c   |
| a       | a   | e   | c   | b   |
| b       | b   | c   | e   | a   |
| c       | c   | b   | a   | e   |

## Subgroups 
Let $H \subseteq G, (G , \cdot)$ group. H is a *subgroup* of G if both 
1. $H$ is a stable subset of $(G, \cdot)$ 
2. $(H, \cdot)$ is a group
This is denoted by $H \leq G$
### Characterization theorems 
![[characterizationtheoremsubgroups.png]]
>[!important] remember the first condition (H non-empty)

