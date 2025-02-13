# Programming Techniques
___
Class: [[ FP]]
Type: 
Tags: # 
Date: October 22nd 2024
Teacher: [[Arthur Molnar]]
___
## Divide and Conquer
### Steps
- **Divide** the problem into smaller *disjoint* sub-problems having *the same structure* 
- **Conquer** (solve) the sub-problems (recursively)
- **Combine** the partial results
```python 
def divide_conquer(data):
	if size(data) < a:
		# base case
		# solve problem directly 
		return rez 
		
	# decompose data 
	rez1 = divide_conquer(div1)
	#...
	rezn = divide_conquer(divn)
	
	# combine results 
	return combine(rez1, ..., rezn)
```
### Common Variations (depending on the division method)
#### Chip and Conquer 
- division: list\[0], list\[1:]
- time complexity: T(n) = T(n-1) + 1 = ... $\Rightarrow$ O(n)
- space complexity: O($n^2$) (list copies: n^2, call stack: n calls) 
#### n/2 division 
- time complexity: T(n) = 2 * T($\frac{n}{2}$) $\Rightarrow$ O(n)
- space complexity: O()
### Classic Algorithms
- [[Searching Algorithms#^a7604b|Binary Search]]
- [[Sorting Algorithms#^4943b6|Merge Sort]]
## Backtracking 

## Greedy 
## Dynamic Programming 
### Classic Problems
1. Fibonacci Sequence (see [[Recursion#^807731|Memoization]])
2. Maximum Sum
3. Fractional Knapsack
4. Knapsack 0-1
- dp\[index]\[currWeight] = 
	- 0, if index = 0 
	- dp\[index-1]\[weight] if currWeight < weight\[index]
	- max(dp\[index-1]\[weight], dp\[index-1]\[currWeight-weight\[index]] + value\[index])