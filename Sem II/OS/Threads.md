# Threads
___
Class: [[OS]]
Type: Lecture
Tags: # 
Date: April 10th, 2025
___

One of the downsides of threads is that they duplicate memory
>[!Warning]
>If a thread crashes, the whole server goes down

This is an overview of how the memory allocated for a program looks
![[Memory_of_a_program]]
When forking a process, the *impure* part of memory is copied. 
Threads, on the other hand, share the same memory. The only thing created is a new stack

Threads don't have PIDs, but they do have descriptors
We must wait for thread termination (this is called *joining*)
For compiling, one may need to specify the thread library in the command 
### Example
```tabs
tab: thread_example.c

>[!code]
>```c
> #include <stdio.h>
> #include <pthread.h>
>
>void* f(void*a){
>	printf("thready\n");
>	(void)a;
>	return NULL;
>}
>
>int main(){
>	pthread_t t;
>	pthread_create(&t, NULL, f, NULL);
>	printf("mainy\n");
>	pthread_join(t,NULL);
>}
>```

tab: example2.c
>[!code]
>```c
> #include <stdio.h>
> #include <pthread.h>
>
>void* f(void*a){
>	printf("%d\n", *(int*)a);
>	return NULL;
>}
>
>int main(){
>	pthread_t t[10];
>	for (int i = 0; i < 10; i++){
>		pthread_create(&[i],NULL,f,&i);
>	}
>	for (int i = 0; i < 10; i++)
>		pthread_join(t[i],NULL);
>}
>```
```

