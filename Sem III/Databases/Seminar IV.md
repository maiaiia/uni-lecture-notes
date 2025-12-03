# Seminar IV
___
Class: [[Databases]]
Type: 
Tags: # 
Date: December 4th, 2025
___

## Bonus Homework
Explain how to write a merge statement without using the `MERGE` keyword

The `MERGE` statement runs `INSERT`, `UPDATE`, or `DELETE` operations on a target table from the results of a join with a source table. It was first introduced to simplify messy code.

Syntax:
```sql
MERGE
    [ INTO ] <target_table> [ WITH ( <merge_hint> ) ] [ [ AS ] table_alias ]
    USING <table_source> [ [ AS ] table_alias ]
    ON <merge_search_condition>
    [ WHEN MATCHED [ AND <clause_search_condition> ]
        THEN <merge_matched> ] [ ...n ]
    [ WHEN NOT MATCHED [ BY TARGET ] [ AND <clause_search_condition> ]
        THEN <merge_not_matched> ]
    [ WHEN NOT MATCHED BY SOURCE [ AND <clause_search_condition> ]
        THEN <merge_matched> ] [ ...n ]
    [ <output_clause> ]
```

`<merge_matched>` specifies the `UPDATE` / `DELETE` action that's applied to all rows of the `target_table` that don\t match the rows returned by `table_source` on the `<merge_search_condition>`. 
- `UPDATE SET <set_clause>`
- `DELETE`

`<merge_not_matched>` specifies the values to insert into the target table.
- `(column_list)`
- `VALUES (values_list)`
- `DEFAULT VALUES` - forces the inserted row to contain the default values defined for each column

I'll use the example from seminar III to demonstrate how the merge statement can be replaced by insert / update / delete statements

```sql
------- MERGE STATEMENT --------
INSERT INTO Grades(gid, course, student, examRoom, grade, gradedAt) VALUES
    (1, 'Databases', 'George Bacovia', 'A321', NULL, NULL),
    (2, 'Databases', 'George Bacovia', NULL, 9.56, NULL),
    (3, 'Databases', 'George Bacovia', NULL, NULL, '1901-10-11'),
    (4, 'Computer Networks', 'George Bacovia', 'L304', NULL, NULL),
    (5, 'Computer Networks', 'George Bacovia', NULL, 8.37, NULL),
    (6, 'Computer Networks', 'George Bacovia', NULL, NULL, '1901-11-27'),
    (7, 'Databases', 'Lucian Blaga', 'A311', NULL, NULL),
    (8, 'Databases', 'Lucian Blaga', NULL, 9.07, NULL),
    (9, 'Databases', 'Lucian Blaga', NULL, NULL, '1901-12-10')

MERGE Grades G USING (
    SELECT MAX(gid), course, student, MAX(examRoom), MAX(grade), MAX(gradedAt)
    FROM Grades 
    GROUP BY course, student
) G2(gid, course, student, examRoom, grade, gradedAt) ON G.gid = G2.gid
WHEN MATCHED THEN UPDATE SET 
    G.course = G2.course,
    G.student = G2.student,
    G.examRoom = G2.examRoom,
    G.grade = G2.grade,
    G.gradedAt = G2.gradedAt
WHEN NOT MATCHED BY SOURCE THEN DELETE;

SELECT * FROM Grades
GO  
```


```sql

```

