time out after 10 sec


```c
void time_out(int semnal){
	//return -1 to user
}
...

signal(SIGALARM, time_out);
alarm(10); //set alarm
```

exemplul
ex 5 
ex 8 
5. 8.