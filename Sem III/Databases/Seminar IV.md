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