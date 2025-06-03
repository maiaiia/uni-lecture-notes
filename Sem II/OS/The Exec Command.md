# The Exec Command
___
Class: [[OS]]
Type:  Lecture
Tags: # 
Date: March 27th, 2025
___

Say we want to execute the command `grep -E abc a.txt` within a c program

|       |                          Search Path                           |                             No Search Path                              |
| :---: | :------------------------------------------------------------: | :---------------------------------------------------------------------: |
| Array | char*a[]={"grep","-E","abc","a.txt",NULL}<br>execvp("grep",a); | char*a[]={"/bin/grep","-E","abc","a.txt",NULL}<br>execv("/bin/grep",a); |
| List  |         execlp("grep","grep","-E","abc","a.txt",NULL)          |         execl("/bin/grep","/bin/grep","-E","abc","a.txt",NULL)          |

>[!warning]
>When `exec` is ran, it keeps the scope, but eliminates the code of the process and only runs what was specified

Example:
```c
#include <stdio.h>
#include <unistd.h>
int main() {
	printf("abc\n");
	execlp("echo","echo","hello world!\n",NULL);
	printf("qwerty\n");
	return 0;
}
```
This will output: 
```
abc
hello world!
```
%%notice how qwerty was not printed%%

Thus, only one exec can be run for *each process*.

So, by creating a child process
```c
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
int main() {
	printf("abc\n");
	if (fork()==0){
		if(execlp("echo","echo","hello world!\n",NULL)<0);
			exit(1); //stop the child process in case exec is not successful
	}
	printf("qwerty\n");
	wait(0);
	return 0;
}
```
This will now output:
```
abc
hello world!
qwerty
```
OR
```
abc
qwerty
hello world!
```