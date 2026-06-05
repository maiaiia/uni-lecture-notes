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
- 

## All that Fuzz

**Fuzzy systems** model imprecise concepts. They use *degrees of membership* rather than strict yes / no membership. They are suitable for rule-based control and decision systems where expert knowledge is linguistics.

>[!Tip]
>Instead of asking whether an observation belongs to a class, fuzzy logic asks *to what degree* it belongs to that class.

![[fuzzy-set-membership-example]]

### Classical Logic - Fuzzy Logic comparison

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

### Constructing a fuzzy system
1. Define the raw inputs and outputs
2. Define fuzzy variables and fuzzy sets using *membership functions*
3. Construct the *rule base*
4. Evaluate the rules with a *fuzzy inference mechanism*
5. Aggregate the rule outputs into a single fuzzy output set
6. Defuzzify the aggregated fuzzy set into a crisp value
7. Interpret the result in the application context

>[!Definition]
>A fuzzy set $F \subseteq X$ is described by a *membership function* $$\mu_F : X \rightarrow [0,1], \mu_F(x) = g$$
>Here $g$ is the *degree* to which $x$ belongs to $F$

Membership functions can have various shapes:
- **singleton**
- **triangular**
- **trapezoidal**
- **Z function**
- ****

 