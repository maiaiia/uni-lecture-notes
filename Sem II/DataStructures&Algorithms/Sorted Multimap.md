# Sorted Multimap (SMM)
___
Class: [[DataStructures&Algorithms]]
Type: Seminar
Tags: #datatype 
Date: April 4th, 2025
___

Implement a sorted multimap using a singly linked representation 

>[!Example]- English-Romanian dictionary
book - carte, a rezerva, publicatie
red - sange
blood - sange, neam 
>I) 
>![[Sorted Multimap 2025-04-04 12.26.21.excalidraw]]
>II)
>![[Sorted Multimap 2025-04-04 12.28.53.excalidraw]]

### Representation
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


#### SMMIterator
- current key is a pointer to a node 
- position of the current value for the current key can either be an integer or an iterator over the value list 
- An iterator is better because
	- it allows for changing the implementation of the list 
	- it's safer 
	- regardless of whether the ADT List is represented as a DA or a LL, the complexity or retrieving an object is $\Theta(1)$. Searching by position can only be done in $O(n)$ for LL

##### Operations
init, next, valid, getCurrent (maybe first)
```tabs
tab: init

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
>[!code]
>```
>subalgorithm next(it)
>	it.vlt = next(it.vlt)
>	if ! valid(it.vlt) then
>		it.ckey
>	
>
>```

tab: valid
>[!code]
>```
>subalgorithm valid(it)
>	return it.ckey $\neq$ NIL
>```

tab: getCurrent
>[!code]
>```
>subalgorithm getCurrent(it)
>	if it.ckey = NIL then
>		throw exception
>	key <- it.ckey.info.k
>	value <- getcurrent(it.vlt)
>	return <- key, value
>```

