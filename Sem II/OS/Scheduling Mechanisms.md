# Scheduling Mechanisms
___
Class: [[OS]]
Type: Lecture
Tags: # 
Date: May 22nd, 2025
___

>[!question]
>How to choose the order in which things should be executed? 
>

Metrics
Time for turnaround: $\text{T}_\text{turnaround} = \text{T}_\text{completion} - \text{T}_\text{arrival}$
Time of response: $\text{T}_\text{response}=\text{T}_\text{first\_run} -\text{T}_\text{arrival}$
## Scheduling Politics
### FCFS - First Come First Served (FIFO)
![[Scheduling Mechanisms 2025-05-22 09.05.13.excalidraw]]
<u>solutions</u>: 
- **SJF** (shortest jumps first)
	- improves turnaround average
- **STCF** (shortest termination comes first) 
	- includes preemption (allows interrupting a long job from executing in order to execute shorter jobs)
### RR - Round Robin

Allocate a certain amount of time for each process and execute them in a circular order
<u>solutions</u>:
- **MLFQ** (multi level feedback queue):
	- instead of allocating the same amount of time for each process, use priority queues
	- RULES
		1. if priority(A) > priority(B), A runs 
		2. if priority(A) = priority(B), RR A and B
		3. when A enters system, A goes to top Queue (this is especially useful for interactive OSs)
		4. once A exhausted its quota on a priority queue, move it down (i.e. the priority of a process that has been executed decreases)
		5. periodically bring all to top queue (so that the ones at the bottom don't starve)
>[!tip]
>The priorities are established empirically (trial and error)

>[!warning] Warning: Priorities + locks are a potentially *bad* combination
> if, for instance, a low priority thread and a high priority thread share the same mutex, the high priority thread may have to wait a really long time for the mutex to unlock (so the high priority thread is basically treated as a low priority one)
> 
> solution: have a mutex have a flag that elevates the priority of the process locking it to the highest priority of the processes waiting for that mutex

