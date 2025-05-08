# Conditional Variable
___
Class: [[OS]]
Type: 
Tags: #process_syncronization
Date: May 8th, 2025
___

Allows a thread to wait for another one to allow it to continue its execution.

Analogy: 
Suppose you have a server. In case there are > 1000 requests, have a thread signal that the server is busy and kill some requests

```tabs

tab: Waiter

>[!code]
>```c
>while(1){
>	lock(&m)
>	while (thread_number <= 1000) //check if the condition is still valid
>		wait(&c, &m); //wait is actually unlock -> wait -> lock
>	//do stuff
>	unlock(&m)
>}
>```
>

- It's really important to be mindful of the time gap between the moment a signal is sent and the moment the waiter actually does wake up 

- When the waiter wakes up, it needs to validate the condition again. This is important because it may not wake up immediately after it was pinged, meaning that the condition may have changed in between the time when the signal was sent and the moment the thread woke up

tab: Signaler

>[!code]
>```c
>lock(&m)
>m++
>if (thread_number > 1000){
>    signal(&c)
>}
>unlock(&m)
>///do stuff
>lock(&m)
>m--;
>unlock(&m);
>```

```
