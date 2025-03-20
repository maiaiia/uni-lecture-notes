# Unix Processes
___
Class: [[OS]]
Type: Lecture
Tags: # 
Date: March 20th, 2025
___

## Creating Processes 
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

## Zombies??
When a child process ends, if the parent process is still alive, the OS does not allow the child process to die (in order to preserve its exit status). These kinds of "dead" processes are called **zombies**. A zombie is alive until wait is called upon it. (exit status requested of the zombie)
If the parent of a zombie process dies before calling wait upon it, the new parent of the zombie becomes process 1. This happens in order to allow the zombie to be destroyed (because process 1 does execute a wait (i think??))
So, to recap, the zombie exists in between the time it ended up until when somebody (either its "natural" parent or process 1 - adoptive parent, in a way :) ) asks for its exit status 
