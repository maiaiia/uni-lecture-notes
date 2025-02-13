# Classes
___
Class: [[ FP]]
Type: Lecture
Tags: #datatype 
Date: November 21st 2024
Teacher: [[Arthur Molnar]]
___

## Basic Structure of a Class 
Classes are used as blueprints for creating objects with a user-defined [[data type]]
![[datatypes]]
## Fields
The fields of a class can be 
- *public*: accessible outside the class 
- *protected*: accessible within the class or derived classes, denoted by an underscore
- *private*: accessible only within the class, denoted by two underscores

>[!important] The computer's memory stores a copy of each set of class fields for each object, but only one copy of each method

## Magic Methods

### Object instantiation
- **\_\_init__**
All classes have a **constructor** (if not defined by the user, the constructors are implicit)
>[!important] in python, each class can only have **one** instructor, defined using the keyword \_\_init__

### String representations
- **\_\_str__**  
The str method is called when printing an object from the class 

- **\_\_repr__**
Similar to *\_\_str__*, but it is targeted at the *developer*, in order to obtain a string that can later be used to *construct an identical instance* of the object from the string 
```python 
class Person:
    def __init__(self, name, age)
    self.name = name
    self.age = age

    def __repr__(self):
        return f"{type(self).__name__}(name='{self.name}', age={self.age})"


john = Person("John Doe", 35) 
# repr(John) returns ```
"Person(name='John Doe', age=35)"

```

### Operator Overloading
#### Arithmetic operators

| Operator | Method                                |
| -------- | ------------------------------------- |
| +        | **\_\_add__**(self, other)            |
| -        | **\_\_sub__**(self, other)            |
| *        | **\_\_mul__**(self, other)            |
| /        | **\_\_truediv__**(self, other)        |
| //       | **\_\_floordiv__**(self, other)       |
| %        | **\_\_mod__**(self, other)            |
| **       | **\_\_pow__**(self, other\[, modulo]) |


>[!tip] the second operator (i.e. *other*) should be the same type as self or a compatible type

>[!important]- note that for each of these operators, one can also implement its **augumented assignment**
>Structure: \_\_i"arithmetic_op"\_\_
>Example: \_\_iadd__, \_\_isub__, \_\_imul__ etc


Example
```python
class Number:
    def __init__(self, value):
        self.value = value

    def __add__(self, other):
        print("__add__ called")
        if isinstance(other, Number):
            return Number(self.value + other.value)
        elif isinstance(other, int | float):
            return Number(self.value + other)
        else:
            raise TypeError("unsupported operand type for +")

    def __radd__(self, other): #this function is called if the first operator is not a Number, but the second one is
        print("__radd__ called")
        return self.__add__(other)
        
```

```python
>>> from number import Number

>>> five = Number(5)
>>> ten = Number(10)

>>> fifteen = five + ten
__add__ called
>>> fifteen.value
15

>>> six = five + 1
__add__ called
>>> six.value
6

>>> twelve = 2 + ten
__radd__ called
__add__ called
>>> twelve.value
12
```
note that there is a rhs equivalent for each of the aforementioned operation s 

#### Comparison  Operators
| Operator | Method                    |
| -------- | ------------------------- |
| <        | **\_\_lt__**(self, other) |
| <=       | **\_\_le__**(self, other) |
| >        | **\_\_gt__**(self, other) |
| >=       | **\_\_ge__**(self, other) |
| ==       | **\_\_eq__**(self, other) |
| !=       | **\_\_ne__**(self, other) |

```python
class Rectangle:
    def __init__(self, height, width):
        self.height = height
        self.width = width

    def area(self):
        return self.height * self.width

    def __eq__(self, other):
        return self.area() == other.area()

    def __lt__(self, other):
        return self.area() < other.area()

    def __gt__(self, other):
        return self.area() > other.area()
```

#### Bitwise operators
%%probably never gonna use these but oh well%%

| Operator | Method                        |
| -------- | ----------------------------- |
| &        | **\_\_and__**(self, other)    |
| \|       | **\_\_or__**(self, other)     |
| ^        | **\_\_xor__**(self, other)    |
| <<       | **\_\_lshift__**(self, other) |
| >>       | **\_\_rshift__**(self, other) |
| ~        | **\_\_invert__**(self, other) |

### Iterators 
| Method           | Description                                                                         |
| ---------------- | ----------------------------------------------------------------------------------- |
| **\_\_iter__()** | Called to initialize the iterator. Must return an iterator object.                  |
| **\_\_next__()** | Called to iterate over the iterator. Must return the next value in the data stream. |
Main idea: 
- create an Iterator class containing a \_\_next__ method
- within the iterable class, create an \_\_it__ method, which returns an Iterator object instantiated with the current values stored in self
 Example:
```python
class RepositoryIterator:
	def __init__(self, data):
		self.__data = data 
		self.__pos = -1 

	def __next__(self):
		self.__pos += 1 
		if len(self.__data) == self.__pos:
			raise StopIteration()
		return self.__data[self.__pos]

class MemoryRepository:
	def __init__(self):
		self.data={}

	def add(self, element):
		if elemen.id in self._data:
			raise DuplicateIDError("Duplicate object ID")
		self._data[element.id] = element 

	def __it__(self):
		return RepositoryIterator(list(self._data.values))

```

### Callable objects 
- **\_\_call__**()

### Getters and Setters 
- **\_\_setitem__**(self, key, newvalue)
- **\_\_getitem__**(self, key)
- **

## Properties 
There are 2 types of properties: *read* and *write*
```python 

# within the class, one can define properties like so
@property 
def numerator(self):
	return self.numerator

# which can be called afterwards, outside the function:
print(q.numerator)

```

```python
# we can also define setters within classes

@numerator.setter
def numerator(self, new_value):
	self.set_numerator(new_value) # note that private members cannot be accessed within setters, so a method must be called 
```
## Misc 
when using inheritance, the init of the parent class is not called by default (it must be called manually)
example:
```python
class car_repository_binary(car_repository_in_memory):
	def __init__(self,filename):
		car_repository_in_memory.__init__(self)
		# super().__init__() equivalent		
```