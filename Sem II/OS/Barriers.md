# Barriers
___
Class: [[OS]]
Type: Lecture
Tags: #process_syncronization
Date: April 17th, 2025
___

Analogy: Like a bus at the airport waits for all travellers to get in before departing, a barrier waits for all threads to reach it before allowing them to go past a certain point

>[!example]
>Add all the numbers in an array as if in a binary tree 
>![[Barriers 2025-04-17 09.18.18.excalidraw]]
>>[!code]
>>```c
>>#include <stdio.h>
>>#include <pthread.h>
>>
>>int arr[16] = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16};
>>
>>pthread_barrier_t b;
>>
>>void *f(void*a) {
>>	int m = 2, n = 1, k = 8; //k - number of active threads
>>	int id = (int)(long)a;
>>
>>	while (k > 0){
>>		if (id < k) {
>>			arr[m * id] += arr[m * id + n];
>>		}
>>		pthread_barrier_wait(&b);
>>		m *= 2;
>>		n *= 2;
>>		k /= 2;
>>	}
>>	
>>	return NULL;
>>}
>>
>>int main(){
>>	pthread_t t[8];
>>	pthread_barrier_init(&b, NULL, 8);
>>	for (i=0; i<8; i++){
>>		pthread_create(&t[i], NULL,f, (void*)(long)i);
>>	}
>>	
>>    for (i=0; i<8; i++){
>>        pthread_join(t[i], NULL);
>>    }
>>	pthread_barrier_destroy(&b);
>>	printf("%d\n",arr[0]);
>>	return NULL;
>>}
>>```
