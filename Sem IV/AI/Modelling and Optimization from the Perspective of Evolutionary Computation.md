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

## Multi-objective Optimisation 
>[!Definition]
> A **multiobjective problem** optimises several criteria at once:
> $$\text{minimise }f(X) = (f_1(X), f_2(X),\dots, f_k(X)), X \in \Omega$$

>[!Warning] Usually, objectives conflict.
>The goal is no longer a singular best solution. The goal is a set of trade-off solutions.

Evolutionary algorithms are a good fit for multi-objective problems, since they naturally maintain a population of alternatives.
- A population can approximate many trade-offs in one run 
- Selection can use dominance instead of scalar fitness
- Diversity mechanisms can distribute solutions along the front 
- Archiving can preserve non-dominated solutions discovered over time 
### Pareto stuff?

>[!Definition] Pareto Dominance
>For a minimisation, solution $a$ dominates solution $b$ if: $$\forall i: f_i(a) \leq f_i(b) \text{ and } \exists j : f_j(a) < f_j(b)$$
>i.e. $a$ is not worse in any objective and strictly better in at least one objective.
>A solution is **non-dominated** if no other known solution dominates it.

>[!Definition] Pareto Set. Pareto Front
>- The **Pareto set** is the set of non-dominated solution in a decision space.
>- The **Pareto front** is their image in the objective space: $$PF=\{f(x):x\in\Omega,\nexists y \in \Omega \text{ such that y dominates x}$$

### Convergence vs diversity in multi-objective search 
Evolutionary multi-objective optimisation tries to approximate both convergence to the true front and diversity along the front.

| Convergence                                     | Diversity                                    |
| ----------------------------------------------- | -------------------------------------------- |
| move toward the true Pareto front               | covert the front broadly                     |
| prefer non-dominated / less dominated solutions | avoid clustering in one region               |
| improve objective values                        | preserve extreme and intermediate trade-offs |
>[!Tip]
>A front with excellent convergence but poor spread is still a weak approximation
### Standard evolutionary multi-objective algorithms

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


### MOEA/D: Multi-objective Evolutionary Algorithm Based on Decomposition

>[!Summary]
>Transform one multi-objective problem into many scalar subproblems

Each subproblem has a specific *weight factor* $\lambda^i$ and optimises one scalar aggregation, for example the weighted sum: $g(x \vert \lambda^i) = \sum_{m=1}^M \lambda_m^i f_m(x)$.
A common alternative is the Chebyshev function: $g(x \vert \lambda^i, z^*) = max_m\lambda_m^i\vert f_m(x) - z_m^*\vert$. 

>[!Definition] Neighbourhood
>Vectors of similar weights define neighbouring subproblems; mating and replacement are often local.

### Comparison
| Aspect              | NSGA-II                                 | SPEA2                              | MOEA/D                                                 |
| ------------------- | --------------------------------------- | ---------------------------------- | ------------------------------------------------------ |
| Main selection idea | Pareto rank + crowding distance         | Strength fitness + archive density | Scalar subproblems with weight vectors                 |
| Elitism             | Parent-offspring union                  | Explicit external archive          | Best solutions for sub-problems                        |
| Diversity Control   | Crowding distance                       | Density and archive truncation     | Weight-vector distribution                             |
| Best suited for     | General multi-objective GA baseline     | Strong archive-based Pareto search | Structured fronts and decomposition-friendly problems  |
| Main weakness       | Crowding can degrade in many objectives | Archive management can be costly   | Performance depends on decomposition of weight vectors |


## Multi-modal Optimisation

>[!Definition]
>A **multi-modal** problem has *multiple local or global optima*.

Though the aim in single-objective optimisation may be to find the global optimum and in multi-modal optimisation it may be to identify several good optima, in real applications, alternative optima may represent useful design choices.

Evolutionary populations are suitable because they can maintain multiple subpopulations around different basins.

### Niching
>[!Definition]
>**Niching** methods encourage the population to occupy several promising regions

| Notion          | Meaning                                                      |
| --------------- | ------------------------------------------------------------ |
| Fitness sharing | reduce fitness in crowded niches                             |
| Crowding        | offspring compete with similar individuals                   |
| Speciation      | divide the population into groups                            |
| Clearing        | keep a few winners per niche and suppress nearby competitors |
| Island models   | evolve subpopulations with limited migration                 |
## Spreading the Population

>[!Definition]
>**Population spreading** is used to *prevent genetic collapse* and *improve coverage*.

| search type      | aim                                            |
| ---------------- | ---------------------------------------------- |
| single-objective | avoid premature convergence                    |
| multi-objective  | approximate the whole Pareto front             |
| multi-modal      | preserve multiple optima                       |
| dynamic problems | retain adaptability when the landscape changes |

| mechanism                          | main effect                            | extra                                                                                        |
| ---------------------------------- | -------------------------------------- | -------------------------------------------------------------------------------------------- |
| random / stratified initialization | broad initial coverage                 |                                                                                              |
| mutation adaptation                | controlled exploration                 |                                                                                              |
| crowding distance                  | spread along Pareto fronts             | does not require a user-defined niche radius, but it can struggle in many-objective settings |
| fitness sharing                    | penalize dense regions                 |                                                                                              |
| niching / speciation               | preserve distinct basins               |                                                                                              |
| archive management                 | retain diverse elite solutions         |                                                                                              |
| island model migration             | balance isolation and information flow |                                                                                              |
| restart strategies                 | recover from stangation                |                                                                                              |
### fitness-sharing
$$F_i' = \cfrac{F_i}{\sum_{j=1}^n sh(d(i,j))}$$
A common sharing function is: $$sh(d)=\begin{cases}1-\big(\cfrac{d}{\sigma_{share}}\big)^\alpha, & d < \sigma_{share}\\0, & d \geq \sigma_{share} \end{cases}$$
### island models
- each island evolves mostly independently
- migration shares useful genetic material
- topology, frequency, and migrant section control the exploration-exploitation balance


### diversity measures
Useful diversity indicators include:
- average pairwise distance in the decision space
- average pairwise distance in the objective space
- entropy of genes or alleles 
- number of occupied niches
- spreading or spacing along a Pareto front
- hypervolume contribution distribution

### grid-based dispersion
- the search space (or objective space) is divided into a grid of cells
- each individual is assigned to one cell according to its position 
- the number of individuals per cell estimates the *local density*
- *crowded cells* are penalised, while *sparsely occupied cells* are encouraged
- the goal is to maintain *population diversity* and avoid premature convergence 

Evolutionary meaning: better coverage of the search space; support for multi-modal and multi-objective search; a simple alternative to fitness sharing or crowding

## Conclusions

| Problem Structure    | Main Goal                      | Suitable EC idea              |
| -------------------- | ------------------------------ | ----------------------------- |
| Single objective     | best solution                  | GA, ES, DE, local hybrid      |
| Constrained          | feasible high-quality solution | repair, penalties, decoders   |
| Multi-objective      | trade-off set                  | NSGA-II, SPEA2, MOEA/D        |
| Multi-modal          | several optima                 | niching, sharing, clearing    |
| Dynamic              | adapt over time                | memory, diversity, immigrants |
| Expensive evaluation | reduce evaluations             | surrogate-assisted EA         |

# Questions:
Evolutionary multi-objective optimisation tries to approximate both convergence to the true front and diversity along the front.?
nsga-II: 4 - wdym last front does not fit? 
spea2: wtf is density, wdym separates evolutionary search from elite preservation more explicitly?
moea/d: Vectors of similar weights define neighbouring subproblems; mating and replacement are often local.???
i don't understand niching at all 
