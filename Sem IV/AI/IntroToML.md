---
Class: "[[AI]]"
date:
type: Lecture
---
# Introduction to Machine Learning

>[!Definition]
>A **model** is a function that maps **features** to a **prediction** $$\hat y = h^{(w)}(x)$$ 

Machine Learning aims to learn a *hypothesis* $h \in \mathcal{H}$ from a hypothesis space $\mathcal{H}$ such that $h$ accurately predicts the *label* of a data point based solely on its features.

A data point is denoted by $z$ and is represented by $$z = (x,y)$$ where
- $x \in \mathbb{R}^d$ is the **feature vector** ($d$ is the *number of features*)
- $y \in \mathbb{R}$ is the **label** (continuous in regression problems)

A prediction is generally imperfect. Its error is qualified using a *loss function* $L((x,y),h)$

## Designing a ML - TPE Framework
There are three design axes: Task, Performance, Experience

| Task                                                                                         | Performance                                                     | Experience                                                     |
| -------------------------------------------------------------------------------------------- | --------------------------------------------------------------- | -------------------------------------------------------------- |
| What needs to be learned. Requires defining an *objective function* and its *representation* | How you measure success. Evaluated via a metric (e.g. accuracy) | The data the system learns from. Select an experience database |
### Objective Function

>[!Definition] 
>An **objective function** is what must be learned

 Representations:
 - Table
 - Symbolic rules
 - Numeric functions
 - Probabilistic functions 

>[!Info] Trade-off
>More expressive representations are harder to learn. Less expressive ones are easier but may not capture the problem.

### The Learning Algorithm
- **Selection Criteria**
	- chosen based on training data
	- goal: find a hypothesis that both matches training data and generalises to unseen data
	- main principle: minimise a cost / loss function (error minimisation)
- **Evaluation**
	- two approaches:
		- *experimental*: compare methods via cross-validation. collect accuracy, training time, testing time. Apply statistical analysis to differences
		- *theoretic*: computational complexity, ability to fit training data, sample complexity (minimum data needed to learn)

>[!Tip]
>In order to compare algorithms, confidence intervals can be used

### Training Database 

There are 2 types of experience:
- **direct**: labeled (input, output) pairs (e.g. board position annotated as correct / incorrect move)
- **indirect**: useful feedback, not direct i/o pairs. (e.g.: sequence of moves + final game score). The algorithm must infer stuff  

Data sources are:
- randomly generated examples (positive and negative)
- positive examples collected by the learner
- real-world examples

Key characteristics of good data:
- independence (if not, collective learning is needed)
- training and test data must follow the same distribution (if not, you need transfer learning / inductive transfer)

Attribute types:
- **quantitative**: continuous, discrete, range
- **qualitative**: nominal, ordinal
- **structured**: hierarchical trees

Data can be standardised (z-score normalisation)
- removes scale effects when attributes have different units
- transforms raw values to z-scores
## Empirical Risk Minimisation (ERM) or Minimising the Average Loss
Machine learning aims to minimise the average loss. In practice this is known as Empirical Risk minimisation / Minimising the average loss.

| Minimising the Average Loss                                              | Empirical Risk Minimisation                                                              |
| ------------------------------------------------------------------------ | ---------------------------------------------------------------------------------------- |
| optimisation viewpoint                                                   | statistical learning viewpoint                                                           |
| deterministic                                                            | probabilistic                                                                            |
| the objective is a number we can compute                                 | training loss is a proxy for test performance                                            |
| $\min_{h\in\mathcal{H}} \cfrac{1}{m}\sum_{r=1}^m L((x^{(r)},y^{(r)}),h)$ | $\hat h \in \arg \min_{h\in\mathcal{H}} \cfrac{1}{m}\sum_{r=1}^m L((x^{(r)},y^{(r)}),h)$ |
| outputs a minimiser of a concrete objective                              | outputs an estimate of the risk-minimiser                                                |
^^ don't understand the difference
Both views often lead to the same optimisation problem. However, the *interpretation* differs

### Minimising the Average Loss
- Given a fixed training set, the *average loss* objective can be defined: $$\min_{h\in\mathcal{H}} \cfrac{1}{m}\sum_{r=1}^m L((x^{(r)},y^{(r)}),h)$$
### Empirical Risk Minimisation 
If the distribution of the data points is unknown, replace the expectation by the *empirical average* 


## Training
>[!Definition]
>Training an ML model means solving ERM to obtain $\hat h$
>Two fundamental questions arise:
>- **Computational**: how much computation required to solve ERM
>- **Statistical**: How accurate is $\hat h(x)$ on unseen data

## Validation
>[!Definition]
>Validation evaluates whether a learned hypothesis performs similarly well *inside* and *outside* the training set

- training error: estimates how well $\hat h$ fits the training data
- validation error: estimates how well $\hat h$ generalises

Models are diagnosed by comparing 
- $E_t$ - training error 
- $E_v$ - validation error 
- $E_{ref}$ - baseline

### Baseline 
The baseline error is a sanity check benchmark which answers the question: *How well would a completely naive model do?*. So clearly if the model can't beat the baseline, it's useless.

| Problem Type    | Baseline                                                         |
| --------------- | ---------------------------------------------------------------- |
| classification  | majority class classifier (always predict the most common label) |
| regression      | always predict the mean of the training labels                   |
### Interpreting Training and Validation Errors 

| Case                              | Interpretation                                                                                                                       |
| --------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------ |
| $E_t \approx E_v \approx E_{ref}$ | good generalization, no clear overfitting, limited room for improvement                                                              |
| $E_v >> E_t$                      | overfitting; use smaller model, regularization, or more data                                                                         |
| $E_t \approx E_v >> E_{ref}$      | underfitting; model too simple or optimisation not working well                                                                      |
| $E_t >> E_v$                      | possible violation of the i.i.d (independent and identically distributed) assumption, unlucky train-validation split or dataset bias |
## Regularisation 

>[!Definition]
>Consider an ERM-based ML method with:
>- hypothesis space $\mathcal{H}$
>- training set $\mathcal{D}$
>
> An **indicator of performance** is the ratio $\cfrac{d_{eff}(\mathcal{H})}{\vert D \vert}$, where $d_{eff}(\mathcal{H})$ measures the effective model complexity.

>[!Tip]
>Larger ratios increase the risk of overfitting.
>**Regularisation** aims to *reduce this ratio*.

There are *three approaches* to regularisation:
- **increase** $\vert \mathcal{D} \vert$: collect more data or use data augumentation
- **penalise complexity**: add a regularisation term to the ERM objective
- **shrink the hypothesis space**: impose constraints on model parameters

These approaches are closely related and often equivalent 

## Machine Learning Taxonomy

### By goal

| Prediction                                                    | Classification                                                                    | Regression                                                                      | Planning                                          |
| ------------------------------------------------------------- | --------------------------------------------------------------------------------- | ------------------------------------------------------------------------------- | ------------------------------------------------- |
| Predict output for new input using a previously learned model | Assign an object to one or more known or unknown categories based on its features | Estimate the shape of a function (uni- or multi- variable) from a learned model | Generate a sequence of optimal actions for a task |

### By learning experience
#### supervised learning
- data is labeled
- training data = pairs (attribute_data, output)
- output is either a class (classification) or a real number (regression)
- process: 
	1. Training - learn a model from labeled data
	2. Testing - apply to new, unseen data
- by dataset size, there are 3 main evaluation strategies:
	1. Large dataset: disjoint train / test split (usually 80/20)
	2. Small dataset: k-fold cross-validation (split into h equal subsets)
	3. Very small dataset: leave-one-out cross-validation

>[!Warning] 
>The main difficulty is **overfitting** (i.e. when there is excellent training performance, but poor test perfomance)

#### unsupervised learning (clustering)
- data is not labeled
- the goal is to detect hidden structure in data
- the output is a grouping of data into k classes, where k may be predefined or unknown. data within a class must be similar

**Similarity / distance measures**
- euclidean distance: $\sqrt{\sum{(p_j-q_j)^2}}$
- manhattan distance: $\sum|p_j-q_j|$
- inner product: $\sum p_j q_j$
- cosine: don't wanna write this one
- hamming distance: number of differences between p and q
- levenshtein distance: the minimum nummber of transformations necessary to change p in q
- mahalanobis distance: distance between a point p and a distribution Q

>[!Important]
>Rule: either choose to *minimise distance* (dissimilarity) or *maximise similarity* (never mix the two)

The quality of clusters can be evaluated in 2 manners:
- internal criteria: high intra-cluster similarity, low inter-cluster similarity
- external criteria: compare agains known benchmarks. uses precision, recall, F1; rarely possible in practice

#### active learning
- the algorithm can request additional information during training to improve itself
- differs from passive learning by adding a query-response loop (the learner queries the world, receives a response, then updates)

#### reinforcement learning
- learn a behaviour (sequence of actions) that maximises long-term reward
- no labeled outputs - the agent interacts with an environment, takes actions, and receives rewards or penalties