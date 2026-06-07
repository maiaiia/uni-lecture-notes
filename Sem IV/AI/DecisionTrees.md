---
Class: "[[AI]]"
date:
type:
---
# Decision Trees

>[!Definition]
>Decision Trees are a special graph (bi-color, oriented tree) used to divide a collection of articles in smaller sets by successively applying some decision rules 

Decision trees have *3 node types*:
- Decision nodes 
	- possibilities of decider (a test on an attribute that must be classified)
- Hazard nodes 
	- random events outside the control of the decider
- Result nodes 
	- final states that have an utility or a label
	- leaf nodes

Each internal node corresponds to an attribute.
Each branch under a node corresponds to the value of that attribute.
Each leaf corresponds to a class.

DTs represent a disjunction of conjunctions (i.e. each path from root to leaf = one rule = one conjunction of (attribute = value) tests)
## Suitable problems
DTs handle noisy and incomplete training data.
DTs are suited for problems with:
- instances described by a fixed number of attributes, each with finite values
- objective function takes discrete values 

Problems DTs can solve:
- **binary classification**: output takes 2 values 
- **multi-class (k-class)**: output takes k values
- **regression**: each leaf holds a real value or function (not a class). input space split into decision regions by axis-parallel cuts.

## Tree construction (ID3/C4.5 algorithm)
Strategy: greedy, recursive, top-down, divide-and-conquer
1. At each node, select the best attribute to split on (AttributeSelection)
2. Branch on each possible value of that attribute, partitioning examples into subsets
3. Recurse on each subset with remaining attributes

Stop conditions (a node becomes a leaf when):
- all examples at the node belong to the same class - label leaf with that class
- no examples remain - label leaf with majority class of parent
- no attributes remain - label leaf with majority class of current node



