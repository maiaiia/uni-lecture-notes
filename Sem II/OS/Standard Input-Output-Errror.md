# Standard Input-Output-Error
___
Class: [[OS]]
Type: Lecture
Tags: # 
Date: March 6th, 2025
___
Standard 
- Input: 0
- Output: 1 
- Error: 2

Each of these are files that one can write to by specifying the file (in - stdin, out - stdout, error-stderr). 
Redirect errors to a file using '2>' 
> note that '>' is actually implicitly '1>'

Redirect errors to the same place as stdout: '2>&1'
The location where unnecessary stuff can be hidden / redirected to on linux is `/dev/null`

## Dup(2)
>[!Question]
>Q: How do pipes work when used in the bash terminal? (as in, how do the commands "know" where to read stuff from)
>A: Using the file descriptor table! 

`dup`, `dup2` - duplicate an existing file descriptor
### Example - simulate a command in C
Command: `ps -ef | grep -E "^root\>" | awk '{print $2}' | tail -n 5`
![[Pipes 2025-04-03 09.21.14.excalidraw]]

 
```c
//There's a mistake somewhere in here but the point of the program still stands
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>
#include <fcntl.h>

int main(){
    int p2g[2], g2a[2], a2t[2];
    pipe(p2g); pipe(g2a); pipe(a2t);

    if(fork()==0) { //ps
        close(p2g[0]); close(g2a[0]); close(g2a[1]); close(a2t[0]); close(a2t[1]);
        dup2(p2g[1],1); //second argument is stdout
        execlp("ps","ps","-ef",NULL);
        exit(1);
    }
   
    if(fork()==0) { //grep
        close(p2g[1]); close(g2a[0]); close(a2t[0]); close(a2t[1]);
        dup2(p2g[0],0);
        dup2(g2a[1],1);
        execlp("grep","grep","-E","^root\\>",NULL);
        exit(1);
    }


    if(fork()==0) { //awk
        close(p2g[0]);close(p2g[1]); close(g2a[1]); close(a2t[0]);
        dup2(g2a[0],0);
        dup2(a2t[1],1);
        execlp("awk","awk","{print $2}",NULL);
        exit(1);
    }
   
    if(fork()==0){
        close(p2g[0]); close(p2g[1]); close(g2a[1]); close(a2t[1]); close(g2a[0]);
        dup2(a2t[0],0);
        execlp("tail","tail","-n","5",NULL);
        exit(1);
    }
    close(p2g[0]); close(p2g[1]); close(g2a[0]); close(g2a[1]); close(a2t[0]); close(a2t[1]);
    wait(0);  wait(0); wait(0); wait(0);

    return 0;
}

```