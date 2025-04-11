# Unix Processes
___
Class: [[OS]]
Type: Lecture
Tags: # 
Date: March 20th, 2025
___

## Processes Creation
sample C file
```c
#include <stdio.h>
#include <unistd.h>

int main() {
	printf("before\n");
	fork(); //creates new process
	printf("after\n");
	return 0;
}

```
output - one before and 2 afters are outputted (one for each process)


example 2
```c
#include <stdio.h>
#include <unistd.h>

int main() {
	int i;
	for (i = 0; i < 3; i++){
		fork();
		printf("%d %d %d\n", getpid(), getppid(), i)
	}
	return 0;
}

```

![[Unix Processes 2025-03-20 08.25.14.excalidraw]]

- After `fork` is executed, both the parent and the child processes have a different return value: 
	- for the parent process, that value is the id of the child process
	- for the child process, the return value is 0

example 3 - sequential vs concurrent search engine 
```c
/*
Sequential server
Downside: in order to perform a search, the user must wait for all other processes to end
*/
while(1){
	get_req();
	perform_search();
	display_results();
}
```

```c
/*
Concurrent server
Advantage: A new request can be taken while the search is performed
*/

while(1){
	get_req();
	if (fork()==0){
		perform_search();
		display_results();
		exit(0); //stop child process!
	}
}
```

>[!tip] Notice that if a child process crashes, the parent process is fine (whereas we will later see that if a thread crashes, the whole system does)

## Zombies???
When a child process ends, if the parent process is still alive, the OS does not allow the child process to die (in order to preserve its exit status). These kinds of "dead" processes are called **zombies**. A zombie is alive until wait is called upon it. (exit status requested of the zombie)
If the parent of a zombie process dies before calling wait upon it, the new parent of the zombie becomes process 1. This happens in order to allow the zombie to be destroyed (because process 1 does execute a wait (i think??))
So, to recap, the zombie exists in between the time it ended up until when somebody (either its "natural" parent or process 1 - adoptive parent, in a way :) ) asks for its exit status 

*example*
```c
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/wait.h>

int main(){
	if (fork()==0){
		sleep(10);
		exit(0);
	}
	sleep(15);
	wait(NULL);
	sleep(5);
	return 0;
}
```

## Race conditions
When you have a common resource and many actors can access it, with at least one changing it.

>[!tip]
>inconsistencies don't always show up! concurrency is chaotic. if there are more processes running in the background, the likelihood of an unexpected result due to race conditions is higher


![[Processes 2025-04-10 09.37.56.excalidraw]]


Solution (for [[Threads]]): mutex the critical lines

```c
#include <stdlib.h>
#include <pthread.h>

int count=0;
pthread_mutex_t m;

void* f(void* a){ 
	int k = 0;
	for (int i = 0; i < *(int)a; i++){
	k++
	}
	pthread_mutex_lock(&m);
	count+=k;
	pthread_mutex_unlock(&m);
	
	return NULL;
}

int main(int argc, char** argv){
	pthread_t t[10];
	int n = 10;
	
	if (argc>1){
		sscanf(argv[1],%d,&n);
	}
	pthread_mutex_init(&m,NULL);
	for(int i = 0; i < 10; i++){
		pthread_create(&t[i],NULL,f,&n);
		
	}
	for(int i=0; i < 10; i++){
		pthread_join(&t[i],NULL,f,&n)
	}
}


```

## Extra - Signals
How would the concurrent server be improved so as to kill its zombie processes?
Using signals!!!
Whenever the OS gets a signal for a specific process, it pauses (interrupts) whatever the process was doing and executes the command associated with the signal for that specific process

- signal() does not signal something, but rather changes what is executed when a signal happens (overwrites it)
- there is a signal that cannot be overwritten (sigkill)

>[!tip] 
>when a child dies, a signal SIGCHILD is sent to the parent 

Solution:
```c
void f(int sgn){
	wait(NULL);
}
//...
signal(SIGCHLD, f); 
while(1){
	get_req();
	if (fork()==0){
		perform_search();
		display_results();
		exit(0); //stop child process!
	}
}

```
done! no more zombies :D 
