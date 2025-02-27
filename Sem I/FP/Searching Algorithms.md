# Searching Algorithms
___
Class: [[ FP]]
Type: Lecture
Tags: #Searching #DEI 
Date: October 17th 2024
___ 
## Sequential Search (Unordered List)
- going through each element one by one 
## Binary Search

^a7604b

^e6f118
- a kind of DEI algorithm
```python
def binary_search(arr, val, l, r):  
    while l <= r:  
        mid = (l + r) // 2  
        if arr[mid] == val:  
            return mid  
  
        if arr[mid] < val:  
            l = mid + 1  
        else:  
            r = mid - 1  
    return l  
```
### Example - Computing the r-root of a value
```python
def r_root(x, r, p):  
    minVal = 0  
    maxVal = x  
    mid = (minVal + maxVal) / 2  
    pw = mid ** r  
    while abs(pw - x) > p:  
        if pw > x:  
            maxVal = mid  
        else:  
            minVal = mid  
        mid = (minVal + maxVal) / 2  
        pw = mid ** r  
    return mid
```
## Exponential search
**Main idea**: find a chunk of length $2^k$ where the searched value may be and perform binary search only on it 

```python
def exponential_search(data:list, key):
	if len(data) == 0 or data[0] > key or data[-1] < key:
		return -1 
	if data[0] == key:
		return 0 
	i = 1 
	while i < len(data) and data[i] <= key:
		i *= 2
	return binary_search(data, key, i//2, min(i, len(data) - 1))

```
