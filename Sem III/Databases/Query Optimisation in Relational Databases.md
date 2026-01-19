---
Class: "[[Databases]]"
date:
type: Lecture
---
# Query Optimisation in Relational Databases

Once it receives an SQL statement, the SQL server will
1. analyse it (syntactically)
2. translate it into an internal form (relational algebra expression)
3. transform the internal form into an optimal form
4. generate a procedural execution plan
5. evaluate the procedural plan 
6. send the result to the client

This lecture is concerned with steps 3 and 4 (and maybe 5); step 2 was covered here: [[Relational Algebra]].

## Internal Form Optimisation

Rules:
1. $\sigma_C(\pi_\alpha(R)) = \pi_\alpha(\sigma_C(R))$
	- selection reduces the number of records for projection; 
	- in the second expression, the projection operator analyses fewer records
2. $\sigma_{C_1}(\sigma_{C_2}(R)) = \sigma_{C_1\text{ AND } C_2}(R)$
	- perform one pass instead of 2
3. $\sigma_C(R \times S) = R \otimes_C S$
	- replace cross-product and selection by condition join (a number of condition join algorithms don't evaluate the cross product)
	- this can sometimes be further improved:
		1. $C$ contains only attributes from $R$: 
			- $\sigma_C(R \times S) = \sigma_C(R) \times S$
		2. $C = C_1 \text{ AND } C_2$, $C1$ contains only attributes from $R$, $C2$ only attributes from $S$:
			- $\sigma_{C_1 \text{ AND } C_2}(R \times S) = \sigma_{C_1}(R) \times \sigma_{C_2}(S)$ 
		3. $C = C_1 \text{ AND } C_2$, $C2$ is a join condition between $R$ and $S$:
			- $\sigma_{C_1 \text{ AND } C_2}(R \times S) = \sigma_{C_1}(R \otimes_{C_2}S)$ 
4. $\sigma_C(R \cup S) = \sigma_C(R) \cup \sigma_C(S)$
5. $\sigma_C(R \cap S) = \sigma_C(R) \cap \sigma_C(S)$
6. $\sigma_C(R - S) = \sigma_C(R) - \sigma_C(S)$
	- again, fewer records to analyse by the $\cup, \cap, -$ operators
7. $\pi_\alpha(R \cup S) = \pi_\alpha{R} \cup \pi_\alpha(S)$
8. $\pi_\alpha(R \otimes S) = \pi_\alpha(\pi_{\alpha_1}(R) \otimes \pi_{\alpha_2}(S))$, where
	- $\alpha_1$: attributes in $R$ that appear in $\alpha$ or $C$
	- $\alpha_2$: attributes in $S$ that appear in $\alpha$ or $C$


## Misc?
1. convert cross products into joins
	- a join can be defined as a cross-product followed by a selection
	- joins arise more often in practice than cross-products
	- in general, the result of a cross-product is much larger than the result of a join
	- it's important to *implement the join without materialising the underlying cross-product*, by **applying selections and projections as soon as possible**, and materialising only the subset of the cross-product that will appear in the result of the join