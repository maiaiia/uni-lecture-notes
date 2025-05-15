[[OS]]
- [[Mutex]]
- [[Semaphores]]
- [[Barriers]]
- [[Read Write Lock]]
- [[Conditional Variable]]

## Exercises
1. 3  doors
2. Elevator
An elevator has a weight limit. Every person has a specific weight
person $\leftrightarrow$ thread
each thread has a number associated with it 
We create a semaphore. When a thread wants to enter the elevator, it calls sem_wait for each unit of weight. Be mindful that the series of waits must be [[Mutex#^9fbb3e|atomic]] 
```c
lock
for (i = 0; i < weight ; i++)
	sem_wait
unlock
```
3. Trampoline
A trampoline has both a weight limit and a limit for the number of people who can hop on it.
Use 2 semaphores

4. Bees - Bears - Rangers