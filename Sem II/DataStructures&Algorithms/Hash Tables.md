# Hash Tables
___
Class: [[DataStructures&Algorithms]]
Type: Lecture
___
## General Notions
- HT is a generalisation of **direct-address tables**: $T[\text{key}] \mapsto T[\text{h(key)}]$, where $\text{h}$ is a *hash function*
- *average* complexity of search: $\theta(1)$
- *simple uniform hashing* - each key is equally likely to hash to any of the slots of the hash table, independently of where any other key has hashed to

| Notation                | Meaning                              |
| ----------------------- | ------------------------------------ |
| $m$                     | number of slots in the hash table    |
| $n$                     | number of elements in the hash table |
| $\alpha = \cfrac{n}{m}$ | load factor                          |
| $h$                     | hash function                        |

## Hash functions
- **division method**: 
	- $h(k)=k \text{ mod } m$ 
	- fast
	- good when $m$ is a *prime* number that is not close to exact powers of 2
- **mid-square method**: 
	- assume table size is $b^r$
	- write $k$ in *base $b$* and *square* it
	- then $h(k) =$ middle $r$ digits 
- **multiplication method**: 
	- $h(k)=\text{ floor }(m\cdot\text{frac}(k\cdot A))$, where
		- $A \in (0,1)$ constant
		- $\text{frac}$ denotes the fractional part of a number
	- typically used for $m$ power of 2
- **universal hashing**
	- have a collection $\mathcal{H}$ of hash functions
		- examples:
			- $h_{a,b}(k)=((a\cdot k + b)\text{ mod }p)\text{ mod }m$, where $p$ prime and $a,b\in\overline{1,p-1}$ 
			- $h(k)=\sum_{i=1}^r k_i\cdot x_i \text{ mod } m$, where $k_i$ is the $i^{th}$ digit of $k$ in base $m$ and $(x_i)_{i\in\overline{1,r}}\in\overline{0,m-1}$ is a *fixed sequence* of random numbers
	- the collection is said to be *universal* if the chance of collision between 2 distinct numbers is $\cfrac{1}{m}$

|               | Division Method    | Mid-square Method      | Multiplication Method                         | Universal Hashing                     |
| ------------- | ------------------ | ---------------------- | --------------------------------------------- | ------------------------------------- |
| Hash function | $k \text{ mod } m$ | middle digits of $k^2$ | $\text{ floor }(m\cdot\text{frac}(k\cdot A))$ | collection of multiple hash functions |


## Collision Resolution Methods