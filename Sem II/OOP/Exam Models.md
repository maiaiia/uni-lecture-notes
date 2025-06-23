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
#### iterate
```cpp
int main() {  
    //vector<int> v(1,2,3,4,5); //ERROR  
    vector<int>v{1,2,3,4,5};  
    vector<int>::iterator it=std::find(v.begin(), v.end(), 4);  
    v.insert(it,7); //1 2 3 7 4 5  
    it = v.begin()+2;  
    *it=11; // 1 2 11 7 4 5  
    std::vector<int>x;  
    std::copy_if(v.begin(), v.end(), back_inserter(x), [](int a){return a%2==1;});  
    //x = 1 11 7 5  
    for (auto a: x)  
        cout << a << " ";  
    return 0;  
}
```

#### iterate
```cpp
int main() {  
    vector<int> v{1,2,3,4,5};  
    vector<int>::iterator it = std::find(v.begin(), v.end(), 4);  
    v.insert(it,8); //1 2 3 8 4 5  
    it=v.begin()+2;  
    *it=10; //1 2 10 8 4 5  
    vector<int>x;  
    copy_if(v.begin(), v.end(), back_inserter(x),[](int a){return a%2==0;});  
    for (auto a: x)  
        cout << a << " "; //2 10 8 4  
    return 0;  
}
```

#### except
```cpp
class Ex1 {  
public:  
    Ex1() {cout << "Exception1 ";}  
    Ex1(const Ex1& ex){cout << "Copy_exc1 ";}  
};  
  
class Ex2: public Ex1 {  
public:  
    Ex2() {cout << "Exception2 ";}  
    Ex2(const Ex2& ex) {cout << "Copy_exc2 ";}  
};  
void except(int x) {  
    if (x < 0)  
        throw Ex1{};  
    else if (x == 0)  
        throw Ex2{};  
    cout << "Done";  
  
}  
//Start Exception1 Exception2 Exception1 Copy_exc1  
  
int main() {  
    try {  
        cout << "Start ";  
        try {  
            except(0);  
        }        catch (Ex1& e) {}  
        except(-2);  
    }    catch (Ex1 e){} //not passed by reference -> call to copy constructor  
  
    return 0;  
}
```

#### polymorphism example
```cpp
class B {  
public:  
    void f() {cout << "B.f ";}  
    virtual ~B(){}  
  
};  
  
class D1: public B {  
public:  
    virtual void f(){cout << "D1.f ";}  
    virtual ~D1(){}  
};  
  
class D2: public D1 {  
public:  
    void f(){cout << "D2.f ";};  
  
};  
  
int main() {  
    B* b1 = new B{}; b1->f(); delete b1; //B.f  
    B* b2 = new D1{}; b2->f(); delete b2; //B.f  
    B* b3 = new D2{}; b3->f(); delete b3; //B.f  
    D1* d = new D2{}; d->f(); delete d; //D2.f  
    return 0;  
}  
/* for non-virtual functions, the call is determined by the pointer type  
 * for virtual functions, it's determined by the actual object type * * b1, b2, b3 are typed as B* at compile time * they point to objects of classes B, D1 and D2 respectively at run time * for the first 3, the explanation is the same: the method f was not * declared virtual, so it cannot be overridden (it won't exhibit polymorphic behaviour) * thus, for the first 3 objects, the method corresponding to class B will be called * for object d, it is a member of class D1 at compile time and class D2 at run time * the method 'f' of class D1 is declared as virtual, so it can be overwritten * the 'override' specifier is missing for method f of class D2, but that does not affect the output */
```

#### noOfInstances
```cpp
#include <iostream>  
#include <vector>  
using namespace std;  
#include <vector>  
  
class A {  
private:  
    int *x;  
public:  
    static int noOfInstances;  
    A(int _x = 5) {  
        x = new int {_x};  
        noOfInstances++;  
    }    int get() {return *x;}  
    void set(int _x) {*x = _x;}  
    ~A() {delete x;}  
};  
  
int A::noOfInstances = 0;  
  
int main() {  
    A a1, a2;  
    cout << a1.noOfInstances << " "; //2  
    A a3 = a1;  
    cout << A::noOfInstances << " "; //2 - user defined constructor is not used - implicit copy assignment operator is called instead  
    a1.set(10);  
    cout << a1.get() << " " << a2.get() << ' ' << a3.get() << ' '; //10 5 10  
    //program will crash when a1 / a3 is deallocated (whichever comes second) due to double free    return 0;  
}
```

#### inheritance
```cpp
#include <iostream>  
#include <vector>  
using namespace std;  
#include <vector>  
  
class B {  
public:  
    B()= default;  
    B(const B&){cout << "copy ";}  
    virtual B f() {cout << "B.f "; return *this; }  
    virtual ~B() {cout << "~B ";}  
};  
  
class D: public B {  
private:  
    B* b;  
public:  
    D(B* _b): b{_b} { cout << "D "; }  
    B f() override{cout << "D.f "; return b->f();}  
};  
  
int main() {  
    B* b = new B();  
    B* d = new D{b}; // call default constructor of B (nothing displayed); call D constructor-> D  
    d->f(); // call D::f (virtual function) ->D.f, call B::f() -> B.f , return b *by value) -> copy  
    //copy destroyed-> ~B    delete d; // call to D implicit destructor (no output); call to B destructor-> ~B  
    delete b; //~B  
    return 0;  
} //output: D D.f B.f copy ~B ~B ~B
```

#### another inheritance
```cpp
  
class B {  
public:  
    B(){}  
    B(const B& b){cout << "copy ";}  
    virtual void f() {cout << "B.f ";}  
    void g(B b){cout << "B.g ";}  
    virtual ~B(){cout << "~B ";}  
};  
  
class D: public B {  
public:  
    D(){}  
    void f(){B::f(); cout << "D.f ";}  
    void g(D d){B::g(d); cout << "D.g ";}  
  
};  
  
int main() {  
    B* b = new B{}; //default constructor B  
    B* d = new D{}; //default constructor of B, default constructor of D  
    d->f(); //virtual method in parent -> polymorphic -> B.f D.f  
    d->g(*b); //b passed by value-> copy; non-polymorphic function -> B.g; !!destroy copy ~B  
    delete b; //~B  
    delete d; //default destructor of D + destructor of B -> ~B  
  
    return 0;  
} //output: B.f D.f copy B.g ~B ~B ~B
```

#### copy constructor
```cpp
class A {  
private:  
    int *x;  
public:  
    A(int _x=0) {  
        x = new int(_x);  
    }    A (const A& a) {  
        x = new int{*a.x};  
    }    int get() {return *x;}  
    void set(int _x) {*x = _x;}  
    ~A() {delete x;}  
};  
  
int main() {  
    A a1, a2; a1.set(8); //first constructor called; value of *a1.x set to 8;  
    A a3; a3 = a1; //memory leak because a3 is first initialised with A::A(int _x), then via the assignment a3=a1 (with its definition generated by the compiler; now a1 and a3 point to the same location in memory, but the original pointer is leaked)  
    A a4 = a1; // calls copy constructor (this is not an assignment!!!) - *a4.x = 8, but a1 and a4 point to different integers  
    a1.set(5);  
    cout << a1.get() << ' '; //5  
    cout << a2.get() << ' '; //0  
    cout << a3.get() << ' '; //5  
    cout << a4.get() << ' '; //8  
  
    //crash because of double delete + memory leak due to a3=a1 assignment    return 0;  
} //output is 5 0 5 8
```

### 3.
#### Contact
```cpp
#include <iostream>  
#include <vector>  
#include <random>  
  
class Channel {  
public:  
    Channel()=default;  
    virtual ~Channel() = default;  
    virtual void send(std::string message)=0;  
};  
class Telephone: public Channel {  
private:  
    std::string number;  
public:  
    Telephone(std::string number): number{number}{}  
    void send(std::string message) override {  
        int r = rand() % 10;  
        if (r < 7) //testing  
            throw std::runtime_error("Line busy");  
        std::cout << "dialing " << number << '\n';  
    }};  
  
class Fax: public Telephone {  
public:  
    Fax(std::string number): Telephone{number}{}  
    void send(std::string message) override {  
        Telephone::send(message);  
        std::cout << "sending fax" << '\n';  
    }};  
class SMS: public Telephone {  
public:  
    SMS(std::string number): Telephone{number}{}  
    void send(std::string message) override {  
        Telephone::send(message);  
        std::cout << "sending sms" << '\n';  
    }};  
class Failover: public Channel {  
private:  
    std::shared_ptr<Channel> c1, c2;  
public:  
    Failover(std::shared_ptr<Channel> ch1, std::shared_ptr<Channel> ch2) {  
        c1 = ch1;  
        c2 = ch2;  
    }    void send(std::string message) override {  
        try {  
            c1->send(message);  
            return;  
        }        catch (std::runtime_error& err) {  
            std::cout << err.what() << '\n';  
        }        c2->send(message);  
    }};  
  
class Contact {  
private:  
    std::shared_ptr<Channel> c[3];  
public:  
    Contact(std::shared_ptr<Channel> c1, std::shared_ptr<Channel>c2, std::shared_ptr<Channel>c3) {  
        c[0] = c1;  
        c[1] = c2;  
        c[2] = c3;  
    }    void sendAlarm(std::string message) const {  
        for (int i = 0; i < 3; i++) {  
            try {  
                c[i]->send(message);  
                return;  
            }            catch (std::exception& err) {  
                std::cout << err.what() << '\n';  
            }        }    }};  
Contact createContact() {  
    auto telephone = std::make_shared<Telephone>("0712345678");  
    auto fax = std::make_shared<Fax>("0756456456");  
    auto sms = std::make_shared<SMS>("0712342113");  
  
    auto failover1 = std::make_shared<Failover>(fax, sms);  
    auto failover2 = std::make_shared<Failover>(telephone, failover1);  
    return Contact{telephone, failover1, failover2};  
}  
  
int main() {  
    srand(time(nullptr));  
    auto contact = createContact();  
    int cnt = 10;  
    while (cnt) {  
        contact.sendAlarm("message");  
        cnt--;  
        std::cout << "--------\n";  
    }  
    return 0;  
}
```

#### Menu
![[Screenshot 2025-06-23 at 15.42.02.png]]
```cpp
```
#### Encoder
![[Screenshot 2025-06-23 at 15.43.07.png]]
```cpp
```
#### IceCream
![[Screenshot 2025-06-23 at 15.43.39.png]]
```cpp
```
#### QtWannabe
![[Screenshot 2025-06-23 at 15.42.32.png]]
```cpp
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