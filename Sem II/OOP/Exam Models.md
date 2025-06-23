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
### 1.
#### Adder
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

#### Complex
```cpp
class Complex {  
private:  
    int r, i;  
public:  
    Complex(int r=0, int i=0):  
        r{r}, i{i}{}  
    Complex(const Complex& other):  
        r{other.r}, i{other.i}{}  
    int getReal(){return this->r;}  
    int getImaginary(){return this->i;}  
  
    bool operator==(const Complex& other) const{  
        return this->r == other.r && this->i == other.i;  
    }    Complex operator /(int v) const{  
        if (v==0)  
            throw runtime_error("Division by zero!");  
        return Complex{r/v, i/v};  
    }    friend ostream& operator << (ostream& stream, const Complex& complex);  
  
};  
ostream& operator << (ostream& stream, const Complex& complex) {  
    stream << complex.r << "+" << complex.i << "i";  
    return stream;  
}  
  
template <typename T>  
class Vector {  
private:  
    std::vector<T> values;  
public:  
    Vector(std::vector<T> vals):  
    values(vals){}  
    void printAll(ostream& stream) {  
        for (const auto& val:values)  
            stream << val << ", ";  
        stream << '\n';  
    }};  
  
  
  
void complex() {  
    Complex a{}, b{1,2}, c{6,4}, d{b};  
    assert(a.getReal()==0&&a.getImaginary()==0);  
    assert(c.getImaginary()==4);  
    assert(b==d);  
    Complex res1 = c / 2;  
    cout << res1 << '\n';  
    try {  
        Complex res2 = b / 0;  
    }    catch (runtime_error& err) {  
        std::cout << err.what() << '\n';  
    }  
    Vector<string> v1{std::vector<string>{"hello", "bye"}};  
    v1.printAll(cout);  
    Vector<Complex> v2{std::vector<Complex>{a,b,c,d}};  
    v2.printAll(cout);  
}
```

#### SmartPointer
terrible terrible horrible awful disgusting
```cpp
#include <iostream>  
using namespace std;  
  
template <typename T>  
class SmartPointer {  
private:  
    T* elem;  
    int* refcount;  
public:  
    explicit SmartPointer(T* t): elem{t}, refcount{new int{1}} {}  
    SmartPointer(const SmartPointer& other): elem{other.elem}, refcount{other.refcount} {  
        (*refcount)++;  
    }    SmartPointer& operator=(const SmartPointer&other) {  
        if (this==&other)  
            return *this;  
  
        if (--(*refcount)=0) {  
            delete elem;  
            delete refcount;  
        }  
        this->elem=other.elem;  
        this->refcount = other.refcount;  
        (*refcount)++;  
        return *this;  
    }  
    T& operator*() const {  
        return *elem;  
    }    bool operator==(const SmartPointer &other) const {  
        return this->elem==other.elem;  
    }  
    ~SmartPointer() {  
        --(*refcount);  
        if (*refcount==0) {  
            delete this->elem;  
            delete this->refcount;  
        }  
    }};  
  
template <typename T>  
class Set {  
private:  
    std::vector<T> v;  
public:  
    Set() {}  
    Set operator+(T& item) {  
        for (auto& e: v)  
            if (e==item)  
                throw runtime_error("Element already exists!");  
        Set newSet{*this};  
        newSet.v.push_back(item);  
        return newSet;  
    }  
    Set& remove(T item) {  
        for (auto it= v.begin(); it != v.end(); )  
            if (*it == item)  
                it=v.erase(it);  
        else  
            ++it;  
        return *this;  
    }  
    auto begin()  {return v.begin();}  
    auto end() {return v.end();};  
};  
  
void function1() {  
    SmartPointer<string> s1{new string{"A"}};  
    SmartPointer<string> s2 = s1;  
    SmartPointer<string> s3{new string{"C"}};  
    Set<SmartPointer<string>> set1{};  
    cout << *s1 << ' ' << *s2 << ' ' << *s3 << '\n';  
  
    try {  
        set1 = set1 + s1;  
        set1 = set1 + s2;  
    }    catch (runtime_error& err) {  
        cout << err.what() << '\n';  //element already exists  
    }  
  
    SmartPointer<int> i1{new int{1}};  
    SmartPointer<int> i2{new int{2}};  
    SmartPointer<int> i3{new int{3}};  
    Set<SmartPointer<int>> set2{};  
    set2 = set2+i1;  
    set2 = set2+i2;  
    set2 = set2+i3;  
    set2.remove(i1).remove(i3);  
  
    for (auto e: set2)  
        cout << *e << ", ";  
  
} //memory correctly deallocated  
  
int main() {  
    function1();  
    return 0;  
}
```

#### HTML
```cpp
#include <iostream>  
using namespace std;  
  
class HTMLElement {  
private:  
    std::string s;  
public:  
    HTMLElement(){}  
    virtual ~HTMLElement()=default;  
    HTMLElement(std::string str):s{str}{}  
    std::string getHTMLString(){return this->s;}  
  
};  
class  HTMLParagraph: public HTMLElement {  
public:  
    HTMLParagraph(){}  
    HTMLParagraph(std::string str): HTMLElement("<p>"+str+"</p>") {}  
  
};  
  
class HTMLImage: public HTMLElement {  
public:  
    HTMLImage(){}  
    HTMLImage(std::string str): HTMLElement("<img>" + str + "</img>"){}  
};  
  
template <typename T>  
class HTMLBuilder {  
private:  
    std::string s;  
public:  
    HTMLBuilder(){}  
    HTMLBuilder& operator+=(const T& other) {  
        if (!other)  
            throw std::runtime_error("Cannot add a null element!");  
        s += other->getHTMLString();  
        return *this;  
    }    //friend ostream& operator << (ostream& stream, const HTMLBuilder<T>& html);  
    std::string getS(){return "<html><body>" + this->s + "</body>";}  
};  
template <typename T>  
ostream& operator << (ostream& stream,  HTMLBuilder<T>& html) {  
    stream << html.getS();  
    return stream;  
}  
  
void fct1() {  
    HTMLElement* p1 = new HTMLParagraph{"Examination"};  
    assert(p1->getHTMLString()=="<p>Examination</p>");  
    HTMLElement*p2 = nullptr;  
    HTMLElement* i1 = new HTMLImage{"a.jpg"};  
    HTMLElement* i2 = new HTMLImage{"b.jpg"};  
    assert(i2->getHTMLString()=="<img>b.jpg</img>");  
  
    HTMLBuilder<HTMLElement*> html;  
    try {  
        html += p2;  
    }    catch (runtime_error& err) {  
        cout << err.what() << '\n';  
    }    ((html += p1)+=i1)+=i2;  
    cout << html << '\n';  
  
    delete p1; delete i1; delete i2;  
}  
  
int main() {  
    fct1();  
    return 0;  
}
```
#### template function
```cpp
#include <iostream>  
using namespace std;  
  
//Given the test function below, implement the function fct.  
  
template <typename T>  
T fct(std::vector<T> vec) {  
    if (vec.empty())  
        throw std::runtime_error("Vector is empty.");  
    T max = vec.front();  
    for (auto t: vec)  
        if (t > max)  
            max = t;  
    return max;  
}  
  
void testFct()  
{  
    vector<int> v1{4, 2, 1, 6, 3, -4};  
    assert(fct<int>(v1) == 6);  
    vector<int> v2;  
    try  
    {  
        fct<int>(v2);  
        assert(false);  
    }    catch (std::exception&) {assert(true);}  
  
    vector<double> v3{2, 10.5, 6.33, -100, 9, 1.212};  
    assert(fct<double>(v3) == 10.5);  
}  
  
  
int main() {  
    testFct();  
    return 0;  
}
```
### 2.
### 3.

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