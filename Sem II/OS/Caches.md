# Caches
___
Class: [[OS]]
Type: Lecture
Tags: # 
Date: June 5th, 2025
___
![[storageUnitsSpeed]]

>[!Tip] Principle of locality
> When a specific page is requested, the likelihood of a neighbouring page to be requested afterwards is really high. (so load it in the cache memory in advance)

## Organization
- Associative - list of pages and their locations
- Direct Map (like a hash map)
	- cache location is page number % cache size
	- advantage: fast and simple
	- disadvantages
		- [[collision|collisions]]
		- threshing (when 2 caches have the same hash and are accessed alternatively)
- Set-Associative
	- A combination of both
	- Use a modulo to find a set of caches and within that set, have an associative organisation

| Organization Type | Advantages                         | Disadvantages                          |
| ----------------- | ---------------------------------- | -------------------------------------- |
| Associative       | No Collisio                        | Slow                                   |
| Direct Map        | F                                  | [[collision\|collisions]]<br>Threshing |
| Set-Associative   | Decent speed<br>No collisions ions |                                        |
