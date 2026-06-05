---
Class: "[[AI]]"
date: 2026-06-05
type:
---
# Intelligent Systems and Rule-Based Systems under Uncertainty. Fuzzy Logic and Fuzzy Inference Systems
## Overview
 >[!Definition]
 >A **knowledge-based** system is a computational system whose behaviour is driven by *explicit domain knowledge* and an *inference mechanism*

## Glossary
- fuzzy set: (for a value) set of membership degrees for all possible linguistic labels
- membership degree: a value between 0 and 1, representing "how much" an element belongs to a ()
- membership function: a function used to map raw data to a membership degree
- fuzzy variable: $V = (x, L, U, M)$, where x is the name of the symbolic variable, L is the set of linguistic labels, U the universe of discourse, and < the set of semantic regions (membership functions)
- fuzzification: transforming crisp observations into degrees of membership

## All that Fuzz

**Fuzzy systems** model imprecise concepts. They use *degrees of membership* rather than strict yes / no membership. They are suitable for rule-based control and decision systems where expert knowledge is linguistics.

>[!Tip]
>Instead of asking whether an observation belongs to a class, fuzzy logic asks *to what degree* it belongs to that class.

![[fuzzy-set-membership-example]]

## Classical Logic - Fuzzy Logic comparison

| Classical Logic     | Fuzzy Logic             |
| ------------------- | ----------------------- |
| binary truth values | gradual truth values    |
| true or false       | degrees between 0 and 1 |
| yes or no           | partial membership      |

Operator mappings:

| Classical Logic | Fuzzy Logic |
| --------------- | ----------- |
| $a \land b$     | $\min(a,b)$ |
| $a \lor b$      | $\max(a,b)$ |
| $\neg a$        | $1 - a$     |

## Constructing a fuzzy system
1. Define the raw inputs and outputs
2. Define fuzzy variables and fuzzy sets using *membership functions*
3. Construct the *rule base*
4. Evaluate the rules with a *fuzzy inference mechanism*
5. Aggregate the rule outputs into a single fuzzy output set
6. Defuzzify the aggregated fuzzy set into a crisp value
7. Interpret the result in the application context
## Membership functions
>[!Definition]
>A fuzzy set $F \subseteq X$ is described by a *membership function* $$\mu_F : X \rightarrow [0,1], \mu_F(x) = g$$
>Here $g$ is the *degree* to which $x$ belongs to $F$

Membership functions can have various shapes:
- **singleton**: $\mu(x)=s$ at one point, and 0 elsewhere
- **triangular**
- **trapezoidal**
- **Z function**: decreasing S-shaped function, often written as $Z(x) = 1 - S(x)$
- **Gaussian**

>[!Property]
>A fuzzy variable is **complete** if every value in the universe belongs to at least one fuzzy set with positive degree: $$\forall x \in X, \exists A: \mu_A(x) >0$$

>[!Property]
>A fuzzy variable forms a **unit partition** if, *for every input value $x$, the sum of the memberships is one*: $\sum_{i=1}^p \mu_{A_i}(x)=1$, where $p$ is the number of fuzzy sets that cover $x$

>[!Theorem]
>A complete fuzzy variable can be transformed into a unit partition by normalising its membership degrees: $$\mu'_{A_i}(x)=\cfrac{\mu_{A_i}(x)}{\sum_{j=1}^p\mu_{A_j}(x)}$$

## Fuzzification of Input Data

>[!Definition]
>Fuzzification transforms crisp observations into degrees of membership

## Rule Base
>[!Definition]
>A rule is a linguistic construction that links conditions to consequences.

Fuzzy rules operate on linguistic regions (e.g. low temperature, high visibility), rather than on isolated exact values.

- Fuzzy rules are evaluated in parallel. 
- Each activated rule contributes to the shape of the final output
- The output fuzzy sets are aggregated after all rules have been evaluated
- The aggregated result is defuzzified into a crisp value

>[!Tip]
>A fuzzy system usually does not select one single winning rule. It combines (aggregates) the effects of several partially satisfied rules

For each rule premise, compute the membership degree of the input in the relevant fuzzy sets, according to the [[#Classical Logic - Fuzzy Logic comparison|Classical Logic - Fuzzy Logic equivalences]]. (e.g. $\mu_{A\land B}(x)=\min(\mu_A(x), \mu_B(x))$)

>[!Definition]
>The result of premise evaluation is also called the **rule firing strength** or **degree of fulfilment**.

## Consequences and inference models

The consequence part determines how a rule contributes to the output

>[!Tip]
>The main difference between Mamdani, Sugeno, and Tsukamoto inference is the representation of the **rule consequent**

| Model     | Description                                                                                                       | Consequent representation                 | Consequent representation explained                                         |
| --------- | ----------------------------------------------------------------------------------------------------------------- | ----------------------------------------- | --------------------------------------------------------------------------- |
| Mamdani   | the output variable belongs to a fuzzy set                                                                        | Fuzzy set: $z$ is $C$                     | produces fuzzy output regions that require aggregation and defuzzification  |
| Sugeno    | the output variable is a crisp function of the inputs                                                             | Crisp function: $z=f(x,y)$                | produces crisp rule outputs that are usually combined by weighted averaging |
| Tsukamoto | the output variable belongs to a fuzzy set with a monotone membership function, producing a crisp value per  rule | Monotone fuzzy set: $z$ is $C_{monotone}$ | produces crisp rule outputs that are usually combined by weighted averaging |
(^^^ don't understand this)
### Mamdani model
>[!Definition]
>In a Mamdani rule, the consequence is a fuzzy set: $$\text{if } x \text{ is } A \text{ and } y \text{ is } B\text{ then } z \text{ is } C$$

The firing strength of the premise is applied to the membership function of the consequence. Two common variants:

| Clipped fuzzy sets                                               | Scaled fuzzy sets                                                |
| ---------------------------------------------------------------- | ---------------------------------------------------------------- |
| cuts the output membership function at the firing-strength level | multiplies the output membership function by the firing strength |
| shape information may be lost                                    | preserves more shape information                                 |
| easy to compute                                                  | computationally more demanding                                   |

![[clipping-versus-scaling]]

### Sugeno model
>[!Definition]
>In a Sugeno rule, the consequence is a crisp function of the inputs: $$\text{if } x \text{ is } A \text{ and } y \text{ is } B\text{ then } z = f(x,y)$$

| Zero-order Sugeno      | First-order Sugeno |
| ---------------------- | ------------------ |
| $f(x,y)=k$, a constant | $f(x,y)=ax+by+c$   |

The final output is commonly computed as a weighted average of rule outputs: 
>[!Definition]
>If $\alpha_i$ is the firing strength of rule $i$ and $z_i=f_i(x,y)$ is its crisp consequence, the output is often $$z^*=\cfrac{\sum_{i=1}^m \alpha_i z_i}{\sum_{i=1}^m \alpha_i}$$

