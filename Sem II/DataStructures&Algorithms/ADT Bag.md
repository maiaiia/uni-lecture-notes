# ADT Bag
___
Class: [[DataStructures&Algorithms]]
Type: Seminar
Tags: #datatype 
Date: March 7th, 2025
___
## Characteristics 
Elements not unique 
No positions 
## Domain
$\mathcal{B} = \{b \text{ } | \text{ } b$ is a bag with elements of type `Telem`$\}$
## Interface 
- **init**($b$)
	- pre: None 
	- post: $b \in \mathcal{B}$, $b$ is an empty `bag` 
- **dest**($b$)
	- pre: $b$ is a `bag`
	- post: $b$ was destroyed 
- **add**($b$, $e$) 
	- pre: $b$ is a `bag`, $e$ is a `Telem`
	- post: $b' = b\oplus e$; $b' \in \mathcal{B}$
- **remove**($b$, $e$)
	- pre: $b$ is a `bag`, $e$ is a `Telem`, %%for this implementation only!!%% $e \in b$
	- post: $b' \in \mathcal{B}; b' = b \ominus e$ (one occurrence of $e$ removed from $b$)
	- throws: an exception if $e \notin b$ 
- **search**($b$, $e$)
	- pre: $b \in \mathcal{B}, e -$ `Telem`
	- post: search $\leftarrow \begin{cases} True \text{ if } e \in b \\ False \text{ otherwise}\end{cases}$ 
- **iterator**($b$, $it$)
	- pre: $b \in \mathcal{B}$
	- post: $it \in \mathcal{I}$ (is an iterator) and $b$, the current element of $it$ is one element of $b$ or, if $b$ is empty, it is invalid
- **size**($b$)
	- pre: $b \in \mathcal{B}$
	- post: $size \leftarrow$ the number of elements in $b$
- **nrOccurrences**($b$, $e$)
	- pre: $b$ is a `bag`, $e$ is a `Telem`
	- post: $nrOccurrences \leftarrow$ the number of occurrences of $e$ in $b$ 

## Bag Iterator

### Domain
$\mathcal{I} = \{it \text{ } | \text{ } it$ is an iterator over a bag $b\}$ 
### Interface 
- **init**
	- pre: $b \in \mathcal{B}$
	- post: $it \in \mathcal{I}$, $it$ is an iterator over $b$, the current element of it is one element of $b$, or, if $b$ is empty, it is invalid 
- **valid** 
	- pre: $it \in \mathcal{I}$ 
	- post: $valid \leftarrow \begin{cases} True \text{ if the current element in} it \text{ is an element of } b \\ False \text{ otherwise} \end{cases}$
- **getCurrent**($it$)
	- pre: $it \in \mathcal{I}$ and $valid(it)$
	- post: $getCurrent \leftarrow$ the current element from $it$ 
	- throws: an exception if the iteration is not valid 
- **next**($it$)
	- pre: $it \in \mathcal{I}$ and $valid(it)$ 
	- post: $it' \in \mathcal{I}$, the current element from $it'$ is the next element from the bag, or, if there are no more elements, $valid(it') = False$ 
	- throws: exception if $it$ is not valid

## Representation
1. Simple Representation
	- Use a list of elements
	- iterator: currentElement - position of the current element in the list 
2. Element + Frequency Representation
	- Use 2 lists (a list of elements and a list of frequencies)
	- iterator: currentElement - position in list of elements; currentFrequency - number of values in currentElement's position that have already been iterated through
## Implementation 
- First Representation
Assume `Bag`, `BagIterator` classes
```python
def CreateIntBag():
	b = Bag()
	return b

def CreateStringBag():
	b = Bag()
	return b 

def printBag():
	it = b.iterator()
	while it.valid():
		e = it.getCurrent()
		print(e)
		it.next()

def main():
	b1 = createIntBag()
	printBag(b1)

```

Second Representation 
```python 
class BagFr:
	def __init__(self):
		self.__values = []
		self.__frequencies = []
		
	def add(self, value):
		for i in range(0, len(self.__values)):
			if self.__values[i] == value:
				self.__frequencies[i] += 1
				return
		self.__values.append(value)
		self.__frequencies.append(1)
		
	def remove(self, value):
		for i in range(0, len(self.__values)):
			if self.__values[i] == value:
				self.__frequencies[i] -= 1;
				if self.__frequencies[i] == 0:
					current_length = len(self.__values)
					self.__values[i] = self.__values[current_length - 1]
					self.__frequencies = self.__frequencies[current_length - 1]
					self.__values.pop_back()
					self.__frequencies.pop_back()
				return 
		raise ValueError("Value not in the bag.")
		
	def search(self, value):
		if value in self.__values:
			return True 
		return False 
		
	def size(self):
		return sum(self.__frequencies)
		
	def nrOccurrences(self, value):
		for i in range(0, len(self.__values)):
			if self.__values[i] == value:
				return self.__frequencies[i]
		return 0 
	
	def iterator(self):
		return BagFrIterator(self)

class BagFrIterator:
	def __init__(self, bag):
		self.__bag = bag 
	#TODO the rest of the implementation

```
