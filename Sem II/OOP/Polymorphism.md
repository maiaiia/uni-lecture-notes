# Polymorphism
___
Class: [[OOP]]
Type: 
Tags: # 
Date: April 3rd, 2025
___

Adding the keyword `virtual` to a function belonging to a parent class and `override` to a function belonging to a child class signals that that specific function will be called with the child's implementation (the `override`)

what happens when `virtual` is added is that a new instance is created in the virtual pointer with a pointer to the function corresponding to the type of the caller

```c++
Animal* p = new Penguin{};
```

p is at compile time an animal and at run time a penguin