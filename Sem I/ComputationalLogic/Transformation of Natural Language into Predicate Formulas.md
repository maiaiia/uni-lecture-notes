# Transformation of Natural Language into Predicate Formulas
___
Class: [[ ComputationalLogic]]
Type: Lecture
Tags: # 
Date: October 31st 2024
Teacher: [[Mihaela Lupea]]
___
1. All CS students are smart
2. there is someone who studies at BBU and is smart 
D = set of all students 
$CS:D \rightarrow \{T, F\}, CS(x) = T$ if $x$ is a computer science student
$st_{BBU}:D\rightarrow \{T,F\}, st_{BBU}(x)=T$ if x studies at BBU
$smart : D \rightarrow \{T, F\}, smart(x) = T$ if $x$ is smart
1: $\forall x \in D, CS(x) \rightarrow smart(x)$
2: $\exists x \in D : st_{BBU}(x) \land smart(x)$
3. if $x$ and $y$ are nonnegative integers and $x > y$, then $x^2 > y^2$
3: $(\forall x)(\forall y)((x \geq 0)\land (y \geq 0) \land (x > y) \rightarrow x^2 > y^2)$ (but she defined a function for every single fucking expression)
5. In a plane if a line $x$ is parallel to a constant line d then all the lines perpendicular to x are also perpendicular to d
6. Every child loves anyone who gives the child any present

> [!check] lecture only exercise

**Hypotheses:**
H1: All hummingbirds are richly coloured 
H2: No large birds live on honey 
H3: Birds that do not live on honey are dull in color 
H4: Picky is a hummingbird 

**Conclusions:**
C1: There is a bird which lives on honey 
C2: All hummingbirds are small 

**Check whether or not the following deductions hold**
H1, H2, H3, H4 $\vdash$ C1 and H1, H2, H3 $\vdash$ C2
