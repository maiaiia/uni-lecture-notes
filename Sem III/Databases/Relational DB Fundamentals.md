---
Class: "[[Databases]]"
date:
type: Lecture
---
# LECTURE 1 - Relational DB Fundamentals. Data Description Models

In order to be managed automatically, data must be described according to a model %%think of protocols in computer networks -- not the best example, but still%%

>[!Definition] Data Description Model
>A set of **concepts and rules** used to model data. This includes 
>- the structure of the data 
>- consistency constraints 
>- relationships with other data

>[!Definition] Database Schema
>The **schema** of the database (data structure / template) contains 
>- the data structures used to describe a collection of data stored in a database
>

The data in the collection is called an **instance** of the schema. %%So, if we were to make an analogy with OOP concepts, the schema is the class, and an instance is an object%%

| Model                     | Schema                                            |
| ------------------------- | ------------------------------------------------- |
| Relational Model          | - relation name<br>- columns ((name, type) pairs) |
| Entity-Relationship Model | - entity sets<br>- relationship sets              |

## The Relational Model

This is the main concept used to *describe data*. 

The *schema* of this model is the following:
- the relation's name
- a list of (name, type) pairs for each field (column)

>[!Example]-
>Below, we have an **instance** of the Movie **relation**. 
>
>This relation is described as `Movie(mid: int, title: string, director: string, year: integer)`
>
>| mid |               title                |     director     | year |
>| :-: | :--------------------------------: | :--------------: | :--: |
>|  1  |  Moscow Does Not Believe in Tears  | Vladimir Menshov | 1980 |
>|  2  | Close Encounters of the Third Kind | Steven Spielberg | 1977 |

## The ER Model

This is a high-level, abstract model, that is used for *semantic* reasons (i.e. when you need an initial description of data)

The *schema* of this model is the following:
- entity sets
- relationship sets

Relevant concepts: entities, attributes, relationships

| Concept              | Definition                                                                                                                        |
| :------------------- | --------------------------------------------------------------------------------------------------------------------------------- |
| **entity**           | - a piece of data, an object in the real world<br>- described by *attributes*                                                     |
| **entity set**       | - entities with the same structure<br>- defined as (name, attributes) pairs                                                       |
| **attribute**        | has: <br>- a *name*<br>- a *domain* of possible values<br>- a set of *conditions* to check correctness                            |
| **key**              | - a *restriction* defined on an *entity set*<br>- is a *set of attributes* with **distinct values** in the entity set's instances |
| **relationship**     | - association between 2 or more entities                                                                                          |
| **relationship set** | - describes *all relationships*<br>has:<br>- name<br>- entity sets used in the association<br>- descriptive attributes            |
