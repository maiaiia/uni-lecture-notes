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


