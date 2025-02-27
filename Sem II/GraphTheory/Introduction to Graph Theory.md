# Introduction to Graph Theory
___
Class: [[GraphTheory]]
Type: Seminar&Lecture
Tags: # 
Date: February 25th, 2025
Teacher: [[Radu Lupsa]]
___

## Def 
A graph $G = (X,E)$ is defined as the union between a *finite* set of **vertices** ($X$) and **edges** ($E$) between said vertices
There are 4 types of graphs:
- directed - edges are ordered pairs: $E \subseteq X \cdot X$
- undirected - edges are unordered pairs: $E \subseteq \{(x,y)|x,y \in X, x \neq y\}$

## Applications 
### Car navigation 
unidirectional / bidirectional streets, turn restrictions
![[carnavigation]]
strategy for handling turn restrictions:
1. Split certain nodes into multiple nodes to illustrate the restrictions
### Subways
the cost of each edge is 1, the cost of changing lines is 3
![[subway]]
### Plane to New York

| Departure City | Departure Time | Arrival City | Arrival Time | Cost |
| -------------- | -------------- | ------------ | ------------ | ---- |
| CLJ            | 4:00           | MUC          | 6:00         | $300 |
| CLJ            | 11:00          | MUC          | 13:00        | $100 |
| MUC            | 7:00           | JFK          | 14:00        | $600 |
| MUC            | 14:00          | JFK          | 21:00        | $900 |

### Wolf, goat, cabbage ![[Introduction to Graph Theory 2025-02-25 19.46.13.excalidraw]]
You can't leave wolf + goat or goat + cabbage together. You can only transport one at a time 
Each node represents the state of the islands 
![[wolf_goat_cabbage]]
### 15-puzzle 
