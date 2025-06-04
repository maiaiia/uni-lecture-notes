# FIFO
___
Class: [[OS]]
Type: Lecture + Seminar
Tags: # 
Date: April 3rd, 2025
___
## Intro
A **FIFO** is a named [[pipes|pipe]]. It works in the same manner, but it can be used by unrelated processes as well. 
FIFOs are persistent. They are created either
- in the terminal, using the command `mkfifo`  or
- in the source code (usually `mkfifo(fifo_name, 0600)`)
FIFOs are removed either
- manually afterwards (in the terminal) using `rm` or 
- with `unlink` in the source code

In order to run a program using FIFOs, you need to 
1. Create the FIFOs (either in the source code or in the terminal)
2. Compile each file
3. Execute each file in a separate shell window
4. Remove the FIFOs (in either way)
## Example 

```tabs
tab: File 1
```c
#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>

int main() {
    int a2b, b2a, n;

    a2b = open("a2b", O_WRONLY);
    b2a = open("b2a", O_RDONLY);

    //no error checking for now - when opening fails

    n = 20;
    write(a2b,&n,sizeof(int));
    while(1){
        if (read(b2a,&n,sizeof(int))<=0)
            break;
        if (n <= 0)
            break;
        printf("A %d -> %d\n", n, n-1);
        n--;
        write(a2b, &n, sizeof(int));
    }

    close(a2b); close(b2a);

}
tab: File 2
```c
#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>

int main() {
    int a2b, b2a, n;

    a2b = open("a2b", O_RDONLY);
    b2a = open("b2a", O_WRONLY);

    //no error checking for now - when opening fails

    while(1){
        if (read(a2b,&n,sizeof(int))<=0)
            break;
        if (n <= 0)
            break;
        printf("B %d -> %d\n", n, n-1);
        n--;
        write(b2a, &n, sizeof(int));

    }

    close(a2b); close(b2a);


}
```

Output:
```tabs

tab: Shell 1
A 19 -> 18
A 17 -> 16
A 15 -> 14
A 13 -> 12
A 11 -> 10
A 9 -> 8
A 7 -> 6
A 5 -> 4
A 3 -> 2
A 1 -> 0

tab: Shell 2
B 20 -> 19
B 18 -> 17
B 16 -> 15
B 14 -> 13
B 12 -> 11
B 10 -> 9
B 8 -> 7
B 6 -> 5
B 4 -> 3
B 2 -> 1
```

## FIFO [[Deadlocks]] 
Example - open
For FIFOs, open does not return a file descriptor until another process opens the same FIFO as well but *with the opposite operation*. This is why open is said to be a *blocking call*
![[FIFO 2025-04-16 11.03.32.excalidraw]]
In order to avoid this, make sure to open FIFOs in the same order in both processes
### LAB
```c
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <fcntl.h>
#include <sys/wait.h>

int main()
{
    int pa, pb, fa2b, n, fb2a;
    

    //declarations, read n...
    printf("Enter a positive integer: ");
    scanf("%d", &n);
    n %= 70;
    if (n < 11)
        n += 11;

    if ((pa = fork()) == 0) // process A
    {     
        /*
        scanf("Enter a positive integer: ", &n);
        n %= 70;
         if (n < 11)
             n += 11;
        */

        fa2b = open("fifoa2byz2140", O_WRONLY); //open fifos
        fb2a = open("fifob2ayz2140", O_RDONLY);
        write(fa2b, &n, sizeof (int)); //start the game: process A performs the first writing operation
        while (n > 9) {
            //read n from B...
            read(fb2a, &n, sizeof(int));
            //computations, n--;
            if (n > 9)
                break;
            n--;
            //write new n to B...
            printf("A: n=%d\n", n);
            write(fa2b, &n, sizeof(int));
        }
        close(fa2b); close(fb2a); exit(0); //close fifos and exit
    }
    if (pa == -1){
        printf("Failed to open pipe\n");
        exit(0);
    }


    if ((pb = fork()) == 0) // process B
    {
        //openfifoa2byz2140 fifos ...
        fa2b = open("fifoa2byz2140", O_RDONLY);
        fb2a = open("fifob2ayz2140", O_WRONLY);
        while (n > 9) {
            read(fa2b, &n, sizeof(int);
            if (n < 10)
                break;
            n -= 4;
            printf("B: n=%d\n", n);
            write(fb2a, &n, sizeof(int));
            //read n from A...
            //n-=4;
            //write new n to A...
        }
        // close fifos and exit...
        close(fb2a); close(fa2b); exit(0);

    }
    if (pb == -1){
        printf("Failed to open pipe\n");
        exit(0);
    }


    //wait for processes and return 0...
    wait(NULL);
    wait(NULL);
    return 0;

}

```