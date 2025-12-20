---
Class: "[[Databases]]"
date:
type:
aliases:
  - Structured Query Language
---
# SQL

## Brief History
1974 - SEQUEL language (IBM)
1976 - SEQUEL/2 $\rightarrow$ SQL (revision)
1986 - SQL adopted by ANSI
1987 - SQL adopted by ISO

## [[DDL]]
### CREATE TABLE

```sql
CREATE TABLE table_name (
	column_definition [, column_definition] ... [, table_restrictions]
)
column_definition: column_name data_type [DEFAULT value] [column_restriction]
```

| restriction                                                                                   | description                                                                              |
| --------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------- |
| `NOT NULL`                                                                                    | can't have undefined values                                                              |
| `PRIMARY KEY`                                                                                 | the column is a [[The Relational Model#Key constraints\|primary key]]                    |
| `UNIQUE`                                                                                      | the values in the column are unique (candidate key)                                      |
| `CHECK(condition)`                                                                            | the condition that must be satisfied by the column's values (evaluates to true or false) |
| `FOREIGN KEY REFERENCES parent_table\[(column_name)] \[ON UPDATE action] \[ON DELETE action]` | impose a [[The Relational Model#Foreign Key constraints\|foreign key constraint]]        |
Possible actions for a foreign key:

| action        | description                                                                                                               |
| ------------- | ------------------------------------------------------------------------------------------------------------------------- |
| `NO ACTION`   | the operation is not allowed if it violates integrity constraints                                                         |
| `SET NULL`    | the foreign key value is set to `NULL`                                                                                    |
| `SET DEFAULT` | the foreign key value is set to the default value                                                                         |
| `CASCADE`     | the delete / update is performed on the parent table, but it generates corresponding deletes / updates in the child table |
### ALTER TABLE

```sql
ALTER TABLE table_name
operation
```

Possible operations:
- upon a column
	- `ADD column_definition`
	- `{ALTER COLUMN | MODIFY} column_definition`
	- `DROP COLUMN column_name`
- on constraints
	- `ADD [CONSTRAINT constraint_name] PRIMARY KEY(column_list)`
	- `ADD [CONSTRAINT constraint_name] UNIQUE(column_list)`
	- `ADD [CONSTRAINT constraint_name] FOREIGN KEY (column_list) REFERENCES table_name[(column_list)] [ON UPDATE action] [ON DELETE action]`
	- `DROP [CONSTRAINT] constraint_name`

### DROP TABLE
```sql
DROP TABLE table_name
```
## [[DML]]

### SELECT 
The SELECT statement is a non-procedural query that evaluates to a relation (table). Data can be obtained from one or multiple sources, which can have an associated alias.

```sql
SELECT [DISTINCT] [TOP n | TOP percent PERCENT] select_list
FROM from_list [alias]
[WHERE qualification]
[GROUP BY grouping_list]
[HAVING group_qualification]
[{UNION [ALL]| INTERSECT | EXCEPT} SELECT_statement]
[ORDER BY [col1 [{ASC | DESC}]] [, col2 [{ASC | DESC}]]...]
```

>[!Info] The Conceptual Evaluation Strategy
>- compute the cross product of the tables in the **from-list**
>- remove the rows that don't meet the **qualification**
>- eliminate unwanted columns, i.e. those that don't appear in the **select-list**
>- if DISTINCT is specified, remove duplicates

| clause | contains                                        |
| ------ | ----------------------------------------------- |
| WHERE  | [[#Filter conditions]] and [[#Join conditions]] |

>[!Important] 
>**Logical Processing of a SELECT Statement** (Transact-SQL)
>1. FROM
>2. WHERE
>3. GROUP BY
>4. HAVING
>5. SELECT
>6. DISTINCT ORDER BY
>7. TOP

#### Row Aggregation 

The clauses below can be used if the select list of a SELECT statement contains at least one aggregation operator.
##### the GROUP BY clause
- optional
- a group is a collection of rows with identical values for the columns in **grouping-list**
- every row in the result of the query corresponds to a group

##### the HAVING clause
- optional
- the group-qualification has to appear in grouping-list of the GROUP BY clause OR as an argument to an aggregation operator

the having clause can be thought of as a where clause that applies to aggregated rows only
##### aggregation operators

| operator | description                                                            |
| -------- | ---------------------------------------------------------------------- |
| COUNT    | total number of entries                                                |
| AVG      | average of the values in the specified column for the matching entries |
| SUM      |                                                                        |
| MIN      |                                                                        |
| MAX      |                                                                        |

#### Join conditions
##### \[INNER] JOIN
- only include rows that match the join condition in both tables  
##### LEFT \[OUTER ]JOIN 
- include all entries from the left table; if there are matches found in the right table, fill in the relevant columns; otherwise, leave them as null
##### RIGHT \[OUTER] JOIN 
- same as left outer join but swap the tables

##### FULL \[OUTER] JOIN
- include all the rows in both tables; if there's a match between entries, fill in all the fields; otherwise, leave unknown data as null
##### NATURAL JOIN

Comparison with `INNER JOIN`

| Feature                 | Natural Join                                                   | Inner Join                                                     |
| ----------------------- | -------------------------------------------------------------- | -------------------------------------------------------------- |
| Join Condition          | Automatically matches columns with the same name and data type | Requires explicit join condition using ON clause               |
| Common Columns          | Includes only one copy of each common column                   | Includes both copies, which can lead to duplicate column names |
| Syntax Simplicity       | Shorter and simpler                                            | More flexible but needs join condition                         |
| Control Over Join Logic | Less control (relies on column names being the same)           | Full control over how tables are joined                        |
#### Misc
```sql
ORDER BY column_name [ASC | DESC] [, column_2 ...]
```



### INSERT
```sql
INSERT INTO table_name[(column_list)] VALUES (value_list)
INSERT INTO table_name[(column_list)] subquery --generated with SELECT
```

### UPDATE 

```sql
UPDATE table_name
SET column_name = expression [, column_name = expression]
[WHERE condition] 
```

### DELETE 
```sql
DELETE FROM table_name
[WHERE condition]
```

### Filter conditions
```sql
expression comparison_operator expression -- < <= = > >= <>
expression [NOT] BETWEEN valmin AND valmax
expression [NOT] LIKE pattern -- % - any substring; '_' - one character
expression IS [NOT] NULL
expression [NOT] IN (value_list / subquery)
expression comparison_operator {ANY | ALL} (subquery)
[NOT] EXISTS (subquery)
NOT condition
condition_1 AND condition_2
condition_1 OR condition_2
```


