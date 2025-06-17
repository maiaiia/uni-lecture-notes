# Sorting Algorithms
___
Class: [[DataStructures&Algorithms]]
Type: Seminar
Tags: #Sorting [[src/Sem I/FP/Sorting Algorithms|Sorting Algorithms]]
Date: April 16th, 2025
___
## Bucket Sort
^5d23b2
### Idea
Sequence $S$ node of $n \text{ (key,value)}$ pairs; keys are $\in \mathbb{N}$ belonging to $[0,N]$
Sort $S$ by the keys 
$S: (7,d),(1,c),(3,b),(7,g),(3,a),(7,e) \Rightarrow (1,c)(3,b)(3,a)(7,d)(7,g)(7,e)$
![[Bucket Sort 2025-04-16 12.12.51.excalidraw]]

>[!tip]  BucketSort is a [[stable sorting]] algorithm

#### ADT Sequence
```tabs 
tab: ADT Sequence
init(s) - $\Theta(1)$
addToEnd(s,<k,v>) - $\Theta(1)$
removeFirst(s) - $\Theta(1)$
isEmpty(s) - $\Theta(1)$
```

### Code

>[!code] subalg BucketSort(S,N):
>```pseudocode
> subalg BucketSort(S,N) is:
> 	@define B as an array of N empty sequences
> 	while not isEmpty(S)
> 		<k,v> <- removeFirst(S)
> 		addToEnd(B[k],<k,v>)
> 	end while
> 	for i <- 0, N execute:
> 		while not isEmpty(B[i])
> 			<k,v> <- removeFirst(B[i])
> 			addToEnd(S, <k,v>)
> 		end while
> 	end for
> end subalg
>```

### Complexity
 If we consider n - no. of pairs and N - value interval, then the complexity is:
 -	$\Theta(n)$ - while loop
 -	$\Theta(n+N)$ - for loop 
 
Total complexity: $\Theta(n+N)$

## Lexicographic Sort

### Idea 
d - tuples $(x_1,...,x_d)$
$(x_1,...,x_d) < (y_1,...,y_d) \iff (x_1 < y_1) \text{ or } (x_1=y_1 \text{ and } (x_2,...,x_d) < (y_2,...,y_d))$

<u>We will use</u>:
- $R_i$ - a relation which can compare two tuples considering only dimension $i$
- $\text{stableSort(S,R)}$ - a stable sort algorithm which uses a relation 
### Code

>[!code] subalg LexicographicSort(S,R,D):
>```pseudocode
> subalg LexicographicSort(S,R,D) is:
> 	for i <- d,1,-1 execute:
> 		stableSort(S,R)
> 	end for
> end subalg
>```

^49e290

### Complexity
$\Theta(d \cdot T(n))$, where 
- $T(n)$ is the complexity of $\text{stableSort}$

### Example
initial sequence: (7,4,6)(5,1,5)(2,4,6)(2,1,4)(3,2,4)

| d   | sequence                            |
| --- | ----------------------------------- |
| 3   | (2,1,4)(3,2,4)(5,1,5)(7,4,6)(2,4,6) |
| 2   | (2,1,4)(5,1,5)(3,2,4)(7,4,6)(2,4,6) |
| 1   | (2,1,4)(2,4,6)(3,2,4)(5,1,5)(7,4,6) |

## Radix Sort
### Idea 
A version of [[src/Sem II/DataStructures&Algorithms/Sorting Algorithms#^49e290|LexicographicSort]], which uses [[src/Sem II/DataStructures&Algorithms/Sorting Algorithms#^5d23b2|BucketSort]]. It decomposes words into tuples, each corresponding to a digit 

### Complexity
$\Theta(d \cdot (N + n)) \approx \Theta(d \cdot n) \approx \Theta(n)$

