---
Class: "[[DBMS]]"
date: 2026-05-29
type:
---
# Costs

| Algorithm                       | Variables | Total Cost |
| ------------------------------- | --------- | ---------- |
| Simple Nested Loops Join        |           |            |
| Page-Oriented Nested Loops Join |           |            |
| Block Nested Loops Join         |           |            |
| Index Nested Loops Join Hash    |           |            |
| Index Nested Loops Join B-Tree  |           |            |
| Simple Two-Way Merge Sort       |           |            |
| External Merge Sort             |           |            |
|                                 |           |            |
|                                 |           |            |


| Condition                  | Specifications                                        | Reduction Factor                                                         |
| -------------------------- | ----------------------------------------------------- | ------------------------------------------------------------------------ |
| column = value             | index I on column                                     | $\cfrac{1}{\text{NKeys}(I)}$ <br>(number of distinct key values for I)   |
| column = value             | no index                                              | $\cfrac{1}{10}$                                                          |
| column1 = column 2         | indexes on both columns                               | $\cfrac{1}{MAX(\text{NKeys}(I_1), \text{NKeys}(I_2))}$                   |
| column1 = column2          | only one index                                        | $\cfrac{1}{\text{NKeys}(I)}$                                             |
| column1 = column2          | no indexes                                            | $\cfrac{1}{10}$                                                          |
| column > value             | index on column                                       | $\cfrac{\text{IHigh}(I)-\text{value}}{\text{IHigh}(I) - \text{ILow}(I)}$ |
| column > value             | no index on column or column not of n arihtmetic type | a value less than 0.5 is arbitrarily chosen                              |
| column IN (list of values) | -                                                     | $RF_{column = value} \cdot$ number of items in list (at most 0.5)        |
| NOT condition              | -                                                     | $1 - RF_{condition}$                                                     |

