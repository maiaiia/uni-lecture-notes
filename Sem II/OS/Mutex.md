# Mutex
___
Class: [[OS]]
Type: Lecture + Seminar
Tags: #process_syncronization
Date: April 17th, 2025
___
An *atomic operation* is an operation that cannot be interrupted 
>[!example] 
>var++ consists of 3 operations (not on macOS though :)) - load data in register, increment value, store data from register.

The purpose of a *mutex* (mutual exclusion) is to turn an operation into an atomic one.


>[!tip]
>- lock always waits until a thread is available
>- trylock returns a zero on success (if the thread is available) and an error number otherwise

## Examples
>[!example]- Tic Tac Toe
>>[!code]
>>```c
>>#include <stdio.h>
>>#include <pthread.h>
>> int turn = 0;
>> int board[3][3]={{-1,-1,-1},{-1,-1,-1},{-1,-1,-1}};
>> pthread_mutex_t m;
>>
>>void show() {
>>	printf("Next: %d\n", turn);
>>	for (int i = 0; i < 3; i++){
>>		for (int j = 0; j < 3; j++)
>>			printf("%3d ", board[i][j]);
>>		printf("\n");
>>	}
>>}
>>void* p0(void* a){
>>	int i,j, full;
>>	while (1) {
>>		pthread_mutex_lock(&m);
>>		full = 1;
>>		if (turn == 0){
>>			for (i=0, i < 3; i++){
>>				for (j = 0; j < 3; j++)
>>					if (board[i][j]==-1){
>>						board[i][j]=0;
>>						full = 0;
>>						break;
>>					}
>>				if (!full)
>>					break;
>>			turn = 1;
>>			show();
>>			if (full){
>>				pthread_mutex_unlock(&m);
>>				break;
>>			}
>>		}
>>		pthread_mutex_unlock(&m); 
>>	}
>>	return NULL;
>>}
>>void* p1(void* a){
>>	int i,j, full;
>>	while (1) {
>>		pthread_mutex_lock(&m);
>>		full = 1;
>>		if (turn == 1){
>>			for (i=0, i < 3; i++){
>>				for (j = 0; j < 3; j++)
>>					if (board[i][j]==-1){
>>						board[i][j]=1;
>>						full = 0;
>>						break;
>>					}
>>				if (!full)
>>					break;
>>				}
>>			turn = 1;
>>			show();
>>			if (full){
>>				pthread_mutex_unlock(&m);
>>				break;
>>			}
>>		}
>>		pthread_mutex_unlock(&m);
>>	}
>>	return NULL;
>>}
>>int main(){
>>	pthread_t t0, t1;
>>	pthread_mutex_init(&m,NULL);
>>	pthread_create(&t0, NULL, p0, NULL);
>>	pthread_create(&t1, NULL, p1, NULL);
>>	
>>	pthread_join(t0, NULL);
>>	pthread_join(t1, NULL);
>>	pthread_mutex_destroy(&m);
>>	return 0;
>>}
>>```
### TODO - tic tac toe de la vio

