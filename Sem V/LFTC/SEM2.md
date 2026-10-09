---
Class: "[[LFTC]]"
date: 2026-10-09
type:
---
# SEM2

## Recap
>[!Definition]
>**Token**: a word from the language; in other words, the smallest part that means something

### Token Types
- fixed:
	- reserved words: e.g. "var", "begin", 
	- operators: +, -, %, <, >=
	- separators: "(", ")", ";", "."
- programmed-defined:
	- identifiers: "temp", "sum"
	- constants: "10", "abc"


## Scanner

>[!Definition]
> A scanner(lexical analyzer): the first phase of a compiler; cuts the source program and classifies them

>[!Important]
>There are 2 types of errors - lexical and syntactic. The former target "wrong word" and the latter target "wrong syntax". Scanners can only detect the former

```
scanner:
	in: source program, tokens file 
	out: PIF (program internal form), ST (symbol table), lexical errors 

```

| Notion                      | Meaning                                                                       |
| --------------------------- | ----------------------------------------------------------------------------- |
| tokens file                 | contains the fixed words                                                      |
| ST (Symbol Table)           | identifiers and constants; each has an assigned position                      |
| PIF (Program Internal Form) | stores (token, ST_pos) pairs                                                  |
| Lexical error               | a token that matches no class (e.g. 1a, 007, ''ab, ± (not from the alphabet)) |

| Token Type                            | PIF ST_pos            |
| ------------------------------------- | --------------------- |
| identifier                            | id, position in ST    |
| constants                             | const, position in ST |
| reserved words, operators, separators | 0                     |

### Steps
1. Detect
2. Classify
3. Codify for ST

### Example1
```
 x := x + 10;
```

The sequence above contains 6 tokens:

PIF:

| token | ST_pos |
| ----- | ------ |
| id    | 1      |
| :=    | 0      |
| id    | 1      |
| +     | 0      |
| const | 2      |
| ;     | 0      |

ST:

| ST_pos | symbol |
| ------ | ------ |
| 1      | x      |
| 2      | 10     |


### Exercise1
Generate the PIF and ST for:

```
BEGIN
	READ(a);
	READ(b);
	IF a > b THEN
		WRITE(a)
	ELSE 
		WRITE(b)
END	

```


PIF:

| token | ST_pos |
| ----- | ------ |
| BEGIN | 0      |
| READ  | 0      |
| (     | 0      |
| id    | 1      |
| )     | 0      |
| ;     | 0      |
| READ  | 0      |
| (     | 0      |
| id    | 2      |
| )     | 0      |
| ;     | 0      |
| IF    | 0      |
| id    | 1      |
| >     | 0      |
| id    | 2      |
| THEN  | 0      |
| WRITE | 0      |
| (     | 0      |
| id    | 1      |
| )     | 0      |
| ELSE  | 0      |
| WRITE | 0      |
| (     | 0      |
| id    | 2      |
| )     | 0      |
| END   | 0      |

ST:

| ST_pos | symbol |
| ------ | ------ |
| 1      | a      |
| 2      | b      |

### Exercise2

```
BEGIN
	READ(x);
	y:=10;
	WHILE y > 000 DO
		BEGIN
			WRITE(3x);
			y:=y
END
```

PIF:

| token | ST_pos |
| ----- | ------ |
| BEGIN | 0      |
| READ  | 0      |
| (     | 0      |
| id    | 1      |
| )     | 0      |
| ;     | 0      |
| id    | 2      |
| :=    | 0      |
| const | 3      |
| WHILE | 0      |
| id    | 2      |
| >     | 0      |
| const | 4      |
| DO    | 0      |
| BEGIN | 0      |
| WRITE | 0      |
| (     | 0      |
3x is a LEXICAL ERROR -> token cannot be classified

ST:

| ST_pos | symbol |
| ------ | ------ |
| 1      | x      |
| 2      | y      |
| 3      | 10     |
| 4      | 0      |

## Symbol Table Representations

| id  | Representation     | Search         | Insert         |
| --- | ------------------ | -------------- | -------------- |
| 1   | unsorted table     | O(N)           | O(1)           |
| 2   | sorted table       | O(log N)       | O(N)           |
| 3   | binary search tree | O(log N)       | O(log N)       |
| 4   | hash table         | O(1) amortized | O(1) amortized |
### Sorted table
- insertion
	- keep a sorted list
	- perform binary search to find the right position
	- and shift everything by 1
### BST
left < node < right
search: start from the root

```
BEGIN 
	READ(n);
	sum := 0;
	i := 1;
		WHILE i <= n DO
			BEGIN
				sum := sum + i;
				i := i + 1
			END;
			WRITE(sum)
		END
```

![[SEM1-ST-BST-EX1]]

| ST_pos | symbol | left | right |
| ------ | ------ | ---- | ----- |
| 1      | n      | 3    | 2     |
| 2      | sum    | -    | -     |
| 3      | 0      | -    | 4     |
| 4      | i      | 5    | -     |
| 5      | 1      | -    | -     |

```
BEGIN
	READ(result)
	READ(a)
	READ(temp)
	swap:=a
	result:=temp
	WRITE(swap)
	WRITE(result)
	WRITE(temp)
END
```

![[SEM2 2026-10-09 13.19.55.excalidraw]]

| ST_pos | symbol | left | right |
| ------ | ------ | ---- | ----- |
| 1      | result | 2    | 3     |
| 2      | a      | -    | -     |
| 3      | temp   | 4    | -     |
| 4      | swap   | -    | -     |

### Hash Table
#### 1.

Let the hash function be: $$h(s)=(\sum(ASCII))\% \text{dim}$$
use *open addressing*: if $h(s)$ is occupied then keep trying to the right
and *chaining*: each position has a corresponding linked list

insertion order: a, ab, k, ba

| symbol | hash         |
| ------ | ------------ |
| a      | 97 \% 10 = 7 |
| ab     | 5            |
| k      | 7            |
| ba     | 5            |

1. Open addressing:

| 0   | 1   | 2   | 3   | 4   | 5   | 6   | 7   | 8   | 9   |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|     |     |     |     |     | ab  | ba  | a   | k   |     |

2. chaining

| slot | list    |
| ---- | ------- |
| 0    |         |
| 1    |         |
| 2    |         |
| 3    |         |
| 4    |         |
| 5    | ab - ba |
| 6    |         |
| 7    | a - k   |
| 8    |         |
| 9    |         |
#### 2.
```
BEGIN
	READ(result)
	READ(a)
	READ(temp)
	swap:=a
	result:=temp
	WRITE(swap)
	WRITE(result)
	WRITE(temp)
END
```

dim = 7

| symbol | hash              |
| ------ | ----------------- |
| result | (114+...+116)%7=6 |
| a      | 97 \% 7 = 6       |
| temp   | 4                 |
| swap   | 2                 |


| 0   | 1   | 2    | 3   | 4    | 5   | 6      |
| --- | --- | ---- | --- | ---- | --- | ------ |
| a   |     | swap |     | temp |     | result |


| slot | list       |
| ---- | ---------- |
| 0    |            |
| 1    |            |
| 2    | swap       |
| 3    |            |
| 4    | temp       |
| 5    |            |
| 6    | result - a |