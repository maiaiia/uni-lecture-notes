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

## Multiobjective Optimisation 
>[!Definition]
> A **multiobjective problem** optimises several criteria at once:
> $$\text{minimise }f(X) = (f_1(X), f_2(X),\dots, f_k(X)), X \in \Omega$$

>[!Warning] Usually, objectives conflict.
>The goal is no longer a singular best solution. The goal is a set of trade-off solutions.

Evolutionary algorithms are a good fit for multiobjective problems, since they naturally maintain a population of alternatives.
- A population can approximate many trade-offs in one run 
- Selection can use dominance instead of scalar fitness
- Diversity mechanisms can distribute solutions along the front 
- Archiving can preserve non-dominated solutions discovered over time 

### Standard evolutionary multi-objective algorithms

>[!Definition] Pareto front
> The **Pareto front**, aka the Pareto frontier or Pareto curve, is a *set of optimal solutions* in multi-objective optimisation where no solution can be improved in one objective without worsening another. It represents trade-offs between conflicting objectives, helping to identify the best possible choices based on different criteria.

Multi-objective algorithms have the following *common goals*:
- approximating the Pareto front
- keeping a diverse set of trade-off solutions
- balancing convergence and spread

They also share an evolutionary structure:
- population of candidate solutions
- variation through crossover and mutation
- selection based on dominance or decomposition
- elitism to preserve high-quality solution

| Algorithm | Main idea                           |
| --------- | ----------------------------------- |
| NSGA-II   | Non-dominated sorting + crowding    |
| SPEA2     | External archive + strength fitness |
| MOEA/D    | Decompose MOP into subproblems      |
The main difference between these algorithms is in how they define selection pressure.

### NSGA-II: Non-Dominated Sorting Generic Algorithm II

>[!Summary]
>Rank the population into Pareto fronts, then preserve diversity using crowding distance.

1. Combine parents and offspring: $R_t = P_t \cup Q_t$
2. Sort $R_t$ into fronts $F_1, F_2, \dots$
3. Fill the next population with the best fronts first 
4. If the last accepted front does not fit, select the least crowded individuals 

>[!Tip] Selection Rule
>- a lower Pareto rank is better 
>- for equal ranks, a larger crowding distance is better
>

![[nsga2]]
#### crowding distance 
>[!Definition] 
>The **crowding distance** estimates how isolated a solution is *inside the same Pareto front*.

For each objective, solutions are sorted. Boundary solutions receive a very large distance. Interior solutions' distance is based on neighbouring objective values: $$CD_i=\sum_{k=1}^M\cfrac{f_k(i+1)-f_k(i-1)}{f_k^{max}-f_k^{min}}$$
Thus,
- sparse regions survive more often
- clusters are reduced 
- extreme trade-offs are preserved

### SPEA2: Strength Pareto Evolutionary Algorithm

>[!Summary]
>Use an external archive and assign fitness using *dominance strength* and *density*

| ?                  | Formula                                             |
| ------------------ | --------------------------------------------------- |
| **strength value** | $S(i)=\vert\{j \vert i \text{ dominates } j\}\vert$ |
| **raw fitness**    | $R(i)=\sum_{j\text{ dominates } i}S(j)$             |
| **final fitness**  | $F(i)=R(i)+D(i)$                                    |

1. Combine population and archive
2. Compute strength, raw fitness, and density
3. Copy non-dominated solutions into the archive
4. If archive is too large, truncate crowded regions 
5. Generate offspring from archive members

#### archive and truncation
>[!Definition]
>The **archive** is an *elitist memory* of high-quality solutions.

If the archive is too small: 
- add dominated individuals with best fitness
If the archive is too large:
- remove individuals from the most crowded regions
- preserve boundary and well spaced solutions
- maintain a compact approximation of the front

>[!Tip]
>SPEA2 separates evolutionary search from elite preservation more explicitly than NSGA-II

# Questions:
nsga-II: 4 - wdym last front does not fit? 
spea2: wtf is density, wdym separates evolutionary search from elite preservation more explicitly?


