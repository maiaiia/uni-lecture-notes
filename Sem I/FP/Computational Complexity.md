# Computational Complexity
---
Class: [[ FP]]
Type: Lecture + Seminar
Tags: #algorithmcomplexity 
Date: October 10th 2024
___
Notes:
## Types of complexities
- **Runtime complexity**: T(n)
	 - not a fixed number, but rather a function of the input data size, denoted T(n)
	- measures basic steps the algorithm makes
	- allows us to predict run time for different input data (but cannot predict it exactly)
- **Extra memory-space** required for temporary data
## Efficiency of a function 
### Algorithmic complexities
- **Best case (BC)** - minimum running time
	- doesn't concern the size of the input, but rather the structure of the data
		- ex: if the list is already sorted for bubble sort 
- **Worst case (WC)** - max running time
- **Average case (AC)**
#### "Big-O" notation - $O(f(n))$
- asymptotic upper bound on algorithm complexity
#### "Big-omega" notation - $\Omega(f(n))$
- asymptotic lower bound on algorithm complexity
#### "Big-theta" notation - $\Theta(f(n))$
- tight bound on algorithmic complexity
- most useful, *when it exists*
- tells the exact computational complexity of the algorithm 

>[!important] Notation nuances
> - $T(n)$ is the function used to compute the exact number of operations carried out 
> - $O(n)$ is the upper bound (T(n) <= c * O(n), where c is a constant)
> - $\Omega(n)$ 
## Space Complexity
- when computing the space complexity, we must keep in mind the [[src/Sem I/ASC/-tags_and_indexes/stack|stack]] memory as well 
- for recursion, only the number of levels in the recursion tree is counted

## Examples: 

^0ce272

```python
def f_144(data: list) -> int:
	if len(data) == 0:
		return 0 
	if len(data) == 1:
		return data[0]
	m = len(data) 
	return f_14(data[:m]) + f_14(data[m:])
```
![[TimeComplexityTable]]
=>    Time complexity: O(n)
    Space complexity: O(log2(n)) for the stack and O(nlogn) for the array slices 

```python
def f(n, i: int) -> None:
	if n > 1:
		i *= 2
		m = n // 2 
		f(m, i - 2)
		f(m, i - 1)
		f(m, i + 2)
		f(m, i + 1)
	else: 
		print(i)
```

![[ComplexityTable2.excalidraw]]
=>    Time complexity: O()
	Space complexity: O(log_2(n))