# Discrete Random Variable
___
Class: [[Probability & Statistics]]
Type: Lab
Tags: # 
Date: October 28th, 2025
___

## Bernoulli Distribution Model 

$X \in \text{Bern}(p)$, where 
- $p$ is the probability of success in a trial

$X\begin{pmatrix}0 & 1 \\ 1 - p & p\end{pmatrix}$

## Binomial Distribution Model

$X \in \text{Bino}(n, p)$: repeated Bernoulli experiment where 
- $n$ is the number of trials and 
- $p$ is the probability of success in a single trial
- $X$ counts the number of successes

## Hypergeometric Model
$X \in \text{Hyge}(N, n_1, n)$
- $N$ is the population size
- $n_1$ is the population with a desired characteristic
- $n$ is the number of trials
- $X$ counts the number of successes

## Geometric Model
$X \in Geo(p)$
- $p$ is the probability of success
- $X$ is the number of successes


## PDFs

$P(X=k)$ is called the **pdf** function in $k$.

>[!Info]
>In Matlab, the pdf is computed as such: $$[\text{abbr. of the distrib. model}]\text{pdf}([\text{where to compute}], [\text{parameters of the model}])$$
>e.g. $\text{binopdf}(k, n, p)$ $\rightarrow$ $\text{binopdf}(2,3,0.5)$

## CDFs
$P(X \leq k) = \sum_{i=0}^k\text{pdf}(i)$ is called the **cdf** function in $k$. 

## Exercises
### 1. 

A student takes a multiple - choice test consisting of $20$ questions. There are $4$ answers to choose from for each question and only one is correct. 

|     | Model    | success                        | p   |                                                                              |
| --- | -------- | ------------------------------ | --- | --------------------------------------------------------------------- |
| a   | binomial | answering a question correctly | 1/4 | bino                                                                         |
| b   | binomial | incorrectly                    | 3/4 | 1                                                                            |
| c   | binomial | correctly                      | 1/                                                                                 |
| d   | binomial | correctly                                                                                                           |
| e   | binomial | correctly                      | 1/4 |                                                                              |
| f   |  $\cfrac{1 - \text{binocdf}(9,20,1/4)}{1 - \text{binocdf}(2,20,1/4)}$  1/4)}$  1/4)}$  1/4)}$  1/4)}$  1/4)}$  1/4)}$  1/4)}$  |

Binomial model
a)
- success: answering a question correctly
- n = 20
- p = 1/4 

binopdf(8, 20, 0.25) = 0.0609

b) 
- success: answering a question incorrectly
P(X >= 13)

1 - binocdf(12,20,3/4) = 0.8982

c)
- success: answering a question correctly

P(X >= 10)

1 - binocdf(9, 20, 0.25) = 0.0139

d)

e) passing the exam, but not with a perfect score
P(10 <= X <= 20) = cdf(19) - cdf(9)

e) passes the exam given that he answered at least 3 questions correctly

conditional probability!! (given that) 

$P(A|B) = \cfrac{P(A \cap B)}{P(B)}$
$P(X \geq 10 | X \geq 3)b = \cfrac{P('X \geq 10' \cup 'X \geq 3')}{P(X \geq 3)}$ $= \cfrac{P(X\geq 10)}{{P(X \geq 3)}}$ $= \cfrac{1 - cdf(9)}{1 - cdf(2)}$  

### 2.
One year, $1000$ high school graduates take an exam for admission at the Faculty of Mathematics and Computer Science. Seven hundred of them take the exam in CS, the rest in Math. What is the probability that in $200$ randomly selected students
a) $50$ take the exam in Math
b) at least $150$ take it in CS

$\begin{cases}1000 \text{ students }\begin{cases}700 \text{ in CS} \\300 \text{ in math}\end{cases} \\ \\ 200 \text{ randomly selected students}\end{cases}$

a) $P(50$ take the exam in Math$)$
- success: take the exam in Math
- $X \in \text{Hyge}(1000, 300, 200)$

so $P(X = 50)$ --> 1 - hygepdf(50,1000,300,200)

b) $P($at least $150$ take the exam in CS$)$
- success: take the exam in CS
- $X \in \text{Hyge}(1000, 700, 200)$

so $P(X \geq 150)$ --> 1 - hygecdf(149, 1000, 700, 200)

### 3. 
A search engine goes through a list of sites looking for a given key phrase. The probability that any given site contains that phrase is $0.3$ and the search terminates as soon as the key phrase is found. Find the probability that:
a) the search stops at the 5th site visited
b) the phrase is found after at most $3$ sites
c) estimate by simulations the two probabilities in parts **a)** and **b)**


a) $P($the search stops on the 5th website$)$
$X \in \text{Geo}(0.3)$ --> $P()$

