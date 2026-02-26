---
Class: "[[DBMS]]"
date: 2026-02-26
type:
---
# DBMSLab1

## The ADO.NET Object Model

- the dataset is the equivalent of everything brought from the backend
- one per application
- kept in memory

## Connect to DB
- specify the server and the database name (initial catalog)
- specify security settings (integrated security = true -- automatically authenticate)
- create a connection object that uses the connection string


>[!Tip]
> - Open connections only when needed 
> - Close connections as soon as possible
>The SQL data adapter object does this automatically

## SQL Command Object 
- 