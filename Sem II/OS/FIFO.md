# FIFO
___
Class: [[OS]]
Type: Lecture
Tags: # 
Date: April 3rd, 2025
___

A FIFO is a special file (a named pipe). It must be created before being used with `mkfifo` and removed manually afterwards with `rm`

In order to run a program using FIFOs, you need to 
1. Create the FIFOs
2. Compile each file
3. Execute each file in a separate shell window
4. Remove the FIFOs
## Example 

```tabs
tab: File 1
>```c
#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>

//FILE 1

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
>```
tab: File 2
```c
#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>

//FILE 2

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


