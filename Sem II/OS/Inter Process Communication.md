# Inter Process Communication
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

This will output the value 6 That is because the child process is, in fact, a *copy* of the parent process, having its own $a$ array, which is different than that of the parent. Thus, for the parent process, the addition $a[2]+a[3]$ is not performed.

## Inter Process Communication Mechanisms
- [[Pipes]]
- [[FIFO]]
- (shared memory) SHM
- (message MSG
- SEM


