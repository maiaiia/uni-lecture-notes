# Deadlocks
___
Class: [[OS]]
Type: Lecture
Tags: # 
Date: May 22nd, 2025
___
## Causes of Deadlocks
1. Mutual exclusion
2. Hold and wait 
	- occurs when a thread locks something then wants to lock another resource
3. No preemption 
4. Circular wait
## Q

1. How to get out of a deadlock? - choose a "victim" to kill
2. How to detect a deadlock? 
	- using a *resource allocation graph* (cycle = deadlock)
![[resource allocation graph]]
3. How to prevent a deadlock?
	1. Solve mutual exclusion - don't use mutexes at all (not really viable)
	2. Solve hold and wait - make locking atomic (meaning that you should only allow one thread to access the resources it wants to lock) - waayy slower!!, still not viable
	3. Solve no preemption - "solution" below, still *bad*
	4. Solve circular wait

for 3. - BAD!! example for a solution
```c
while (trylock < 0)
	unlock
```
- data corruption!!! 

>[!warning] Exam Question 
>How to prevent deadlocks?
>>[!important] The best way to avoid deadlocks is to **always lock resources in the same order**

