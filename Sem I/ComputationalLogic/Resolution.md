# Resolution
___
Class: [[ ComputationalLogic]]
Type: 
Tags: # 
Date: January 7th 2025
___
## Soundness and Completeness Theorem
**Soundness**: If the empty clause is derived from the set $S$ of propositional clauses using the resolution algorithm, then $S$ is an inconsistent set 
**Completeness**: If the set $S$ is inconsistent, then the empty clause can be derived from $S$ using the resolution algorithm
**Soundness and Completeness**: A set $S$ of propositional clauses is inconsistent $\iff$ $S \vdash_{\text{Res}} \square$ 
## Procedure
- have a formula in CNF
- take all cubes
- create new clauses where opposing literals are eliminated
- do this until the empty clause is derived or there are no more iterations possible 

### Davis-Putman Procedure
A set $S$ of propositional clauses can be simplified, preserving its *consistency / inconsistency*, by applying the followind transformations:
1. **Delete the clauses that are tautologies** because they are not useful in the derivation of the empty clause 
2. **Delete the clauses subsumed by other clauses** of $S$ (so if $C_1, C_2, C_3$ are non-empty clauses and $C_1 = C_2 \lor C_3$, then $C_1$ is subsumed by both $C_2$ and $C_3$)
3. **Delete the clauses that contain pure literals**; a pure literal is a literal whose negation does not appear in any clause of $S$ 

## Strategies 
Strategies assure that all the possible clauses to be derived are generated, while attempting to avoid the derivation of redundant and irrelevant clauses in order to obtain the empty clauses
### Level-saturation strategy
- generates levels of resolvents corresponding to the exploration of the whole search space which contains all the possible resolvents
- $S^k := \{Res(C_i,C_j)|C_i\in S^{k-1}, C_j \in S^0 \cup S^1 \cup S^{k-1}\}$ - repeat until $S^k =\emptyset$ or $\square \in S^k$
### Deletion strategy 
- the resolvents that are tautologies or are subsumed by other clauses in the set $S$ of clauses are eliminated and will not be used further in the resolution process because they produce redundant clauses

>[!tip] the level saturation strategy and deletion strategy preserve *completeness*

### Set-of-support strategy

## Refinements

### Lock resolution 
- the literals within each clause are arbitrarily indexed with an integer 
- **Restriction**: The literals resolved upon must have the lowest indices in their clauses
- if the parent clauses have a common literal, in the resolvent this literal will have the *lowest* index from the inherited indices

>[! tip] We must combine lock resolution with the level saturation strategy in order to check all the possible ways of deriving $\square$ 

>[! warning] Combining lock resolution with the deletion or the set-of-support strategy does **not** preserve completeness

### Linear resolution 
![[linear_resolution.png]] 
### Semantic resolution
