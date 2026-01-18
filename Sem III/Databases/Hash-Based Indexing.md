---
Class: "[[Databases]]"
date:
type: Lecture
---
# Hash-Based Indexing

A hashed file is associated with a search key and contains a collection of records. The files can be viewed as buckets and identified by applying the hash function to the search key.

Hash-based Indexing is ideal for *equality* selections.

## Static Hashing 
The buckets range from $0$ to $n-1$. Each bucket has a *primary page* and possibly some extra *overflow pages*.
(looks like the most basic version of a [[Hash Tables|hash table]]. no load factor; the number of buckets is static - hence the name).

>[!Warning] Issue 
>The overflow chains can get quite long.

The main problem with static hashing is the fixed number of buckets. This can be fixed either via a periodic rehash or dynamic hashing.

## Extendible Hashing 
A *dynamic hashing* technique. It uses a directory of pointers to buckets.

>[!Definition]
>The **global depth** ($gd$) is *dynamic* and it denotes the $log_2$ depth of the directory (so if $gd=2$, then the directory's length is $4$).
>
>The **local depth** ($ld$) indicates the value of the global depth as far as the current bucket is concerned (more on that when insertion is discussed)
>
>The **hash function** simply takes the last $gd$ digits in the binary representation of the key.

>[!Tip]
>Initially, $gd = ld$

### Operations

#### insertion
There are 2 possible situations when it comes to insertion:
1. There's enough room in the right bucket --> add the value --> done
2. There's not enough room in the bucket
	1. split the bucket into 2 and redistribute the entries according to the hash function
		- if $gd = ld$
			- we need to increment the global depth $gd_{new} = gd_{old} + 1$
			- this means that the directory of pointers has doubled in size
			- set each new entry in the directory to point to the corresponding bucket in the upper half of the directory (i.e. $1x_1x_2\dots x_{gd}$ will point to the same bucket as $0x_1x_2\dots x_{gd}$).
			- note that we have not added any new buckets yet. the local depth of the original buckets is unchanged
		- otherwise, proceed to the next step
	2. split the current bucket into 2 and increment the local depth of both resulting buckets
	3. redistribute the entries in the new buckets (if they still overflow the original bucket, repeat the insertion as necessary)

![[extendible_hashing]]

#### searching 
Simply compute the hash of the key and take the last $gd$ bits to identify the directory element. Then, search the corresponding bucket

#### deletion
Search for the entry and remove it.
- if the bucket is empty:
	- merge the bucket with its split image and decrement the local depth
	- if every directory element points to the same bucket as its split image
		- halve the directory
		- decrement the global depth


