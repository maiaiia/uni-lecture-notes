---
Class: "[[Probability & Statistics]]"
date: 2025-10-26
type: Lecture
---
# Discrete Random Vectors

We will restrict our discussion to a two-dimensional random vector $(X,Y) : S \rightarrow \mathbb{R}^2$

Let $(S,\mathcal{K}, P)$ be a probability space. A **discrete random vector** is a function $(X,Y) : S \rightarrow \mathbb{R}^2$ satisfying the following two conditions:
1. $\forall (x,y) \in \mathbb{R}^2$, $$(X \leq x, Y \leq y) = \{e \in S | X(e) \leq x, Y(e) \leq y\} \in \mathcal{K}$$
2. the set of values that it takes, $(X, Y)(S)$, is at most countable in $\mathbb{R}^2$

The **joint probability distribution** of $(X, Y)$ is a *two-dimensional array* of the form ![[Discrete Random Vectors 2025-12-04 14.57.15.excalidraw]]
where $(x_i, y_j) \in \mathbb{R}^2, (i,j)\in I \times J$ are the values that $(X,Y)$ takes and $p_{ij} = P(X = x_i, Y = y_j)$ is the probability that $(X,Y)$ takes the value $(x_i, y_j)$

>[!Proposition]
> $$\sum_{j\in J}p_{ij}=p_i \text{ and } \sum_{i\in I}p_{ij}=q_j,$$ where $p_i=P(X=x_i), i\in I$ and $q_j=P(Y=y_j),j\in J$. The probabilities $p_i$ and $q_j$ are called **marginal** pdfs.
> 
> This simply follows from the fact that the two collections of events form a partition of the sample space. 

## Operations with discrete random variables

| Operation       | Result                                                    | Notes                                      |
| --------------- | --------------------------------------------------------- | ------------------------------------------ |
| Sum             | $X + Y \begin{pmatrix}x_i+y_j \\ p_{ij}\end{pmatrix}$     |                                            |
| Product         | $X\cdot Y \begin{pmatrix}x_iy_j \\ p_{ij}\end{pmatrix}$   |                                            |
| Scalar Multiple | $\alpha X \begin{pmatrix} \alpha x_i \\ p_i\end{pmatrix}$ |                                            |
| Quotient        | $X / Y \begin{pmatrix}x_i/y_j \\ p_{ij}\end{pmatrix}$     | provided that $y_j \neq 0 \forall j \in J$ |

>[!Important]
>Two discrete random variables $X$ and $Y$ are said to be **independent** if $$p_{ij}=P(X=x_i,Y=y_i)=P(X=x_i)\cdot P(Y=y_i)$$ $\forall (i,j) \in I \times J$

Moreover, if $X, Y$ are discrete independent random variables, then in their sum, product and quotient $p_{ij} = p_iq_j$.

>[!Remark]
>The sum of $n$ independent $\text{Bern}(p)$ random variables is a $B(n,p)$ variable.
>The sum of $n$ independent $\text{Geo(p)}$ random variables is a $\text{NB}(n,p)$ variable.


