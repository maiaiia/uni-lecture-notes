[[OS]]
- [[Mutex]]
- [[Semaphores]]
- [[Barriers]]
- [[Read Write Lock]]
- [[Conditional Variable]]

## Exercises
1. 3  
2. Elevator
An elevator has a weight limit. Every person has a specific weight
person $\leftrightarrow$ thread
each thread has a number associated with it 
We create a semaphore. When a thread wants to enter the elevator, it calls sem_wait for each unit of weight


