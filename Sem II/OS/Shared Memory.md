# Shared Memory
___
Class: [[OS]]
Type: Lecture
Tags: # 
Date: April 10th, 2025
___

Shared memory is persistent. Thus, the OS has limits 
See shared memory with `ipcs`
Make shared memory with `ipcmk -M no_of_bytes` 
Remove it with `ipcrm shm shared_memory_id`
Give permission 644 to the shared memory in order to not allow anybody else modify it

There is no synchronisation with shared memory though 

### Example 
```tabs
tab: shm.h
>[!code]
>```c
>struct absp{
>	int a, b, s, p;
>};
>```
tab: shma.c
>[!code]
>```c
>#include <stdio.h>
>#include "shm.h"
>
>int main(){
>	int shmid, k=0;
>	struct absp *x;
>	
>	shmid = shmget(1234, sizeof(sstruct absp), IPC_CREAT | 0600); #create shared memory
>	if (shmid < 0){
>		perror("failed to create shm");
>		return 1;
>	}
>	x = shmat(shmid, 0, 0); #attach x to memory 
>	x->a = 1, x->b = 2;
>	while(1){
>		x->a=k++ % 100;
>		x->b = k++ % 100;
>		if (x->s == x->p)
>			break;
>	}
>	shmdt(x) #detach x
>	shmctl(shmid, IPC_RMID, NULL);
>	return 0;
>}
>```
tab: shmb.c
>[!code]
>```c
>#include <stdio.h>
>#include "shm.h"
>
>int main(){
>	int shmid;
>	struct absp *x;
>	
>	shmid = shmget(1234, 0, 0); #connect shared memory
>	if (shmid < 0){
>		perror("failed to create shm");
>		return 1;
>	}
>	x = shmat(shmid, 0, 0); #attach shared memory
>	while(1){
>		x->s = x->a + x->b;
>		x->p = x->a * x->b;
>		if (x->s == x->p)
>			break;
>	}
>	shmdt(x) #detach x
>	shmctl(shmid, IPC_RMID, NULL);
>	return 0;
>}
>```
```

The advantage of shared memory is that is is extremely fast (compared to [[Pipes]] and [[FIFO]], which require extra steps, like checking if there are any other processes attached to an end), but it is hard to control