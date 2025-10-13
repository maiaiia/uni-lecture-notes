# Introduction To Java
___
Class: [[MAP]]
Type: Lecture
Tags: # 
Date: October 6th, 2025
___

The `static` keyword indicates that a method / variable is common for all members of a class.

>[!Warning]
>There's no operator overloading in Java
>There are no copy constructors either

Java doesn't allow access to physical addresses --> no dangling references

>[!Warning] Memory Management Problem
>1. alloc / dealloc
>2. garbage collector
>3. 2004 alloc - compiler deallocator (RUST)

Java is **garbage collected** 
- memory deallocation is moved from static time to dynamic time
- whenever an object goes out of scope (there's no access to a specific memory area), its allocated memory is deallocated

Java does not allow multiple inheritance!!

>[!Important]
>Java allows instances of a parent class to be assigned with instances of a child class
>(the type of the RHS of an assignment must be a subtype of the LHS)
