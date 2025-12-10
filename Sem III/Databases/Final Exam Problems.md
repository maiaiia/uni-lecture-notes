---
Class: "[[Databases]]"
date: 2025-12-10
type: Lecture
---
# Final Exam Problems

The final exam will consist of 2 parts: 
1. Multiple Choice (one or multiple correct answers)
2. Open Questions (one or two problems)

It will be 1h 30 min long.

## Multiple Choice
Choose the correct answer(s) for the following questions. Each question has at least one correct answer.

>[!Question]
>In a SELECT query:
>a) the SELECT clause can contain arithmetic expressions (true)
>b) according to the conceptual evaluation strategy, ORDER BY is evaluated before GROUP BY (false)
>c) HAVING can contain row-level qualification conditions (having - condition on the aggregate functions (MIN, MAX, COUNT)) (false)
>d) DISTINCT eliminates duplicates from the answer set (true)

SELECT statement - logical processing (FROM, WHERE,...)
row-level qualification conditions -> range conditions, 

you can regard HAVING as a sub-query of the GROUP BY 

>[!Important]
>For the finals, we need to know precisely what conditions are applied for each clause 

>[!Question]
>The natural join operator $R_1*R_2$ in the relational algebra:
>a) returns a relation whose schema contains only the attributes in $R_1$ that don't appear in $R_2$ (false
>b) 
>c)

>[!Question] 
>The ANSI-SPARC architecture (for a database system), a database can have
>a) exactly one symbolic structure (false)
>b) several conceptual structures (false - only one)
>c) several external structures (true)
>d) several physical structures (false)

conceptual structure - the database schema
external structure - queries 
physical structure - where the files are saved

>[!Question]
>Consider the relation S\[A, B, C, D, E, F, G, H]
>- {A, B, C} - primary key; no other candidate keys
>- functional dependencies that are known to hold over S: {F} --> {H}, {C} --> {E, G}
>- no repeating attributes
>a) S is 

functional dependencies need to be split to be able to have a normal form
BCNF -> every attribute is dependent on a super-key and can become a primary key

>[!Question]
>For the relation given below, consider the 3 possible projections on 3 attributes. How many extra records are there in the table AB \* BC \* AC

| A   | B   | C   |
| --- | --- | --- |
| a1  | b2  | c1  |
| a1  | b1  | c2  |
| a2  | b1  | c1  |

AB\[A, B]:

| A   | B   |
| --- | --- |
| a1  | b2  |
| a1  | b1  |
| a2  | b1  |

BC

| B   | C   |
| --- | --- |
| b2  | c1  |
| b1  | c2  |
| b1  | c1  |

AC

| A   | C   |
| --- | --- |
| a1  | c1  |
| a1  | c2  |
| a2  | c1  |


AB \* BC 

| A   | B   | C   |
| --- | --- | --- |
| a1  | b2  | c1  |
| a1  | b1  | c2  |
| a1  | b1  | c1  |
| a2  | b1  | c2  |
| a2  | b1  | c1  |

AB \* BC \* AC

| A   | B   | C   |
| --- | --- | --- |
| a1  | b2  | c1  |
| a1  | b1  | c1  |
| a1  | b1  | c2  |
| a2  | b1  | c1  |

--> one extra record
## Open-Ended Questions

>[!Question]
>Write the relational algebra expression below as a SQL query
>$$\pi_{\{A,B,C\}}((\pi_{\{A,B,ID\}}(\sigma_{M=70}(R)))) \otimes_{ID=IDT1}(\pi_{\{C.IDT1\}}(\sigma_{N>5}(S)))$$ 


```sql
SELECT A, B, C FROM
	(SELECT A, B, ID 
	FROM R 
	WHERE M = 70) R
INNER JOIN 
	(SELECT C, IDT1
	FROM S
	WHERE N > 5) S
ON R.ID = S.IDT1
```

>[!Question]
>What is the result set returned by the following query? Write the tuples' values and the names of the columns
>```sql
>SELECT r1.RID, r1.A + r2.A C2, r1.A * r2.A C3
>FROM R r1 LEFT JOIN R r2 ON r1.RID = r2.RID
>WHERE r1.A > ANY (
>	SELECT B
>	FROM R
>	WHERE C < 10
>)
>```

| r1.RID | C2 = r1.A + r2.A | C3 = r1.A * r2.A |
| ------ | ---------------- | ---------------- |
| 2      | 202              | 10201            |
| 4      | 400              | 40000            |
| 5      | 400              | 40000            |
| 6      | 600              | 90000            |
Note that for the final exam it's okay to just write the correct values of the tuples (no explanations needed)

>[!Question]
>Evaluate the expressions below. $\pi$ doesn't eliminate duplicates. What's the cardinality of $T$?
>$S := \sigma_{F<13}(R)$
>$T := \pi_{\{S,RID,S.A\}}(S \otimes_{S,D=R,D}R)$

| RID | F   | D   |
| --- | --- | --- |
| 1   | 11  | 200 |
| 2   | 12  | 200 |
| 5   | 9   | 200 |
| 6   | 10  | 200 |
R - 6 records
all the T values are 200 
--> combine them with all those 6 records 

--> this will result in 6 records for each row in the table above

--> in total, there are 24 records.

>[!Question]
> What's the result set returned by the following query? Write the tuples' values and the names of the columns.

```sql
SELECT R.*
FROM
	(SELECT r1.RID, r2.A, r3.B
	FROM R r1 INNER JOIN R r2 ON r1.A = r2.B
	INNER JOIN R r3 ON r2.B > r3.D
	WHERE r1.F > 10) t
RIGHT JOIN R ON t.RID = R.RID
```

| r1.RID | r1.A | r2.B | r2.RID |
| ------ | ---- | ---- | ------ |
| 1      | 100  | 100  | 3      |
|        |      |      |        |