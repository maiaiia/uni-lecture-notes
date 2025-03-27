# Sending Data Between Processes
___
Class: [[OS]]
Type: Lecture
Tags: # 
Date: March 27th, 2025
___

Problem: add the values in the array $a$ using parallel processes
```c++
#include <stdio.h>

int main() {
	int a[4] = {1,2,3,4};
	if (fork() == 0){
		a[2]+=a[3];
		exit(0);
	}
	a[0] += a[1];

	wait(0);
	
	a[0] += a[2];
	printf("%d\n",a[0]);
	return 0;
}

```

This will output the value $6$. That is because the child process is, in fact, a *copy* of the parent process, having its own $a$ array, which is different than that of the parent. Thus, for the parent process, the addition $a[2]+a[3]$ is not performed.


## Inter Process Communication Mechanisms
- pipe
- FIFO
- (shared memory) SHM
- (message MSG
- SEM
### Pipes
Pipes get created in the kernel. It contains 2 descriptors for reading and writing. When creating a child process, it will also have a copy of the pipe, with the same contents.

>[!Important] Always close one end of the pipe ASAP
> Both the parent and the child can write to the pipe. However, keeping the pipe unidirectional is essential!! Meaning, have each process use one end of the pipe (either the child or the parent can read to the other). 

```c++
#include <stdio.h>

int main() {
	int a[4] = {1,2,3,4};
	int p[2];
	pipe(p);
	if (fork() == 0){
		close(p[0]);
		a[2]+=a[3];
		write(p[1],&a[2],sizeof(int));
		close(p[1]);
		exit(0);
	}
	close(p[1]);
	a[0] += a[1];
	read(p[0],&a[2],sizeof(int));
	close(p[0]);
	wait(0);
	
	a[0] += a[2];
	printf("%d\n",a[0]);
	return 0;
}

```

When closing an end of a pipe within a process, it only closes that end for the current process.
A pipe disappears automatically (destroyed by the OS) only after all its ends are closed.
![[Inter Process Communication 2025-03-27 09.01.30.excalidraw]]


Reading from an empty pipe - read waits 
Writing to a full pipe - write waits 

As an example, write when the pipe is full waits for some space or until there is no process that can read from the pipe.

### Example - Eeny Meeny Miny Moe

![[Inter Process Communication 2025-03-27 09.16.33.excalidraw]]

```c
#inlcude <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#inlcude <sys/wait.h>

int main(){
	int p2a[2], a2b[2], b2p[2];
	pipe(p2a); pipe(a2b); pipe(b2p);
	int n;
	if(fork() == 0){ //process A
		close(p2a[1]); close(a2b[0]); close(b2p[0]);close(b2p[1]);
		while(1) {
			if (read(p2a[0],&n,sizeof(int)) <= 0) //reading gives an error / reads nothing
				break;
			if (n <= 0) {
				break;
			}
			printf("A: %d -> %d\n",n,n-1);
			n--;
			write(a2b[1],&n,sizeof(int));
			
		}
		close(p2a[0]);close(a2b[1]);
		exit(0);
	}
	if(fork() == 0){ //process B
		close(p2a[0]); close(p2a[1]); close(a2b[1]); close(b2p[0]);
		while(1) {
			if (read(a2b[0],&n,sizeof(int)) <= 0) 
				break;
			if (n <= 0) {
				break;
			}
			printf("B: %d -> %d\n",n,n-1);
			n--;
			write(b2p[1],&n,sizeof(int));
		}
		close(a2b[0]); close(b2p[1]);
		exit(0);
	}
	close(a2b[0]); close(a2b[1]); close(b2p[1]); close(p2a[0]);
	n = 7;
	write(p2a[1],&n,sizeof(int));
	while(1) {
		if (read(b2p[0],&n,sizeof(int)) <= 0) 
			break;
		if (n <= 0) {
			break;
		}
		printf("P: %d -> %d\n",n,n-1);
		n--;
		write(p2a[1],&n,sizeof(int));
	}
	close(p2a[1]); close(b2p[0]);
	wait(NULL);
	wait(NULL);
}

```