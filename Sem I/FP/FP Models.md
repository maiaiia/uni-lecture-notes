# FP Models

## 1

![[Pasted image 20250127170008.png]]

>[!important] Remember to always return self after add magic method (or any similar method!!)

1.
```python
class A:  
    def __str__(self):  
        return "a"  
  
class B:  
    def __init__(self, a=None):  
        self._a = a  
  
    def __str__(self):  
        return str(self._a) + "b" + A.__str__(self)  
  
  
a = A()  
print(a)  
b = B(a)  
print(b)  
c = B(b)  
print(c)  
  
  
"""  
print(a)  
    Since a is an instance of class A, so it implicitly calls A.__str__(self)   
    Output: "a"
print(b)  
    b is an instance of class B, initialized with a as its _a. Thus, the __str__ method of class B is called in this case:        
		str(self._a) calls the __str__ method of class A for the object "a", which returns "a"
        A.__str__(self) calls the __str__ method of class A upon object b, returning the string "a"    
    thus, the result of execution of this line of code is "aba"print(c)  
    c is an instance of class B, initialized with b as its _a attribute    thus, the __str__ method of class B is called:        str(self._a) calls the str method of class B upon the object b (since b is a member of B)        as we have seen before, the return value of this function call is "aba"        A.__str__(self) calls the __str__ method of A upon object c, resulting in the return value "a"    thus, the result of the execution of this line of code is "ababa"        """
```

2.
```python
class FibMatrixIterator:  
    def __init__(self, n, v):  
        self.__n = n  
        self.__v = v  
        self.__a = 0  
        self.__b = 1  
        self.__current_index = -1  
  
    def __next__(self):  
        self.__current_index += 1  
        if self.__current_index == self.__n ** 2:  
            raise StopIteration  
        result = self.__a + self.__v  
        self.__a, self.__b = self.__b, self.__a + self.__b  
        return result  
  
class FibMatrix:  
    def __init__(self, n):  
        self.__n = n  
        self.__v = 0  
  
    def __str__(self):  
        if self.__n == 1:  
            return "1"  
        a = 0  
        b = 1  
        ret = ""  
        for i in range(self.__n):  
            for j in range(self.__n):  
                ret += str(a+self.__v) + " "  
                x = a  
                a = b  
                b += x  
            ret += "\n"  
        return ret  
  
    def __add__(self, other):  
        self.__v += other  
        return self  
  
    def __iter__(self):  
        return FibMatrixIterator(self.__n, self.__v)  
  
  
fm = FibMatrix(2)  
print(fm)  
  
fm = FibMatrix(3)  
print(fm)  
  
fm2 = fm + 10  
  
print(fm2)  
  
for i in fm2:  
    print(i)
```
3.
```python
def f(data: list):  
    """  
    Check if the values in data are sorted in increasing order    
    :param data: list    
    :raises: ValueError if data is an empty list    
    :return: True if data is sorted, False otherwise  
    """    if data == None or data == []:  
        raise ValueError  
    aux = data[0]  
    for elem in data:  
        if aux - elem > 0:  
            return False  
        aux = elem  
    return True  
  
from random import randint  
def generate_random_list(list_length):  
    lst = []  
    for i in range(list_length):  
        lst.append(randint(1,200))  
    return lst  
def test_f():  
    for i in range(100):  
        lst = generate_random_list(1000)  
        random_index = randint(1,999)  
        lst[random_index] = lst[random_index-1] - 1 #to make sure the list is not sorted  
        assert(not f(lst))  
        lst.sort()  
        assert(f(lst))  
  
test_f()
```

4.
```python
[def compute_on2(arr):
    bestsum = arr[0]
    bestl, bestr = 0, 0
    n = len(arr)
    for l in range(0, n):
        for r in range(l, n):
            if bestsum < sum(arr[l:r+1]):
                bestsum = sum(arr[l:r+1])
                bestl, bestr = l, r
    return bestl, bestr

def compute_on(arr):
    bestsum = arr[0]
    bestl, bestr = 0, 0
    suma = 0
    n = len(arr)
    l = 0
    for r in range(0, n):
        if suma + arr[r] < arr[r]:
            suma = arr[r]
            l = r
        else:
            suma += arr[r]
        if suma > bestsum:
            bestsum = suma
            bestl, bestr = l, r
    return bestl, bestr](<from copy import deepcopy  
  
def compute_nsqared(arr):  
    n = len(arr)  
    res = [arr[0]]  
    for l in range(n):  
        aux = []  
        for r in range(l, n):  
            aux.append(arr[r])  
            if sum(aux) %3E sum(res):  
                res = deepcopy(aux)  
    return res  
  
print(compute_nsqared([2,-3,10,1,-2,-4,12,-2]))>)
```

## 2
![2.jpg](https://github.com/jonathan2667/UBB-CS-Bachelors-Materials/blob/main/Year%201/Semester%201/Fundamentals%20of%20Programming/Final%20Exam/Written/2.jpg?raw=true)
1.
```python
[a = 1  
def f(a):  
    a = 2  
def g(a):  
    a[0] = 2  
  
x = 3  
f(x)  
print(a) # a = 1  
print(x) #x = 3  
x = [3,3]  
g(x)  
print(x) #x = [2,3]]

"""
Throughout the execution of the code, the global variable a remains unchanged 
(since it was not used as a parameter in any of the function calls)
Although the name of the parameters mirrors that of the global variable, 
all the changes inside the functions are actually performed upon the local variable a.

1.
x = 3
f(x) #since immutable objects are passed by value, and not by reference, the function only receives a copy of the value of x, and it does not have access to x
print(a) #as stated above, a is unchanged =%3E Output: 1
print(x) #x is also unchanged because the reassignment if f(a) is local to the function => Output: 3 

2.
x = [3,3]
g(x)
print(x)

Now, x is a mutable object (a list), so it is passed in the function by reference
thus, both the original and the function parameter refer to the same object in memory
the line a[0] = 2 modifies the first element of the list a in place (i.e. without creating a new object)
so, x[0] = 2

=> Output: [2,3]
""">)
```
2
```python
class SparseMatrix:  
    def __init__(self, lines, columns):  
        self.__lines = lines  
        self.__columns = columns  
        self.__set_values = {}  
  
    def set(self, lin, col, val):  
        if not (0 <= lin < self.__lines) or not (0 <= col < self.__columns):  
            raise ValueError  
        self.__set_values[(lin, col)] = val  
  
    def get(self, lin, col):  
        if not (0 <= lin < self.__lines) or not (0 <= col < self.__columns):  
            raise ValueError  
        return self.__set_values[(lin, col)]  
  
    def __str__(self):  
        result = ""  
        for i in range(self.__lines):  
            for j in range(self.__columns):  
                if (i, j) in self.__set_values.keys():  
                    result += str(self.__set_values[(i,j)])  
                else:  
                    result += "0"  
                result += " "  
            result += "\n"  
        return result  
  
  
m1 = SparseMatrix(3,3)  
m1.set(1,1,2)  
m1.set(2,2,4)  
print(m1)  
try:  
    m1.set(3,3,99)  
except Exception as e:  
    print(type(e))  
  
m1.set(1,1,m1.get(1,1)+1)  
print(m1)
```
3.


## 3
![3.jpg](https://github.com/jonathan2667/UBB-CS-Bachelors-Materials/blob/main/Year%201/Semester%201/Fundamentals%20of%20Programming/Final%20Exam/Written/3.jpg?raw=true)
1.
```python
def f(a,b):  
    b.append(a)  
    a = [a]  
    b = b + a  
    return b  
  
  
x = 1  
y = [2]  
z = f(x,y)  
print([1] == x)         #False  
print(id(y) == id(z))   #False  
print(y == z[0:2])      #True  
  
  
"""  
Function call:  
    a = x = 1 (only the value of x is passed)    
    b = y = [2] (b is passed by reference, so b and y point to the same object) 
Step through f:  
    b.append(a) -> b = [2,1]. This also changes y, since b references the same object as y    
    a = [a]     -> a is reassigned to a new list [1]. This does not change x, since a and x do not reference the same object  
    b = b + a   -> b becomes [2, 1, 1]. This does not affect the original y, since the "+" operator returns a new object, so now b points to a new list      
After f is executed:  
	x = 1 
	y = [2,1]  
	z = [2,1,1]  
  
So the output is:  
    False    
    False   
    True   
      
Note that, had there not been the instruction b = b + a, the second print statement would have also been true  
"""
```
2.
```python
class SparseListIterator:  
    def __init__(self, sparse_list):  
        self.__pos = -1  
        self.__sparse_list = sparse_list  
    def __next__(self):  
        self.__pos += 1  
        if self.__pos > self.__sparse_list.length:  
            raise StopIteration  
        return self.__sparse_list[self.__pos]  
  
class SparseList:  
    def __init__(self):  
        self.__values = {}  
        self.__length = 0  
  
    @property  
    def length(self):  
        return self.__length  
  
    def __setitem__(self, key, value):  
        self.__values[key] = value  
        self.__length = max(self.__length, key)  
  
    def __getitem__(self, key):  
        if key > self.__length:  
            raise ValueError  
        if key in self.__values:  
            return self.__values[key]  
        return 0  
  
    def __iter__(self):  
        return SparseListIterator(self)  
  
data1= SparseList()  
data1[0] = 1  
data1[2] = 2  
for iter1 in data1:  
    for iter2 in data1:  
        print(iter1, iter2)
```
3.
```python
def f(count: int, data: list):  
    if count != 1:  
        if len(data) < 10:  
            data.append(count)  
        f(count - 1, data)  
        f(count - 1, data)  
    else:  
        print(count, data)  
  
"""  
Time complexity:  
T(n) = 2T(n-1)+1 if n > 1, else 1  
T(n) = 2T(n-1)+1 = 4T(n-2)+2+1 = ... = 2^(n-1)+2^(n-2)+...+2+1 = 2^n - 1  
=> O(2^n)  
  
Space complexity (disregarding the stack space):  
O(1), since at most 10 values are appended to data. Since data is a mutable object (a list), it is passed by reference to f, so no copies of it are made  
also, no more than 10 values are appended, since every change performed on data  
will be visible in all the other calls.  
  
"""
```


## 4
![4.jpg](https://github.com/jonathan2667/UBB-CS-Bachelors-Materials/blob/main/Year%201/Semester%201/Fundamentals%20of%20Programming/Final%20Exam/Written/4.jpg?raw=true)

1.
```python
class X:  
    def f(self):  
        print("X")  
  
  
class Y(X):  
    def __init__(self, a):  
        self._a = a  
  
    def f(self):  
        print("Y")  
        self._a.f()  
  
class Z(Y):  
    def __init__(self, a):  
        super().__init__(a)  
  
for o in [Y(Y(X())), Z(Y(X()))]:  
    o.f()  
  
"""  
X() instantiates a new object of class X (let's call it x1)  
Y(X())) instantiates a new object of class Y (let's call it y1), with y1._a = x1 Y(Y(X)) ... y2, with y2._a = y1 in Y  
  
so Y(Y(X()))).f() first calls Y.f(y2), which   
    prints "Y"   
    calls Y.f(y1), which  
        prints "Y"        calls X.f(x1), which            prints "X"  
so the output of calling the method f for the object Y(Y(X())) is:  
Y  
Y  
X  
  
although the class Z does not have a method "f", it inherits from the class Y, so  
Z(Y(X())).f() will call the method f of Y, which   
    prints "Y"  
    calls Y.f(Y(X())), which        prints "Y"   
        calls X.f(self), which   
            prints "X"  
so the output of calling the method f for the object Z(Y(X())) is:  
Y  
Y  
X  
  
Final output:  
Y  
Y  
X  
Y  
Y  
X  
"""
```
2.
```python
class PrimeListException(Exception):  
    def __init__(self, message="Prime list exception"):  
        self.__message = message  
    def __str__(self):  
        return self.__message  
  
class PrimeList:  
    def __init__(self):  
        self.__primes = [2]  
        self.__length = 1  
  
    @property  
    def length(self):  
        return self.__length  
  
    def __setitem__(self, key, value):  
        raise PrimeListException("List is read only.")  
  
    def __getitem__(self, key):  
        while key >= self.__length:  
            last = self.__primes[-1] + 1  
            while not PrimeList.prime(last):  
                last += 1  
            self.__primes.append(last)  
            self.__length += 1  
  
        return self.__primes[key]  
  
  
    @staticmethod  
    def prime(value):  
        if value < 5:  
            return value < 4  
        if value % 2 == 0 or value % 3 == 0:  
            return False  
        i = 5  
        while i * i <= value:  
            if value % i == 0 or value % (i + 2) == 0:  
                return False  
            i += 6  
        return True  
  
data = PrimeList()  
for i in range(10):  
    print(data[i])  
  
print(data[100])  
try:  
    data[5] = 10  
except PrimeListException as ple:  
    print(ple)
```
3.
```python
def f(n):  
    sum = 0  
    for i in range(1, n ** 3): #n^3 steps  
        aux = 0  
        while i != 0: #lg i steps  
            aux += i % 2   
i //= 10  
        sum += aux  
    return sum  
  
"""  
so the outermost sum is up to n^3, and the innermost sum performs lg i steps, with i ranging from 1 to n^3 => T(n) is approx n^3 * lgn^3 = 3n^3 lgn => O(n^3 lgn)  
"""
```
4.
```python
oo = 1000000  
def get_smallest_number_of_coins(values: list, sum: int):  
    # assuming values is already sorted  
    dp = [oo for _ in range(sum + 1)]  
    for value in values:  
        dp[value] = 1  
    for i in range(values[0], sum + 1):  
        if dp[i] == oo: #sum cannot be obtained  
            continue  
        for value in values:  
            if i + value > sum:  
                break  
            dp[i + value] = min(dp[i+value], dp[i] + 1)  
    return dp  
  
print(get_smallest_number_of_coins([1,2,5,10], 13))
```

![5.jpg](https://github.com/jonathan2667/UBB-CS-Bachelors-Materials/blob/main/Year%201/Semester%201/Fundamentals%20of%20Programming/Final%20Exam/Written/5.jpg?raw=true)
## 6
![6.jpg](https://github.com/jonathan2667/UBB-CS-Bachelors-Materials/blob/main/Year%201/Semester%201/Fundamentals%20of%20Programming/Final%20Exam/Written/6.jpg?raw=true)

1.
"f f f 0"
2.
```python
class SparseListIterator:  
    def __init__(self, sparse_list):  
        self.__list = sparse_list  
        self.__pos = -1  
  
    def __next__(self):  
        self.__pos += 1  
        if self.__pos >= len(self.__list):  
            raise StopIteration  
        return self.__list.get(self.__pos)  
  
class SparseList:  
    def __init__(self):  
        self.__length = 0  
        self.__values = {}  
  
    def __len__(self):  
        return self.__length  
  
    def set(self, index, value):  
        self.__values[index] = value  
        self.__length = max(index + 1, self.__length)  
  
    def get(self, index):  
        if index in self.__values.keys():  
            return self.__values[index]  
        return 0  
  
    def __iter__(self):  
        return SparseListIterator(self)  
  
  
data = SparseList()  
data.set(1,1)  
data.set(3,2)  
data.set(5,3)  
data.set(9,99)  
data.set(9,data.get(9)+1)  
  
for elem in data:  
    print(elem)
```
3.
```python
def f(data: list):  
    if len(data) == 1:  
        return data[0]  
    if data[0] % 2 == 0:  
        return -1  
    return f(data[1:])  
  
"""  
Time  
Best case: O(1) if the first element if even  
Worst case: O(n), if no element in the list is even (and f function calls are made)  
  
Space:  
There are n calls made on the call stack, where partial copies of the list are made  
call stack space: n  
additional data space: n + n-1+...+1  
T(n) = n + n(n+1)/2 => O(n^2) extra space complexity  
  
"""  
  
f([1,3,5,7,9,11])
```
## 7
![[sub2fp.jpg]]
1.
```python 
class L:  
    def __init__(self, v=0, n=None):  
        self.v = v  
        self.n = n  
    def __eq__(self, o):  
        if o is None:  
            return False  
        return self.v == o.v and self.n == o.n  
  
a = L()  
print(id(a) == id(L())) #False; L() creates a new object
print(a == L()) #True ; both objects have identical values for v and n attributes, so they are equal, according to the __eq__ method 
a.n = L(1)  
print(a == L()) #False ; now, a's attribute n is an L object, whereas L()'s n attribute is implicitly None, so these are not equal
print(a == L(0, L(1))) #True ; same as the explanation above
```
2.
```python
class FunnyIterator:  
    def __init__(self, funny_list, start_index):  
        self.__funny_list = funny_list  
        self.__index = start_index - 3  
  
    def __iter__(self):  
        return self  
  
    def __next__(self):  
        self.__index += 3  
        if self.__index >= len(self.__funny_list):  
            raise StopIteration  
        return self.__funny_list[self.__index]  
  
class FunnyList:  
    def __init__(self):  
        self.__values = []  
        self.__start = 0  
  
    def __len__(self):  
        return len(self.__values)  
  
    def append(self, value):  
        self.__values.append(value)  
  
    def __getitem__(self, key):  
        return self.__values[key]  
  
    def __setitem__(self, key, value):  
        self.__values[key] = value  
  
    def iterator(self, start_value):  
        self.__start = start_value  
        return FunnyIterator(self, self.__start)  
  
  
data = FunnyList()  
for i in range(1,20):  
    data.append(i)  
  
for i in range(10):  
    data[i] += 20  
  
for i in data.iterator(1):  
    print(i)  
  
for i in data.iterator(5):  
    print(i)
```
3.
```python
def f(n : int, data: list):  
    if len(data) <= n ** 2:  
        data.append(n)  
    if n > 1:  
        f(n - 1, data)  
        f(n - 1, data)  
          
"""  
Time complexity:  
    T(n) = 2T(n-1) + 1 if n > 1 else 1 => O(2^n)Space complexity:  
    call stack: maximum depth is n    extra data: maximum length is n^2. There are no copies of "data" made, since  
    it is a mutable object (list), so it is passed by reference, and the only    operation applied is append, which directly changes the contents of the list   
    => O(n)  
"""
```