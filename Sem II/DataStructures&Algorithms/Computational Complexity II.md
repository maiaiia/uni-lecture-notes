# Computational Complexity II
___
Class: [[DataStructures&Algorithms]]
Type: Lecture 
Tags: #algorithmcomplexity
Date: February 26th, 2025
___
## Prerequisites 
See: [[Computational Complexity]] (big $O$ / $\Omega$ / $\Theta$ notation, best case, worst case, average case)
## Recap
#### Big $O$ / $\Omega$ / $\Theta$ notations
- $O$ - upper bound
- $\Omega$ - lower bound
- $\Theta$ - exact complexity

>[!tip] For the purposes of this course, we will try and use the $\Theta$ notation whenever that's possible

#### Best / Worst / Average case complexities

Average case computation formula: $\Sigma_{I \in D} P(I) \cdot E(I)$  
- $D$ - domain of the problem
- $I$ - input data 
- $P(I)$ - probability that we have $I$ as an input 
- $E(I)$ - number of operations performed by the algorithm for input $I$
For instance, when all events are equally likely to occur, the formula is $\cfrac{1}{n}\Sigma_{I\in D}E(I)$

Sample problem:  check if an element is in an unsorted array
BC: $\Theta(1)$
WC: $\Theta(n)$
AC: $\cfrac{1}{n+1}\cdot 1 + \cfrac{1}{n+1} \cdot 2 + ... + \cfrac{1}{n+1} \cdot n + \cfrac{1}{n+1} \cdot n \in \Theta(n)$
**Total complexity**: $O(n)$ (we use the $O$ notation when the best case complexity differs from the worst and average case complexities. If they are the same, $\Theta$ is used)

>[!tip] For the total complexity we take the worst case. If the best case has a lower value, the $O$ notation is used. Otherwise, we use the $\Theta$ notation

## Amortised complexity analysis
Compute the average cost of 'n' operations 
Is especially useful when the worst case rarely occurs (e.g. appending an element to a dynamic array)


## Examples - Seminar 3 

^4d2a77

1. True or False??
a) $n^2 \in O(n^3)$ True
b) $n^3 \in O(n^2)$ False
c) $2^{n+1} \in \theta(2^n)$ True 
d) $2^{2n}\in \theta(2^n)$ False 

| Statement                       | T/F                                                                            |
| ------------------------------- | ------------------------------------------------------------------------------ |
| $n^2 \in O(n^3)$                | True                                                                           |
| $n^3 \in O(n^2)$                | False                                                                          |
| $2^{n+1} \in \theta(2^n)$       | True                                                                           |
| $2^{2n}\in \theta(2^n)$         | False                                                                          |
| $n^2\in \theta(n^3)$            | False                                                                          |
| $O(n)+\theta(n)=O(n)$           | True by definition, but we will use $\theta(n)$ in these cases                 |
| $(n+m)^2 \in O(n^2+m^2)$        | True. Proof: Suppose $n > m$. The, $(m+n)^2 = n^2+m^2+2mn < n^2+2n^2+n^2=4n^2$ |
| $2^n \in O(n!)$                 | True                                                                           |
| $\log_{10}n\in \theta(\log_2n)$ | True                                                                           |
| $O(n)+\theta(n^2)=\theta(n^2)$  | True                                                                           |
| $\theta(n)+O(n^2)= O(n^2)$      | True                                                                           |
| $\theta(n)+O(n^2)=\Omega(n)$    |                                                                                |
| $O(n)+O(n^2)=O(n^2)$            | True                                                                           |
| $log_2 3^n \in O(log_22^n)$     | True                                                                           |
| $3^n \in O(2^n)$                | False                                                                          |
2. Compute the complexities of the following algorithms
```
subalgorithm s1(n) is:
	for i <- 1, n execute //n steps
		j <- n 
		while j != 0 execute //log_2(n) steps
			j <- [j/2]
		end while
	end for 
end subalgorithm
```
Complexity: $\theta(nlog_2(n))$

```
subalgorithm s2(n) is:
```
Complexity: $log_2(1)+log_2(2)+...+log_2(n)=log_2(n!) \Rightarrow \Theta(log_2(n!)$. By *Stirling's approximation*, this is equal to $\theta(n \log n)$ 

>[!important] 
>The Theta notation is used whenever the number of steps in relation to the input does not vary. So the $\Theta(f(n))$ does not mean that exactly $f(n)$ steps are executed, but rather that no matter the input, a fixed number of steps is executed 

```
subalgorithm s3(n) is:
```
Best case = Worst case = $\Theta(n)$

```
subalgorithm s4(n) is:
```
Best case: $\Theta(1)$
Worst case: $\Theta(n)$
Total case: $O(n)$
Average case: $\sum_{k=1}^{n}\cfrac{1}{n+1}\cdot k + \cfrac{1}{n+1}\cdot n = \theta(n)$  , where each term of the sum represents the probability of an element being on position `k` (and the last term represents the probability of an element not being in the array). 

```
subalgorithm s5(x,n) is:
	k <- 0
	for i <- 1, n execute
		for j <- 1, xi execute
			k <- k + xj
		end for
	end for 
end subalgorithm

```
Case 1. Assume every $x_i$ is positive 
$\sum_{i=1}^n(\sum_{j=1}^{x_i} 1) = \sum_{i=1}^n x_i = S$, where $S$ is the sum of the values in the array $\Rightarrow \theta(S)$ 
Case 2. There can be non-positive values 
$\theta(S+n)$ - because at least $n$ steps must be executed for the first iteration and at least $S$ for the second

```
subalgorithm s6(n) is:
	for i <- 1, n execute:
		@elementary operation 
	end-for 
	i <- 1 
	k <- true 
	while i <= n - 1 and k execute
		j <- i
		k_i <- true 
		while j <= n and k_i execute
			@elementary operation (k_1 can be modified)
			j <- j + 1
		end-while
		i <- i + 1 
		@elementary operation (k can be modified)
	end-while
end-subalgorithm
```
BC: $\Theta(n)$
WC: $n + \sum_{i=1}^{n-1}(1+\sum_{j=i}^n 1) = n + (n-1)+\sum_{i=1}^{n-1}(n-i+1) =$ $=2n-1+ n(n-1)-\cfrac{n(n-1)}{2}+(n-1) \in \Theta(n^2)$      
AC: 
- First while loop, assuming that $i$ is fixed: $\sum_{i\in D}P(I)\cdot C(I)=\cfrac{1}{n-i+1}\cdot 1 + \cfrac{1}{n-i+1}\cdot 2+ \cfrac{1}{n-i+1}\cdot 3+...+ \cfrac{1}{n-i+1}\cdot (n-i+1)=\cfrac{n-i+2}{2}$ Note that $P$
- Outer while loop:
$\cfrac{1}{n-1}\cdot\cfrac{n-1+2}{2}+\cfrac{1}{n-1}\cdot\cfrac{n-2+2}{2}\cdot 2 + ... +\cfrac{1}{n-1}\cdot\cfrac{n-(n-1)+2}{2}\cdot (n-1) =$ $=\cfrac{1}{2(n-1)}(\sum_{i=1}^{n-1}(n-i+2))=...=\Theta(n^2)$
TC: $O(n^2)$ 

```
subalgorithm p(x,s,d) is:
	if s < d then
		m <- [(s+d)/2]
		for i <- s, d-1 execute
			@elementary operation 
		end-for 
		for i <- 1, 2 execute
			p(x,s,m)
		end-for
	end-if
end-subalgorithm
```

$T(n)=\begin{cases} 1, n \leq 1 \\ 2 \cdot T(\cfrac{n}{2}) + \Theta(n), n > 1 \end{cases}$
Assume that $n = 2^k$
$T(2^k)=2T(2^{k-1}+2^k=2(2T(2^{k-2})+2^{k-1})+2^k = 2^2T(2^{k-2})+2^k+2^k = ...$ $= 2^k + 2^k + ... + 2^k = k \cdot 2^k$. So the final complexity is $\Theta(n \log_2n)$  

3. 
- assume you want to check whether there are 2 equal elements in $\theta (n \log n)$
	- sort array - $\theta(n \log n)$
	- check consecutive positions  - $O(n)$
- check if there are 2 elements with sum $k$ in $\Theta(n \log_2 n)$
	- solution 1:
		- sort elements: $\Theta (n \log _2 n)$
		- binary search: $O(n \log _ 2 n)$
	- solution 2:
		-  sort elements: $\Theta (n \log _2 n)$
		- two pointers: $O(n)$