# Exam Models
___
Class: [[OOP]]
Type: 
Tags: # 
Date: June 5th, 2025
___

```c++
class B
{
	B() {std::cout << "B{}";}
	virtual ~B() {std::cout << "~B()"}
};

class D: public B{
public:
	D(){std::cout << "D{}";}
	virtual ~D() {std::cout << "~D()";}
};
```

```c++
B* b[] = {new B{}, new D{}};
```

`new B` allocates memory, then calls the constructor of class B (so 'B{}') is printed.
`new D` - calls the constructor from the basic class (D inherits from B) $\Rightarrow$ prints 'B{}'. It then calls the constructor of the derived class, and prints 'D{}'

## Written
### S1
Adder
```cpp
template <typename T> class Adder {  
private:  
    std::vector<T> values;  
    T s=0;  
public:  
    explicit Adder(T t) {  
        s=0;  
        values.push_back(t);  
        s += t;  
    }    Adder(Adder<T>* other) {  
        this->s = other->s;  
        for (auto v: other->values)  
            this->values.push_back(v);  
    }    T sum() {  
        return this->s;  
    }    Adder& operator++() {  
        this->s += this->values.back();  
        this->values.push_back(this->values.back());  
        return *this;  
    }  
    Adder & operator+(T i){  
        this->s += i;  
        this->values.push_back(i);  
        return *this;  
    }    Adder& operator--() {  
        if (this->values.empty())  
            throw std::runtime_error("No more values");  
        this->s-=this->values.back();  
        this->values.pop_back();  
        return *this;  
    }};  
  
void function2() {  
    Adder<int>add(5); //build adder with initial value 5  
    add = add + 5 + 2; //add values 5 and 2  
    ++add; // add 2 (last added value)  
    add + 8; //add 8  
    std::cout << add.sum() << '\n'; //22  
  
    --add; //eliminate last added value  
    cout << add.sum() << '\n'; //14  
     --(--add); //subtract last 2 added values  
    cout << add.sum() << '\n'; //10  
    try {  
        --(--(--add));  
    }    catch (runtime_error& ex) {  
        cout << ex.what(); //prints "No more values"  
    }  
}
```
### Jun 10 2025

![[PHOTO-2025-06-10-14-36-01.jpg]]
![[PHOTO-2025-06-10-14-36-01 1.jpg]]


## Practical
### Volunteering - Jun 10 2025
![[PHOTO-2025-06-10-14-36-02.jpg]]
### Bacterial Species / Microbial World - Jun 16 2025
![[PHOTO-2025-06-16-18-23-38.jpg]]

### Task Manager - Jun smth 2025
![Task Manager.jpg](https://github.com/jonathan2667/UBB-CS-Bachelors-Materials/blob/main/Year%201/Semester%202/Object%20Oriented%20Programming/exam_teo/Practic/Task%20Manager.jpg?raw=true)
### Art Auction Platform - Observer
![Art Auction Platform.jpg](https://github.com/jonathan2667/UBB-CS-Bachelors-Materials/blob/main/Year%201/Semester%202/Object%20Oriented%20Programming/exam_teo/Practic/Art%20Auction%20Platform.jpg?raw=true)

### Code Revision - Observer
![Code Revision.jpeg](https://github.com/jonathan2667/UBB-CS-Bachelors-Materials/blob/main/Year%201/Semester%202/Object%20Oriented%20Programming/exam_teo/Practic/Code%20Revision.jpeg?raw=true)
### Deliver Now - Observer done

![Deliver Now.jpeg](https://github.com/jonathan2667/UBB-CS-Bachelors-Materials/blob/main/Year%201/Semester%202/Object%20Oriented%20Programming/exam_teo/Practic/Deliver%20Now.jpeg?raw=true)
### Drive Connect - Observer
![Drive Connect.jpeg](https://github.com/jonathan2667/UBB-CS-Bachelors-Materials/blob/main/Year%201/Semester%202/Object%20Oriented%20Programming/exam_teo/Practic/Drive%20Connect.jpeg?raw=true)
### Event Planner - Observer
![Event Planner.jpeg](https://github.com/jonathan2667/UBB-CS-Bachelors-Materials/blob/main/Year%201/Semester%202/Object%20Oriented%20Programming/exam_teo/Practic/Event%20Planner.jpeg?raw=true)
### Issue Tracker
![Issue Tracker.png](https://github.com/jonathan2667/UBB-CS-Bachelors-Materials/blob/main/Year%201/Semester%202/Object%20Oriented%20Programming/exam_teo/Practic/Issue%20Tracker.png?raw=true)
### Patient Management - Observer
![Patient Managment.jpeg](https://github.com/jonathan2667/UBB-CS-Bachelors-Materials/blob/main/Year%201/Semester%202/Object%20Oriented%20Programming/exam_teo/Practic/Patient%20Managment.jpeg?raw=true)
### Q&A Site
![Question and Answer Site.jpg](https://github.com/jonathan2667/UBB-CS-Bachelors-Materials/blob/main/Year%201/Semester%202/Object%20Oriented%20Programming/exam_teo/Practic/Question%20and%20Answer%20Site.jpg?raw=true)
### Quiz
![Quiz.jpg](https://github.com/jonathan2667/UBB-CS-Bachelors-Materials/blob/main/Year%201/Semester%202/Object%20Oriented%20Programming/exam_teo/Practic/Quiz.jpg?raw=true)
### Research Grant Proposals - MW - done (ish)
![Research Grant Proposals.jpg](https://github.com/jonathan2667/UBB-CS-Bachelors-Materials/blob/main/Year%201/Semester%202/Object%20Oriented%20Programming/exam_teo/Practic/Research%20Grant%20Proposals.jpg?raw=true)
### Screen Writing - MW 
![ScreenWriting.JPG](https://github.com/jonathan2667/UBB-CS-Bachelors-Materials/blob/main/Year%201/Semester%202/Object%20Oriented%20Programming/exam_teo/Practic/ScreenWriting.JPG?raw=true)
### done Star Catalogue 
![Star Catalogue.JPG](https://github.com/jonathan2667/UBB-CS-Bachelors-Materials/blob/main/Year%201/Semester%202/Object%20Oriented%20Programming/exam_teo/Practic/Star%20Catalogue.JPG?raw=true)
### Waze-ing
![[Screenshot 2025-06-21 at 09.42.42.png]]