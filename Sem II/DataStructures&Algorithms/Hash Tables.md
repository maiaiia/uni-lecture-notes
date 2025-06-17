# Hash Tables
___
Class: [[DataStructures&Algorithms]]
Type: Lecture
Links: [[collision]]
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
	- have a collection $\mathcal{H}$ of hash functions and *randomly choose one at the beginning*
		- examples:
			- $h_{a,b}(k)=((a\cdot k + b)\text{ mod }p)\text{ mod }m$, where $p$ prime and $a,b\in\overline{1,p-1}$ 
			- $h(k)=\sum_{i=1}^r k_i\cdot x_i \text{ mod } m$, where $k_i$ is the $i^{th}$ digit of $k$ in base $m$ and $(x_i)_{i\in\overline{1,r}}\in\overline{0,m-1}$ is a *fixed sequence* of random numbers
	- the collection is said to be *universal* if the chance of collision between 2 distinct numbers is $\cfrac{1}{m}$

|               | Division Method    | Mid-square Method      | Multiplication Method                         | Universal Hashing                     |
| ------------- | ------------------ | ---------------------- | --------------------------------------------- | ------------------------------------- |
| Hash function | $k \text{ mod } m$ | middle digits of $k^2$ | $\text{ floor }(m\cdot\text{frac}(k\cdot A))$ | collection of multiple hash functions |
## Collision Resolution Methods

|                   |         Separate Chaining         |        Coalesced Chaining         |          Open addressing          |
| :---------------: | :-------------------------------: | :-------------------------------: | :-------------------------------: |
|  implemented as   |    collection of linked lists     |       linked list on array        |               array               |
|     $\alpha$      |             any range             |             at most 1             |             at most 1             |
| insert complexity |            $\Theta(1)$            | $\Theta(1)$ AVG<br>$\Theta(m)$ WC | $\Theta(1)$ AVG<br>$\Theta(n)$ WC |
| search complexity | $\Theta(1)$ AVG<br>$\Theta(n)$ WC | $\Theta(1)$ AVG<br>$\Theta(n)$ WC | $\Theta(1)$ AVG<br>$\Theta(n)$ WC |
| remove complexity | $\Theta(1)$ AVG<br>$\Theta(n)$ WC |   $\Theta(1)$ AVG<br>$O(n)$ WC    | $\Theta(1)$ AVG<br>$\Theta(n)$ WC |
### Separate Chaining
- Each slot from the hash table contains a linked list, with elements that hash to that slot
- suitable for sorted containers (ish) - simply have the linked lists be SLL
- load factor can technically be in any range but, in order to preserve $\theta(1)$ complexity (amortised), keep $\alpha \in (0,1)$ by performing resizes + rehashes
![[17.1HashTableSeparateChaining.pdf]]
### Coalesced Chaining
- similar to a linked list on array %%TODO make link to that%% - have a values array, a next array and a firstEmpty variable
- when the position where an element should be placed is occupied, place it into any empty position and set the $\text{next}$ link
>[!Warning]
> insertion can happen at any free empty slot, so **don't** keep the free spaces linked
- $\alpha$ can be *at most 1* 
![[17.2HashTableCoalescedChaining.pdf]]
### Open addressing
- For a certain element, positions are successively generated and checked (probed) until an available position is found
-  $h(k) \mapsto h(k,p)$, where $p$ is the *probe number* (i.e. the order of the check) 
#### Types of probing
- Ideally, we would like to have a hash function which can generate all the $m!$ possible permutations (but this is not possible in practice)
- The *probe sequence* should also be a permutation of the hash table positions, so that, eventually, **every slot is considered**
- **Linear Probing**
	- $h(k,i)=(h'(k)+i) \text{ mod } m$ 
	- probe sequence: $h'(k), h'(k)+1,...,0,1,...,h'(k)-1$;  $h'$ - simple hash function
	- downsides:
		- only $m$ distinct probe sequences
		- *primary clustering* - long runs of occupied slots
- **Quadratic probing**
	- $h(k,i)=(h'(k)+c_1\cdot i+c_2\cdot i^2) \text{ mod } m$; $h'$ - simple hash function
	- downsides:
		- performance is sensitive to the values of $m,c_1,c_2$ 
		- *secondary clustering*: 2 elements with identical probe positions will have an identical probe sequence
		- only $m$ distinct probe sequences
	- good values for the constants (probe sequence will always be a permutation)
		- $m$ power of 2; $c_1 = c_2 = 0.5$
		- $m$ prime; $c_1=0, c_2=(-1)^i$
- **Double hashing**
	- $h(k,i)=(h'(k)+i\cdot h''(k)) \text{ mod } m$
	- $h'$ should *never return the value 0*
	- $h'(k)$ and $h''(k)$ should always be *relatively primes*
		- $m$ power of 2;  $h''$ always returns an odd number
		- $m$ prime; $Im(h'') \subseteq \overline{1,m-1}$
	- probe sequences are different even if $h(k_1,0) = h(k_2,0)$
	- $\approx m^2$ permutations generated 
![[17.3HashTableOpenAddressing.pdf]]

## Other types of hash tables
### Cuckoo hashing 
- 2 hash tables of the *same size*
	- each has its own hash function (*2 different hash functions*)
- an element must be on the correct position in either one of the 2 tables
- SEARCH: simply check both positions
- DELETE: simply set the position where the element was found to be empty
- INSERT:
	- compute the position in the first hash table
		- if it's empty, add the element there
		- if it's occupied
			- *kick out the current element* and place the new element into the first hash table
			- compute the position of the kicked element into the second table
				- if the position is empty, place the element there
				- otherwise, kick the current element and call insert the kicked element in the first table 
	- if, throughout this process, we get back the *same location with the same key* $\Rightarrow$ resize and rehash
>[!Tip]
 >keep each table *more than half empty* ($\alpha$ < 0.5) so that it becomes very unlikely that more than $O(log_2n)$ elements are moved (i.e. that cycles are formed)
### Perfect hashing
- good for when the elements of the table are known beforehand
- method:
	- use a hash table of size $N$
	- instead of using linked lists for collision resolution, each element of the hash table is another hash table (*secondary hash table*)
	- make each secondary hash table of size $n_j^2$, where $n_j$ is the number of elements from this hash table
	- each secondary hash table will be constructed with a different hash function, and will be reconstructed until it is collision free
- it can be shown that the total space needed is at most $2N$
>[!Warning]
>In order to use perfect hashing, we need to have static keys: once the table is built, no new elements can be added
### Linked hash table
- data structure with a *predictable* iteration order (the one in which elements were inserted)
- separate chaining + DLL (doubly linked s.t. remove can be done in $\Theta(1)$)
![[17.4LinkedHashTable.pdf]]
