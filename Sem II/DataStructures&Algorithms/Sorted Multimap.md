# Sorted Multimap (SMM)
___
Class: [[DataStructures&Algorithms]]
Type: Seminar
Tags: #datatype 
Date: April 4th, 2025
___

Implement a sorted multimap using a singly linked representation 

>[!Example] Example: English-Romanian dictionary
book - carte, a rezerva, publicatie
red - sange
blood - sange, neam 
>I) 
>![[Sorted Multimap 2025-04-04 12.26.21.excalidraw]]
>II)
>![[Sorted Multimap 2025-04-04 12.28.53.excalidraw]]

## 2nd Representation
The list of values can be represented using:
- Data Structures: [[ADT Dynamic Array|DA]], SLL, DLL, 
- Containers: [[ADT Bag|Bag]], List, Vector
We sill use a List
Interface
```tabs
tab: SMM
head: $\uparrow$ SMMNode
size: Integer (optional)
rel: Relation

tab: TElem 
(information part of the node)
K: TKey
vl: List

tab: SMMNode
info: TElem
next: $\uparrow$ SMMNode

tab: SMMIterator
smm: SMM
ckey: $\uparrow$SMMNode
vlt: ListIterator
```

### SMMIterator
- current key is a pointer to a node 
- position of the current value for the current key can either be an integer or an iterator over the value list 
- An iterator is better because
	- it allows for changing the implementation of the list 
	- it's safer 
	- regardless of whether the ADT List is represented as a DA or a LL, the complexity or retrieving an object is $\Theta(1)$. Searching by position can only be done in $O(n)$ for LL

#### Operations
init, next, valid, getCurrent (maybe first)
```tabs
tab: init

Complexity: $\Theta(1)$
>[!code]
>```
>subalgorithm init(it, smm)
>	it.smm <- smm
>	it.ckey <- smm.head
>    if smm.head != NIL then
>	   iterator([smm.head].info.vl, it.vlt)
>    done
>```
	
tab: next
Complexity: $\Theta(1)$
>[!code]
>```
>subalgorithm next(it)
>	if it.ckey = NIL then
>		throw exception
>	next(it.vlt)
>	if ! valid(it.vlt) then
>		it.ckey <- [it.ckey].next
>		if it.ckey != NIL then
>			iterator([it.ckey].info.vl,it.vlt)
>	
>
>```

tab: valid
Complexity: $\Theta(1)$
>[!code]
>```
>subalgorithm valid(it)
>	return it.ckey != NIL
>```

tab: getCurrent
Complexity: $\Theta(1)$
>[!code]
>```
>subalgorithm getCurrent(it)
>	if it.ckey = NIL then
>		throw exception
>	key <- it.ckey.info.k
>	value <- getcurrent(it.vlt)
>	return <- key, value
>```

```

### SMM

````tabs

tab: searchNode(smm,k,kNode,prevNode)
Complexity: $O(\text{number of unique keys})$
>[!Code]
>```
>subalgorithm searchNode(smm,k,kNode,prevNode)
>	aux <- smm.head
>	prev <- NIL
>	found <- false
>	while !found and aux != NIL smm.rel([aux].info.k,k)=true ex
>		if [aux].info.k = k
>			found<-true
>		else 
>			prev <- aux
>			aux <- [aux].next
>
>	prevNode <- prev
>	if found then:
>		kNode <- aux
>	else
>		kNode <- NIL
>```

tab: add(k,v)
search for node with k
if found -> add to value list 
if !found -> insert a new node - we need the previous node

Complexity: $O(\text{nr. of pairs})$
>[!Code]
>```
>subalgorithm add(smm,k,v)
>	searchnode(smm,k,kNode,prevNode)
>	if kNode = NIL then
>		newNode <- allocate()
>		[newNode].info.k <- k
>		init([newNode].info.vl)
>		addToEnd([newNode].info.vl,v)
>		if prevNode != NIL then
>			[newNode].next <- [prevNode].next
>			[prevNode].next <- newNode
>		else 
>			[newNode].next <- smm.head
>			smm.head <- newNode
>	else
>		addToEnd([kNode].info.vl,v)
>	smm.size <- smm.size + 1
>	
>```

tab: remove(k,v)
search for node with k
if found  
- remove v from valuelist
- if valueList is empty, remove the node - we need the previous node

if !found -> return false

````

