# Processes
___
Class: [[OS]]
Type: Lecture
Tags: # 
Date: March 13th, 2025
___
## Race conditions
When you have a common resource and many actors can access it, with at least one changing it.

>[!tip]
>inconsistencies don't always show up! concurrency is chaotic. if there are more processes running in the background, the likelihood of an unexpected result due to race conditions is higher


![[Processes 2025-04-10 09.37.56.excalidraw]]


Solution (for [[Threads]]): mutex the critical lines

```c
#include <stdlib.h>
#include <pthread.h>

int count=0;
pthread_mutex_t m;

void* f(void* a){ 
	int k = 0;
	for (int i = 0; i < *(int)a; i++){
	k++
	}
	pthread_mutex_lock(&m);
	count+=k;
	pthread_mutex_unlock(&m);
	
	return NULL;
}

int main(int argc, char** argv){
	pthread_t t[10];
	int n = 10;
	
	if (argc>1){
		sscanf(argv[1],%d,&n);
	}
	pthread_mutex_init(&m,NULL);
	for(int i = 0; i < 10; i++){
		pthread_create(&t[i],NULL,f,&n);
		
	}
	for(int i=0; i < 10; i++){
		pthread_join(&t[i],NULL,f,&n)
	}
}


```
