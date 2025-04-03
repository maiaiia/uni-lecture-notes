# C Stuff
___
Class: [[OS]]
Type: Lab
Tags: # 
Date: March 5th, 2025
___

![[C Stuff 2025-03-05 08.27.59.excalidraw]]
## Dynamic allocation of memory
1. **malloc** - allocate memory, return a void pointer
2. cast a type to the void pointer 
3. **free** the memory when you're done

## Function
atoi - if a no is an integer, convert it to said integer

## Program Examples
```c
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char** argv){
        int i, s = 0;
        for (i = 1; i < argc; i++){
                printf("argv[%d]=%s \n",i,argv[i]);
                s += atoi(argv[i]);
        }

        printf("Sum of arguments is %d\n",s);

        return 0;

}
```

```c
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char**argv){
        FILE* fd = fopen("text.txt", "r");
        char buffer[101];

        if (fd == NULL){
                perror("Error opening file \n");
                exit(0);
        }

        int count = fread(buffer, 1, 100, fd);
        buffer[count] = '\0';
        printf("%s", buffer);
        fclose(fd);
        
        return 0;

}
```