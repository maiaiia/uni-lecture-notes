# Recursion 
Class: [[ FP]]
Type: Lecture
Tags: #Recursion 
Date: October 10th 2024
Teacher: [[Arthur Molnar]]
___

## Main Idea 
There are 2 types of recursion: *direct* (the function calls itself) and *indirect* (the function calls another, but it will again be called in turn)
## Optimizations
### Memoization
^807731
#### Def
- a coding technique for optimising recursive functions by memorising a result found in a previous iteration 
#### Code
```python
cache = {0 : 1, 1 : 1}  
  
def fib_cached(n: int) -> int:  
    if n in cache:  
        return cache[n]  
  
    cache[n] = fib_cached(n-2) + fib_cached(n - 1)  
    return cache[n]
```

### Tail Call Optimization
#### Def 
- the branch of the if construct that recursively calls the function is a tail call (the very last thing the function does before returning is to recursively call itself)
- The current invocation of the function will never need the [[src/Sem I/ASC/-tags_and_indexes/stack|stack]] space again since as soon as it receives a value from the recursive call it will return it to its caller. So instead of allocating [[src/Sem I/ASC/-tags_and_indexes/stack|stack]] space, the stack space used by the current function is reused
- implemented in coding languages such as c, c++ (low level)
- python does not support tail call optimization 