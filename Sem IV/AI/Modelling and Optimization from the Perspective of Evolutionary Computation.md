---
Class: "[[AI]]"
date: 2026-05-06
type: Lecture
---
# Modelling and Optimization from the Perspective of Evolutionary Computation

## Modelling Optimization Problems
>[!Definition] Optimization Problem
>An optimization problem asks for the *best feasible solution* according to one or multiple criteria.

Model: minimise $f(X)$, subject to $X \in \Omega$, $g_i(X) \leq 0, i = 1\dots m$, $h_j(X)=0, j=1 \dots p$

From an evolutionary perspective, this model defines the *environment* in which candidate solutions compete.

### Objective function. Fitness function
>[!Definition]
>- The **objective function** expresses what the model wants to optimise 
>- The **fitness function** is what the evolutionary algorithm uses for selection

Note that they are often the same, though not always.

### Constraint handling in evolutionary computation 
Common strategies:

| Strategy              | Meaning                                            |
| :-------------------- | :------------------------------------------------- |
| penalties             | reduce fitness for constraint violations           |
| repair                | transform infeasible candidates into feasible ones |
| decoders              | map every genotype to a feasible phenotype         |
| feasibility rules     | feasible candidates dominate infeasible ones       |
| specialised operators | preserve feasibility during mutation and crossover |
## The Search Space 
>[!Definition] 
> The **search space** is the set of all candidate solutions that the algorithm can generate 
> $$\mathcal{S} = \{ x : x \text{ is representable via the chosen encoding}\}$$

The feasible space is usually smaller: $\Omega \subseteq \mathcal{S}$. Evolutionary computation explores $\mathcal{S}$ through populations, variation operators, and selection.

The search space has various properties / qualities /  (idk):

| Landscape        | Meaning                                              |
| ---------------- | ---------------------------------------------------- |
| Peaks or valleys | high quality regions                                 |
| ruggedness       | many local optima                                    |
| neutrality       | many candidates with similar fitness                 |
| epistasis        | variable interactions                                |
| deception        | local improvements lead away from the global optimum |
The same mathematical objective may become easy or hard depending on the representation and operators.

### Exploration and exploitation 
| Exploration                           | Exploitation                        |
| ------------------------------------- | ----------------------------------- |
| sample new regions                    | refine good regions                 |
| avoid premature convergence           | increase selection pressure         |
| maintain diversity                    | use local search or small mutations |
| use larger mutations or recombination | preserve elite solutions            |
>[!Tip] 
>Optimisation quality depends on balancing both (like yeah obviously)

## Heuristics and Evolutionary Computation
>[!Definition]
>A **heuristic** is a practical rule for finding good solutions without guaranteeing optimality.

Heuristics are 
- useful when exact optimization is too expensive
- often problem specific
- provide fast but approximate answers 

>[!Definition]
>A **metaheuristic** is a higher-level search framework that can be adapted to many problems.

Evolutionary algorithms are population-based metaheuristics.

![[evo-algo-gen-loop]]
### Main evolutionary design choices 
- population size
- encoding and decoding method
- initialization strategy
- parent selection method
- mutation and crossover operators 
- replacement and elitism policy
- fitness assignment
- diversity preservation method
- termination criterion

## Single-Objective Optimisation
>[!Definition] 
> A **single-objective** problem has one criterion $$x^*=\text{argmin}_{x\in\Omega}f(x)$$

Evolutionary algorithms approximate $x^*$ by repeatedly improving a population.

Typical performance indicators:
- best fitness found
- convergence speed
- robustness across runs
- number of function evaluations

### Selection pressure
>[!Definition] 
>**Selection pressure** determines how strongly good individuals influence the next generation

- low pressure: slow progress but higher diversity
- high pressure: fast progress but higher risk of premature convergence 

Common methods:
- fitness-proportionate selection 
- rank selection 
- tournament selection 
- elitist replacement 

## Multiobjective 
