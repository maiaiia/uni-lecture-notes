# RAII. Smart Pointers
___
Class: [[OOP]]
___
## RAII - Resource Acquisition Is Initialization
(also known as CADR - Constructor Acquires, Destructor Releases - or SBRM - Scope Bound Resource Management)
Programming technique where the lifespan of a resource is dictated by the lifespan of an object. The resource is allocated within the object's constructor and freed in its destructor, in order to avoid memory leaks and write exception-safe code.

>[!Idea]
>Instead of having the programmer clean-up memory leaks, the *compiler* automatically calls
>- constructors to initialize objects
>- destructors, when *the object's scope is finished*

Advantages over garbage collection:
- RAII offers automatic management for different kinds of resources, not just memory
- The runtime environment is faster, as there is no separate mechanism involved (like garbage collection)

## Smart Pointers
Smart pointers are class templates. A smart pointer object is declared on the stack and initialized with a raw pointer. When it goes out of scope, its destructor is invoked.

The smart pointer *owns* the raw pointer $\Rightarrow$ it is *responsible* for its deallocation
### Types
- **std::unique_ptr**
- **std::shared_ptr**
- **std::weak_ptr**

#### 1. Unique Pointers
- retain *exclusive ownership* of objects
- unique pointers *cannot be copied*, but they can be *moved* to a new owner
#### 2. Shared Pointers
- retain *shared ownership* of objects (i.e. several shared_ptr objects may own the same object)
- a reference counter is used in order to keep track of how many "copies" of the pointer there are
- the object is deleted when the counter reaches 0 

#### 3. Weak Pointers
- allows access to the underlying object of a shared pointer *without changing the reference count*
- usually used to avoid *dependency cycles* 

>[!Tip]
>weak pointers can be used to create shared pointers -> convert using lock()

