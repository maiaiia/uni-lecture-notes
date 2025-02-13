# Sorting Algorithms
___
Class: [[ FP]]
Type: 
Tags: #Sorting #DEI 
Date: October 22nd 2024
Teacher: [[]]
___
## Merge Sort 

^4943b6

- a type of DEI algorithm
```python
def merge(arr1, arr2):  
    arr = []  
    i = 0  
    j = 0  
    while i < len(arr1) and j < len(arr2):  
        if arr1[i] < arr2[j]:  
            arr.append(arr1[i])  
            i += 1  
        else:  
            arr.append(arr2[j])  
            j += 1  
    while i < len(arr1):  
        arr.append(arr1[i])  
        i += 1  
    while j < len(arr2):  
        arr.append(arr2[j])  
        j += 1  
    return arr  
  
def merge_sort(arr):  
    if len(arr) <= 1:  
        return arr  
  
    mid = len(arr) // 2  
    subarr1 = merge_sort(arr[:mid])  
    subarr2 = merge_sort(arr[mid:])  
  
    return merge(subarr1, subarr2)
```

## Insertion Sort & BS
- [[Searching Algorithms#^a7604b|binary search algorithm used]]
```python
def insertion_sort(arr):  
    for i in range(1, len(arr)):  
        val = arr[i]  
        pos = binary_search(arr, arr[i], 0, i)  
        arr = arr[:pos] + [val] + arr[pos:i] + arr[i+1:]  
    return arr
```

Version 2:
```python
def binary_search_index(array, value, left, right):  
    while left < right:  
        mid = (left + right) // 2  
        if array[mid] == value:  
            return mid  
        elif array[mid] < value:  
            left = mid + 1  
        else:  
            right = mid - 1  
    if array[left] < value:  
        return left + 1  
    return left  
  
  
def binary_insertion_sort(array):  
    new_array = [array[0]]  
    for i in range(1, len(array)):  
        value = array[i]  
        index = binary_search_index(new_array, value, 0, i-1)  
        new_array = new_array[:index] + [value] + new_array[index:]  
    return new_array
```

## Quick Sort
```python
def quick_sort(arr):  
    if len(arr) <= 1:  
        return arr  
    l = 0  
    r = len(arr)  
  
    mid = (l + r) // 2  
    val_mid = arr[mid]  
    lower = []  
    greater = []  
    eq = []  
    for value in arr:  
        if value < val_mid:  
            lower.append(value)  
        elif value > val_mid:  
            greater.append(value)  
        else:  
            eq.append(value)  
	lower = quick_sort(lower)
	greater = quick_sort(greater)
    return lower + eq + greater
```