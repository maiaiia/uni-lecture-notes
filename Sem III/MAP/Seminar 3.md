# Seminar 3
___
Class: [[MAP]]
Type: 
Tags: # 
Date: October 17th, 2025
___

```java
int v;        //(1)
v = 2;        //(2)
Print(v);     //(3)
```


|  Execution Stack  |    Symbol Table     |     Out     |
| :---------------: | :-----------------: | :---------: |
| {$(1), (2), (3)$} |     $\emptyset$     | $\emptyset$ |
| {(1) I (2), (3)}  |     $\emptyset$     | $\emptyset$ |
|    {(2), (3)}     | {v $\rightarrow$ 0} | $\emptyset$ |
|   {(2) \| (3)}    | {v $\rightarrow$ 0} | $\emptyset$ |
|       {(3)}       | {v $\rightarrow$ 0} | $\emptyset$ |
|       {(3)}       | {v $\rightarrow$ 2} | $\emptyset$ |
|    $\emptyset$    | {v $\rightarrow$ 2} |      2      |

```java
int a;
a = 2 + 3 * 5;
int b;
b = a - 4 / 2 + 7;
Print(b);
```

|          Execution Stack          |               Symbol Table               |     Out     |
| :-------------------------------: | :--------------------------------------: | :---------: |
| {(1) \| (2) \| (3) \| (4) \| (5)} |               $\emptyset$                | $\emptyset$ |
|    {(2) \| (3) \| (4) \| (5)}     |           {a $\rightarrow$ 0}            | $\emptyset$ |
|        {(3) \| (4) \| (5)}        |           {a $\rightarrow$ 17}           | $\emptyset$ |
|           {(4) \| (5)}            | {a $\rightarrow$ 17, b $\rightarrow$ 0}  | $\emptyset$ |
|               {(5)}               | {a $\rightarrow$ 17, b $\rightarrow$ 22} | $\emptyset$ |
|                {}                 | {a $\rightarrow$ 17, b $\rightarrow$ 22} |    {22}     |
```java
bool a;       //(1)
a = false;    //(2)
int v;        //(3)
If a Then v = 2 Else v = 3;
//(4)     (5)         (6) 
Print(v);     //(7)
```

|          Execution Stack           |              Symbol Table              |     Out     |
| :--------------------------------: | :------------------------------------: | :---------: |
| {(1) \| (2) \| (3) \| (4) \|  (7)} |              $\emptyset$               | $\emptyset$ |
|    {(2) \| (3) \| (4) \|  (7)}     |          {a $\rightarrow$ F}           | $\emptyset$ |
|        {(3) \| (4) \| (7)}         |          {a $\rightarrow$ F}           | $\emptyset$ |
|           {(4) \| (7) }            | {a $\rightarrow$ F, v $\rightarrow$ 0} | $\emptyset$ |
|            {(6) \| (7)}            |                   {}                   | $\emptyset$ |
|            {(6) \| (7)}            |                                        |    {22}     |