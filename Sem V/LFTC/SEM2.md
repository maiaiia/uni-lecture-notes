---
Class: "[[LFTC]]"
date: 2026-10-09
type:
---
# SEM2

>[!Definition]
>**Token**: a word from the language; in other words, the smallest part that means something

## Token Types
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

```
scanner:
	in: source program, tokens file 
	out: PIF (program internal form), ST (symbol table), lexical errors 

```

| Notion                      | Meaning                                                  |
| --------------------------- | -------------------------------------------------------- |
| tokens file                 | contains the fixed words                                 |
| ST (Symbol Table)           | identifiers and constants; each has an assigned position |
| PIF (Program Internal Form) |                                                          |