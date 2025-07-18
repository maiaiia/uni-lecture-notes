# Pipes
___
Class: [[OS]]
Type: Lecture + Seminar
Tags: # 
Date: March 27th, 2025
___
## Introduction
Pipes get created in the kernel. Each pipe contains 2 descriptors for reading and writing. When creating a child process, it will also have a copy of the pipe, with the same contents.

>[!Important] Always keep pipes unidirectional 
> In theory, both the parent and the child can write to the same pipe. However, using pipes in this manner may result in the data being mixed up

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

>[!Important] Always close unused ends of pipes ASAP
>- When trying to read from an empty pipe / write to a full pipe, the corresponding function waits. If the pipes are not handled correctly, this behaviour may result in a deadlock. For instance, when calling write on a full pipe, the function waits for some free space or until there is no process that can read from said pipe. (so if the pipe remains unused, but its end is not closed, write may wait forever for it to be emptied)
>- A pipe disappears automatically (it's destroyed by the OS) only after all its ends are closed.

![[Inter Process Communication 2025-03-27 09.01.30.excalidraw]]


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

## Popen
### Example - 99 Beers on the Wall
```c
#include <stdio.h>

int main() {
    int i;
    FILE* f = popen("less", "w");
    for (i = 99; i; i--){
        fprintf(f, "%d bottles of beer on the wall\n", i);
        fprintf(f, "%d bottles of beer\n", i);
        fprintf(f, "You take one down and pass it around\n");
        fprintf(f, "%d bottles of beer on the wall\n\n", i-1);
    }
    pclose(f);
    return 0;
}
```

This is equivalent to using stdin and executing the program with `./beer | less`

## Pipes Seminar

```c
int c2p[2], p2c[2]; // 0-read, 1-write
pipe(c2p); pipe(p2c);
int pid = fork();
if (pid == 0){
	//child process 
	close(c2p[0]); //no reading in the child 
	close(p2c[1]);
	int n = 10;
	char s[30];
	scanf("%s",s);
	int l=strlen(s);
	write (c2p[1],&l,sizeof(int)); //send the size of the string
	write(c2p[1],&s,sizeof(char)*(strlen(s)+1)); //send the string
	close(c2p[1]);
	read(p2c[0],&n,sizeof(int));
	close(p2c[0]);
	exit(0);
}
close(c2p[1]); close(p2c[0]);
int l;
read(c2p[0], &l, sizeof(int)); //blocking call 
read(c2p[0], &s, sizeof(char)*(l+1));
close(c2p[0]);
wait(0);
return 0;
```