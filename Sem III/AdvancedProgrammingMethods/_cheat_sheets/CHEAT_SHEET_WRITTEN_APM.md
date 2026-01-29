---
Class: "[[AdvancedProgrammingMethods]]"
date: 2026-01-28
type:
---
# CHEAT_SHEET_WRITTEN_APM

## Java Serialisation. Streams 
Serialisation allows converting the state of an object into a byte stream, which can be saved into a file on the local disk or sent over the network to any other machine. The reversal of this process is called deserialisation.

## Wildcards


## Java Concurrency

>[!TODO]
>sync / async

### Semaphore

### Cyclic Barrier 

### CountDownLatch

## Exceptions

>[!TODO]
>checked / unchecked

## OOP Recap

- *composition*: the new class consists of instance objects of the existing classes
- *inheritance*: a new class is built on top of (extending) an existing class
- *polymorphism*: the ability of an entity to react differently depending on the context 
	- 3 types: *ad-hoc* (method overloading), *parametric* (generics types), *inclusion* (inheritance)
	- Java uses *late binding* (the method to be executed is decided at execution time) to call methods. **exception**: static methods (*early binding* - compile time)
- *overriding*: adding a new definition for a child method (the mechanism that allows for polymorphism)
	- the class B overrides the method m of the class A if m is defined in the class B with the same signature as in the class A 
	- for a call a.m(), where a is an object of type A, A's method m is selected
	- the `@Override` annotation is used in order to *force a compile-time verification*
	- the return type of an overriding method may be a subtype of the return type of the overridden method from the base class (*covariant return type*)
- *overloading*
	- a class may contain multiple methods with the same name but different signatures

>[!Important]
>The *super* keyword may also be used to call the overridden method (from the base class) from an overriding method (from the sub-class)

>[!Warning]
>Java does not allow operator overloading

- *abstract classes*
	- an abstract method is declared but not defined
	- only an abstract class may contain abstract methods
	- abstract classes cannot be instantiated
- *interfaces*
	- similar to what you'd find in a C header, imo
	- contain method declarations only (no implementation)
	- all methods in an interface are implicitly public
	
>[!Tip] 
>- An interface may inherit one or more interfaces
>- A class can inherit one class only but it may implement multiple interfaces

| Abstract Class                                 | Interface                                                                                                                                |
| ---------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------- |
| can have public, protected, or private methods | public methods only (before Java 8)<br>+ default and static methods (after)<br>default methods may be overridden, static methods may not |
| can have any type of fields                    | can have static and final fields only                                                                                                    |
| can have constructors                          | no constructors                                                                                                                          |
| may contain no abstract methods                | may contain no methods at all                                                                                                            |
| no instance objects                            | no instance objects                                                                                                                      |
- *downcasting*: force an object to be 

```java
Class Base{...}
Class SubBase extends Base{...}
Base objB = new Base();
SubBase objSB1 = new SubBase();
SubBase objSB2;
objB = objSB1; //correct 
objSB2 = objB; //compiler rejects it
objSB2 = (SubBase) objB; //OK -- compiler does not verify if this is correct and it trusts the programmer
```
## Misc
- access modifiers: *public*, *protected*, *private*
-  *static* fields: 
	- shared by all class instances
	- they are allocated only once in memory
	- a static *method* cannot use non-static fields; it can only use or call the static members

- *final* fields:
	- constants

