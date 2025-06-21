# File Streams
___
Class: [[OOP]]
___

![[IOClassHierarchy]]


## Operators
The *insertion* `<<` and *extraction* `>>` operators can be overloaded for user-defined types the following way:
1. Function headers
	```cpp
	std::istream& operator>>(std::istream& stream, Object& c)
	std::ostream& operator<<(std::ostream& stream, Object& c)
	```
2. Declare functions as [[Friends|friend]] functions within the class
	```cpp
	class Object
	{  
	private:  
		//private attributes - will be read / written using the overloaded operators
	    std::string type;  
	    std::string rankAndOccupation;  
	  
	public:  
	    //constructor, destructor, methods, whatever
		
		//FRIEND functions - s.t. an Object's attributes can be accessed directly 
	    friend std::ostream& operator<<(std::ostream& stream, const Object& o);
	    friend std::istream& operator>>(std::istream& stream, Object& o); 
	};
	```

### Example
```cpp
#include <fstream>  
#include <iostream>  
#include <sstream>  
class Animal {  
private:  
    std::string type;  
    int age;  
protected:  
    std::string color;  
public:  
    Animal(){}  
    Animal(std::string type, int age, std::string color): type{type}, age{age}, color{color} {}  
  
    friend std::istream& operator >> (std::istream& stream, Animal& animal);  
    friend std::ostream& operator << (std::ostream& stream, const Animal& animal);  
  
};  
  
std::istream& operator >> (std::istream& stream, Animal& animal) {  
    std::string line; getline(stream, line);  
    if (line.empty())  
        return stream;  
    std::string age;  
    auto ls = std::stringstream(line);  
    getline(ls, animal.type, ',');  
    getline(ls, age, ',');  
    getline(ls, animal.color, ',');  
    animal.age = stoi(age);  
    return stream;  
}  
std::ostream &operator<<(std::ostream &stream, const Animal &animal) {  
    stream << "Name: " << animal.type << "\nColor: " << animal.color << "\nAge: " << animal.age << '\n';  
    return stream;  
}  
  

  
int main() {  
    Animal a{};  
    std::ifstream fin("../file.txt");  
    while (fin >> a)  
        std::cout << a;  
    return 0;  
}
```