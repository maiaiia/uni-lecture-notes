# Old Exam Subjects
___
Class: [[OS]]
Type: Exam Session Prep
___
## (checked) 27.06.2024

1. Give three regular expressions that match any line that contains a least two vowels but no digits.
	1. `cat randomText.txt | grep -E -i "(.)*([aeiou])+(.)*([aeiou])+" | grep -E "([0987654321])" -v`
	2. `grep -E -i "(.)*([aeiou])+(.)*([aeiou])+" randomText.txt | grep -E "([0987654321])" -v` (doesn't really count though I think)
	3. `grep -E -i "(.)*([aeiou])+(.)*([aeiou])+" randomText.txt | grep -E "([0-9])" -v` (still don't know if it counts as different)
	4. `sed -n "s/^[^0-9]*$/&/gp" testFile.txt | sed -n "s/[aeiou].*[aeiou]/&/pi"` (and i could technically invert the order of the pipes but i bet that's not valid either)
	5. some sort of awk
2. Give a GREP command that display all the lines in a file that contain an even number of vowels (among other potential characters).
	- `grep -Ei "^([^aeiou])*([aeiou]([^aeiou])*[aeiou]([^aeiou])*)+$" randomText.txt`
3. Write a SED command that will display from a file only the lines that contain exclusively a valid artihmetical expression of integer additions and subtractions.
	- `sed -n -E "s/^(-?[0-9]+)(([+-]{1}[0-9]+)*)$/&/p" testFile.txt`
4. Write an AWK command that displays the sum of the fields on the position equal to the current line number. (assume fields are separated by ':')
	- `awk -F: 'BEGIN{I=0; sum=0}{I++; sum+=$I}END{print sum}' numbers.txt`
5. Give two solutions for hiding a commands standard and error outputs by redirecting them to /dev/null.
	1. `>/dev/null 2>/dev/null`
	2. `>/dev/null 2>&1` 
6. Write a UNIX Shell script that asks the user for a directory name and insists until it gets a directory that does not exist already.
	- solution:
		```bash
		#!/bin/bash
		
		FOUND=1
		while [ $FOUND -eq 1 ]; do
			read INPUT
			if [ -d $INPUT ]; then
				echo Directory already exists
			else
				echo $INPUT is a new directory!
				FOUND=0
			fi
		
		done
		```
7.  Draw the hierarchy of processes created by the code below, including the parent process.
	- code
		```c
		for(i=0; i<2; i++) {
			fork();
			execl("/etc", "/etc", NULL);
		}
		```
	- solution:
		```
		If the instruction is successful:
			P
			|
			C
			this is because both the parent and the first child process execute the `execl` instruction. once that happens, no future lines are executed.
		If the instruction is not executed (i.e. error occurs):
			 P
			| \
			C1 \
			|   \
			C2   C3
			if execl cannot be correctly executed, processes continue their execution in the current scope
		```
8. Add the necessary lines of C code so that the instruction below overwrites the content of a file b.txt. Do not change the instruction: `execlp("sort", "sort", "a.txt", NULL);`
	- solution
		```c
		int fd = open("b.txt", O_WRONLY);
		dup2(fd,1);
		execlp("sort","sort","a.txt",NULL);
		```
9. Why is it not advisable to communicate bidirectionally through a single pipe?
	- because the data may get mixed up in between processes (meaning that a process A may, for instance, send data intended for process B to the pipe and then read that exact same data, if process B does not get CPU in time to read before A)
10. What will display the sequence of commands below, considering the f is created successfully?
	- code
		```bash
		mkfifo f
		echo asdf > f
		cat f
		```
	- solution
		- echo is a blocking call! the fifo is opened with write permissions, but open waits for the fifo to also be opened with read permissions
		- same goes for cat
		- if the commands are ran in the same window / script / whatever -> deadlock
		- if 2 different processes run each command (echo and cat), regardless of the order, then the one calling cat will display asdf. afterwards, both processes will stop
		- extra: if, instead of `echo`, a simple redirect were used, then the reading and writing would not have stoped 
		- my english is horrendous 
11. When would you prefer using a process instead of a thread?
	- threads are usually used for performing small tasks, while processes are used for bigger tasks
	- threads: 
		- pros:
			- communication between threads is much easier (more mechanisms available) and faster
			- threads are more lightweight - only a new stack (and a copy of the registers) is needed
			- switching between threads takes less than switching between processes
			- threads can exercise control over threads of the same process
		- cons:
			- shared code and shared data may make multi-threaded code harder to work with
			- race conditions, critical resources
			- ==if a thread crashes, the whole system does==
		- neutral? can be either a pro or a con
			- changes to a thread may affect behaviour of other threads
	- processes: 
		- pros:
			- a process being terminated does not imply the failure of the entire system
			- the only way to call `execl/v`, is if you create a new process!
			- ==if a child process crashes, the parent process is unaffected== 
		- cons:
			- processes use a lot of space (when forking a process, the entire 'impure' part of the memory is duplicated)
			- communication is harder - interprocess communication methods like pipes, fifos, shm segments must be used
			- processes can only exercisde control over the samee process
		- neutral:
			- changes to parent process do not affect child process
12. What is a "critical resource"?
	- a critical resource is a resource that is accessed by multiple actors that run concurrently and is modified by at least one of them. 
13. Why does the pthread_cond_wait call get also a mutex as argument?
	- pthread_cond_wait performs multiple operations: 
		- upon call
			- it releases a mutex
			- it waits for a signal to be sent via a conditional variable
		- upon successful return
			- it locks the mutex again
	- so both the conditional variable and the mutex must be passed as arguments
	- the reason why the mutex is needed is because it is meant to protect a critical resource that is tied with the condition needed for the waiting thread to do a certain action. after the wait call is finished, the condition must be checked again, to make sure that it is indeed met (and since that condition is tied to some critical resource, that resource must be protected by a mutex when accessed)
14. What will be the effect of replacing calls to pthread_mutex_lock with calls to pthread_rwlock_wrlock?
	- read write locks are optimisations of the mutex. They allow multiple readers to access one critical resource, but only one writer to modify it. 
	- In theory, rwlocks are supposed to make the execution faster. In practice, however, there are certain cases - when the number of readers and writers is disproportionate - when they may actually slow down execution. The greater the ratio between readers and writers becomes (for instance; it can also go the other way), the more difficult it becomes for a writer to get a write lock. This is called *starvation*. 
15. What is the effect of calling sem_wait on a semaphore with value zero?
	- The thread calling sem_wait is stuck waiting on the semaphore until its value increases. It may not continue its execution otherwise.
16. How can you decrement the value of a POSIX semaphore?
	- By calling sem_wait(). Note that the value of the semaphore cannot be decreased once it becomes 0
17. What can you do as a software developer to prevent deadlocks? Justify your answer.
	- Deadlocks can have 4 causes: mutual exclusion, hold and wait, no preemption and circular wait. To prevent deadlocks, developers can break one or more of these conditions. Out of them, however, the one that is most easily prevented is circular wait; in this case, deadlocks can be avoided by simply establishing an order in which resources are locked and sticking with it. 
	- the other causes can't be prevented: eliminating mutexes is dangerous to the integrity of the data; hold and wait deadlocks may be "solved" by either freeing all blocked resources before asking for one or blocking all necessary resources on start (both of which defy the purpose of concurrency and slow execution down), and trying to introduce preemption may cause livelocks
18. What state transition will a process undergo when writing to a file?
	- when writing to a file, a process will go from a RUN to a WAIT / BLOCK state. This is done in order to avoid needlessly taking up CPU (and allow it to perform other tasks), due to the fact that I/O operations, such as writing to a file, take a long time.  After writing has finished, the process goes to a READY state and waits for the operating system (or the process, depending on the scheduling type) to allow it to run again
19. What is the content of the superblock on a Linux disk?
	- the superblock contains global information about the entire file system, such as block size, I-node number and size, and a pointer to the head of a list of empty blocks.
20. Considering that a block can contain N addresses towards other blocks, how many data blocks are addressed by an i-node's double and triple indirections together?
	- $N^2 + N^3$ (a simple indirect node has N direct nodes, each pointing to one block. a double indirection has N simple indirect nodes and a triple indirection has N double indirections)

## (2-to check) 2021-2022
1. How many threads would you use for processing a million files? Justify your choice.
	- i would use a number of threads proportional (and at least equal to) to the number of cores on the processor so there is a balance between having too many threads that don't actually get to use the processor and too few threads, which would lead to the CPU not being used to its full capacity. however, i think that choosing the number of threads to use highly depends on the type of processing that is done and should be established empirically
2. Give an example of values for T, N1, N2 and N3 s.t. the program below reaches its end
	```c
	pthread_barrier_t b1, b2, b3;
	
	void* f1(void* a)
	{
		pthread_barrier_wait(&b1);
		return NULL;
	}
	
	void* f2(void* a)
	{
	        pthread_barrier_wait(&b2);
	        return NULL;
	}
	
	void* f3(void* a)
	{
	        pthread_barrier_wait(&b3);
	        return NULL;
	}
	
	int main()
	{
		int i;
		pthread_t t[T][3];
	
		pthread_barrier_init(&b1, N1);
		pthread_barrier_init(&b2, N2);
		pthread_barrier_init(&b3, N3);
		for (i = 0; i < T; i++)
		{
			pthread_join(t[i][0], NULL);
			pthread_join(t[i][1], NULL);
			pthread_join(t[i][2], NULL);
		}
		pthread_barrier_destroy(&b1);
		pthread_barrier_destroy(&b2);
		pthread_barrier_destroy(&b3);
		return NULL;
	}
	```
	- any number works? the threads are not initialised anywhere and there are no calls to none of the functions? if the intention was, however, to create the threads and call each function T times, then any positive values would work, as long as T = N2 = N2 = N3
3. Why do I/O operations cause a process to move from the state RUN to the state WAIT?
	- Because I/O operations take a long time. If the process were to remain in a RUN state, it would keep the processor "busy" for no reason. instead, by having it move to the "wait" state, other tasks can be performed in the meantime 
4. How is the address calculation done in the absolute fixed partition allocation?
	- in absolute fixed partition allocation, the memory is split into partitions of fixed size. processes are compiled for one specific partition and may only be run there. thus, addresses are simply hardcoded by the compiler as physical (real) addresses
5. Give an advantage and a disadvantage of the First-Fit placement policy versus the Worst-Fit
	- First-Fit is faster than Worst-Fit, since the latter implies searching through the entire memory in order to find the worst (biggest) block of memory to allocate, whereas, for the former, the search stops at the first block that is available and fits the request
6. What is the most prioritary memory page that the NRU replacement policy chooses as victim page?
	- the NRU (not recently used) replacement policy assigns a 2 bit marker to each page currently loaded in the internal memory, each corresponding to an access mode (0-read, 1-write). Every time a file is accessed, its marker is updated correspondingly. When a page needs to be evicted, the one whose marker has the lowest value is chosen (so the pages are evicted in increasing order with regards to the markers 0->1->2->3)
7. Considering that the size of a block is B and the size of an address is A, how many data blocks are addressed by the triple indirect addressing of an i-node?
	- $A^3$ blocks, each of size $B$. (a simple indirect addressing node stores A direct addressing nodes, a double indirect addressing node stores A simple indirect....)
8. Write a regular expression that accepts lines that contain the letter "a" but do not contain the letter "b"
	- `a[^b]`
9. What is the maximum number of child processes, created by the code fragment below, that can coexist simultaneously?
	```c
	for (i = 0; i < 7; i++)
	{
		if (fork() == 0)
		{
			sleep(rand() % 10);
			exit(0);
		}
		if (i % 3 == 0)
		{
			wait(0);
		}
	}
	```
	- a total of 7 child processes are created (all of them having the same parent; no child process creates any other processes)
	- the condition `i % 3 == 0` is true for $i \in \{0,3,6\}$, so 3 child processes are 'killed'
		- before wait is called for the first time, only one child process is running. afterwards, there remain none
		- before the second wait, there may be at most 3 child processes running. afterwards, 2 remain
		- before the third wait, there may be at most 5 child processes running. this is the maximum number of child processes that can coexist
10. Processes A, B and C communicate through FIFOs X, Y and Z according to the diagram below. Sketch the code fragments that open the FIFOs in the 3 processes.
	```
	A --X--> B
	B --Y--> C
	C --Z--> A
	```

	```c
	int x[2], y[2], z[2];
	pipe(x); pipe(y); pipe(z); 
	if (fork() == 0){ //A
		close(y[0]); close(y[1]); //unused
		close(x[0]); close(z[1]);
		//...
		close(x[1]); close(z[0]);
	}
	if (fork() == 0){ //B
		close(z[0]); close(z[1]);
		close(y[0]); close(x[1]);
		//...
		close(y[1]); close(x[0]);
	}
	if (fork() == 0){ //C
		close(x[0]); close(x[1]);
		close(z[0]); close(y[1]);
		//...
		close(z[1]); close(y[0]);
	}
	close(x[0]); close(x[1]);
	close(y[0]); close(y[1]);
	close(z[0]); close(z[1]);
	
	```
11. Why can a hard-link only be created toward files on the same partition and not toward files on other partitions? 
	- A hard link is a \<fileName, I-node_number\> pair. I-node numbers are unique inside each partition. Additionally, different partitions may even correspond to different file systems, that are configured differently (the number of I-nodes may be different, for instance)
## (3-to check) 2023
1. Give three regular expressions that match any non-negative number that is a multiple of 5
	- `\<\+?[0-9]*[05]\>`
	- `\<\+?[0-9]{0,}[05]\>`
	- `\<\+?[0-9]{0,}[05]+\>`
	- `\<[0-9]*0|[0-9]*5\>`
2. Give 5 GREP commands that display all the lines in a file that contain the letter "a" (either uppercase of lower case)
	- `grep -E "[aA]" testFile.txt`
	- `grep -Ei "a" testFile.txt`
	- `grep -Ei "[aA]" testFile.txt`
	- `grep -Eiv "^[^a]+$" testFile.txt`
	- `grep -E "a|A" testFile.txt`
	- `grep -Ei ".*a.*" testFile.txt`
3. Write two SED commands that display from a file only the lines that do not contain the digit '7'
	- `sed -n -E "s/^[^7]*$/&/p" testFile.txt`
	- `sed -n -E "s/^[^7]*$/&/pg" testFile.txt`
	- `sed -E "s/^.*7.*$//" testFile.txt` - i don't know if this counts, but in this case the lines containing '7' are transformed into empty lines
	- `sed -n '/7/!p' testFile.txt`
	- `sed '/7/d' testFile.txt`
4. Write an AWK command that displays the sum of the next to last field of all lines
	- `awk -F: 'BEGIN{sum=0}{i=NF-1;sum+=$i;print i,$i}END{print sum}' numbers.txt`
5. How can one redirect in the command line the standard error through pipe to another program?
	- `command 2>&1 | program2`
6. Write a UNIX Shell script that displays all command line arguments without using FOR
	- solution:
		```bash
		#!/bin/bash
		
		while [ $# -gt 0 ]; do
		        echo $1
		        shift 1
		done
		```
7. Draw the hierarchy of processes created by the code below, including the parent process: 
	```c
	for (i = 0; i < 3; i++){
		fork();
		execlp("ls", "ls", "/", NULL);
	}
	```
	- solution:
		```
		P
		|
		C
		```
		- both the parent and the child process reach the (correct) instruction `execlp`. Both will run it and then immediately stop their executions
8. Add the necessary code so that file b.txt is overwritten with the content of file a.txt from the instruction `execlp("cat", "cat", "a.txt", NULL);`
	- solution:
		```c
		if (fork() == 0){
			int fd = open("b.txt", O_WRONLY);
			dup2(fd, 1);
			execlp("cat", "cat", "a.txt", NULL);
		}
		wait(0);
		```
9. Why is it not advisable to communicate bidirectionally though a single FIFO?
	- because data may get mixed up (one process may read the same data it wrote to the FIFO, which was originally intended to be read by another process)
10. How many FIFOs can a process open if they are not and will not ever be used by any other process?
	- none. for FIFOS, open is a blocking call, meaning that it waits for a different process to open the same FIFO, but with the opposite permissions. if no other process does so, the execution is blocked => deadlock
11. When would you prefer using a process instead of a thread?
	- answered
12. What is a "critical section"?
	- a critical section is a section of code where a critical resource is accessed (either read or modified). a critical resource is a resource that is accessed by multiple actors (and modified by at least one of them)
13. Why should the thread recheck the condition after returning from the pthread_cond_wait call?
	- because there is no guarantee that the condition has not changed again in-between the time when the signal is sent and the moment of returning from pthread_cond_wait (what's important is to note that this time frame *exists* and that changes to the condition may occur)
14. What will be the effect of replacing calls to pthread_mutex_lock with calls to pthread_rwlock_rdlock
	- answered
15. What is the effect of calling pthread_barrier_wait on a barrier initialized with 1?
	- there is no effect - the thread will continue its execution without having to wait. the barrier will be automatically reinitialised with value 1.
16. How can you increment the value of a POSIX semaphore?
	- yes, by calling the sem_post() method upon said semaphore
17. What can you do as a software developer to prevent deadlocks?
	- already answered
18. What state transition will a process undergo when reading from a file?
	- already answered
19. What is the content of the superblock on a Linux disk?
	- already answered
20. Can you create a hard link towards a file on a different partition? Justify your answer.
	- already answered
## (4-to check) 2018-2019/2 - Test D
1. Write a UNIX Shell command that displays all the lines in a file a.txt that contain at least one number with more than 2 decimal digits
	- `grep -E "\<[0-9]+\.[0-9]{2,}\>" a.txt`
2. Write a UNIX Shell command that eliminates all non-letter characters from file a.txt 
	- `sed -E "s/[^a-zA-Z]//g" a.txt`
3. Write an AWK program that applied to a file containing words separated by spaces, calculates the average word count per line
	- `awk 'BEGIN{sum=0;lin=0}{sum+=NF;lin+=1}END{print sum/lin}' a.txt`
4. Display all the unique file names (without the path) in a given directory and all its hierarchy of subdirectories
	- solution:
		```bash
		#!/bin/bash
		
		if ! [ $# -eq 1 ]; then
		        echo Please enter one argument only
		        exit 1
		fi
		
		DIR=$1
		if ! [ -d $DIR ]; then
		        echo $DIR is not a directory
		        exit 1
		fi
		
		
		FILES=$(find $DIR -type f -exec basename {} \; | sort | uniq)
		DIRECTORIES=$(find $DIR -type d)
		
		for DIRECTORY in $DIRECTORIES; do
		        echo $DIRECTORY
		done
		
		for FILE in $FILES; do
		        echo $FILE 
		done
		```
	- sol 2: `find d -type f -exec basename {} \; | sort | uniq` - files ony
	- sol 3: `find dir1 -type f | awk -F/ '{print $NF}'  | sort -u` - files only
5. Write a UNIX shell script that calculates the average number of lines in the files with the .txt extension in the current directory
	- solution
		```bash
		#!/bin/bash
		
		SUM=0
		CNT=0
		FILES=$(ls)
		for FILE in $FILES; do
		    if [ $(echo $FILE | grep -E "^.*\.txt$" -c) -eq 1 ]; then
		        #SUM=$SUM + $FILE
		        LINES=$(wc -l < $FILE)
		        SUM=$((SUM + LINES))
		        CNT=$((CNT + 1))
		    fi
		done
		AVG=$((SUM/CNT))
		echo $AVG
		
		```
6. How many processes will be created by the code fragment below, excluding the parent process? 
	```c
	for(i=0;i<6;i++)
		if(i%3 != 1)
			fork();
	```
	- a fork is performed for $i \in \{0,2,3,5\}$. Every time, all processes create a child process of their own, so the total number of processes is doubled. The total number of processes (excluding the parent) is $2^4-1 = 15$ 
7. How many processes are created by the parent process P, when it calls f(3) and what is their relationship with each other and with the parent process P?
	```c
	void f(int n){
		if (n > 0 && fork() == 0){
			f(n-1);
			exit(0);
		}
		wait(0);
	}
	```
	- solution:
		```
		P 
		|
		C3
		|
		C2
		|
		C1
		```
		- only child processes create new child processes, so a total of 4 child processes will be created, but only the first one will be a direct child of P. 
		- note that, after n becomes 0, the fork is not executed (due to the fact that the `&&` operator was used, and not `&`)
8. What will the code fragment below print to the console?
	```c
	char *s[3] = {"X", "Y", "Z"};
	for (i = 0; i < 3; i++)
		execl("/bin/echo", "/bin/echo", s[i], NULL);
	```
	- it will print X (after a call to execl is successfully executed, the process ends)
9. What does the system call "read" do when the FIFO contains less data then it is required to read, but it is not empty?
	- it reads a number of bytes from the FIFO and proceeds with the execution (reading is done)
10. What will the code fragment below print to the console, if no other process opens the "abc" FIFO? Justify your answer.
	```c
	int r, w, n = 0;
	r = open("abc", O_RDONLY);
	n--;
	w = open("abc", O_WRONLY);
	n--;
	printf("%d\n", n);
	```
	- open is a blocking call, so, on line 2, the process will enter a deadlock (it will wait for another process to open "abc" with write permissions)
11. What happens with a process between the moment it finishes and the moment its parent calls wait?
	- the process turns into a zombie and waits for the parent to call wait upon it. this behaviour enables the parent process to access the exit code of the child process.
12. impossible to read
	- 
13. scheduling thing
	- 
14. Consider the producer consumer problem with a buffer of capacity N. How many semaphores would you use to ensure operation correctness and what would the semaphores' initial values be?
	- i would use 3 semaphores
		- a binary semaphore that works as a mutex
		- a semaphore for the empty bytes, initialised with E
		- a semaphore for the full bytes, initialised with 0
15. Add the necessary instructions to the code fragment below, so that the stdin of command /bin/pwd is read from PIPE p
	```c
	int p[2];
	
	pipe(p);
	close(p[1]); //added
	if(fork()==0){
		dup2(p[0],0); //added
		close(p[0]); //added
		execl("/bin/pwd", "/bin/pwd", NULL);
		exit(1);
	}
	close(p[0]); //added
	wait(NULL); //added
	```
	- 
## (5-to check) 29.06.2023

1. scrieti un grep care ia grupurile de cate 2 cuvinte, separate de un singur spatiu, care sunt formate doar din litere mici si fiecare cuvant contine cel putin 2 vocale
	- `grep -Eo "(\<[a-z]*[aeiou][a-z]*[aeiou][a-z]*\> \<[a-z]*[aeiou][a-z]*[aeiou][a-z]*\>)" testFile.txt`
2. scrieti 2 grep uri care iau liniile care nu au numarul de caractere multiplu al lui 3
	- `grep -Ev "^(.{3})*$" test2.txt`
	- `grep -E "^(.{3})*.$|^(.{3})*(.)(.)$" test2.txt`
	- `grep -Ev "^(...)*$" test2.txt`
	- `grep -E "^(...)*..?$" test2.txt`
3. scrieti un sed care inlocuieste prima aparitie a caracterului A cu caracterul B
	- `sed "s/A/B/" testFile.txt`
4. scrieti un awk care afiseaza liniile care au primul cuvant identic cu ultimul cuvant si al caror penultim cuvant are numar par de caractere
	- `awk '{len=length($(NF-1));if (NF>1&&$1==$NF && len%2==0) print $0}' a.txt`
5. scrieti 3 moduri de a crea un fisier gol
	- `touch file.txt`
	- `echo -n > file.txt`
	- `> file.txt + Ctrl C`
	- `:> file.txt` (: is null command)
	- `cat /dev/null > file.txt`
6. scrieti 5 moduri de a verifica daca un string este gol(cu test)
	- `test $s = ""`
	- `test -z $s`
	- `test $s`
	- `! test $s != ""`
	- 
7. afisati ierarhia proceselor a urmatorului cod:
	- code: 
		```c
		for(int i = 0; i < 3; i++)
		    if (fork() != 0)
		        wait(NULL);
		```
	- solution:
		- wait is a blocking call. since no child processes are killed, the execution of each process that creates a child will stop immediately afterwards (deadlock). The only way to solve this deadlock is if the last child is killed during the rest of the execution
		```
		P
		|
		C1
		|
		C2
		|
		C3
		```
8. scrieti ce afiseaza codul:
	- code:
		```c
		execlp(“expr”,”expr”,”a”,”+”,”1”);
		printf(“xyz\n”);
		```
	- solution:
		- if `expr a + 1` were a valid expression, it would have displayed its result and the rest of the code would not have been executed
		- since it is not valid, the execution continues and xyz is printed
9. schitati o implementare a functiilor popen si pclose
	- solution:
		- open a pipe 
		- create a child process
		- if popen is called with "r":
			- in the child process
				- redirect stdout to the pipe
			- in the parent process
				- redirect stdin from pipe
		- if popen is called with write permissions:
			- in the child process
				- redirect stdin from pipe
			- in the parent process
				- redirect stdout to pipe
		- in both cases, have the child execute the command
10. cate FIFO pot fi deschise de catre un fisier daca fiecare dintre acele FIFO-uri va avea capatul celalalt deschis de catre un alt proces?
	- oricat de multe, cat timp ordinea in care sunt deschise fifo-urile coincide pentru ambele procese
11. cand am dori sa folosim execl si cand am dori sa folosim execv?
	- execl are ca argumente stringuri, in timp ce execv are ca argument un array de stringuri. Astfel, se prefera folosirea comenzii execl cand dorim sa hard-codam o comanda (i.e. cand comanda ce trebuie executata este cunoscuta la momentul elaborarii codului), si cea a comenzii execv atunci cand se doreste mai multa flexibilitate (i.e. comanda poate fi stabilita la momentul executiei - spre exemplu, transmisa ca argument sau introdusa de utilizator)
12. definiti notiunea de sectiune critica
	- o sectiune critica este o "bucata" de cod in care este accesata o resursa critica. O resursa critica este o resursa accesata concurent de mai multi actori (threaduri sau procese) si modificata de cel putin unul
13. care sunt consecintele inlocuirii lui pthread_mutex_lock cu sem_wait in cod? (si presupun ca unlock cu post)
	- daca semaforul este initializat cu 1, nimic (practic, un semafor este o generalizare a conceptului de mutex)
14. definiti un semafor binar si explicati cum functioneaza
	- un semafor binar este un semafor initializat cu valoarea 1. functioneaza exact ca un mutex.
15. scrieti un mod de a preveni deadlock
	- se poate preveni un circular wait prin prestabilirea unei ordini in care sunt blocate resursele si respectarea acesteia pe tot parcursul executiei
16.  prin ce stare(gen ready, wait, swap, etc) trece un proces cand apelam pthread_join?
	- run -> wait / blocked (cat timp se asteapta finalizarea executiei threadului respectiv) -> ready 
17. daca avem B drept block size si A drept address size, cate adrese o sa aiba un double indirect dintr-un i-node?
	- $A^2$ adrese, fiecare corespunzand unui block de dimensiune $B$ 
18. ce se intampla cu continutul directorului in care montam o partitie?
	- acesta nu mai este vizibil / accesibil. la momentul demontarii partitiei, continutul redevine accesibil
## ??.??.2023
1. Give a regular expression that matches any odd number of words, each word having an odd number of letters.
	- `grep -Ei "^(\<([a-z][a-z])*[a-z]\> +\<([a-z][a-z])*[a-z]\> +)*\<([a-z][a-z])*[a-z]\>$"`
2. Give four commands that display the number of empty lines in a file.
	- `grep -E "^$" testFile.txt | wc -l`
	- `sed -En "s/^$//p" testFile.txt | wc -l`
	- `awk 'BEGIN{e=0}{if (NF==0)i++}END{print i}' testFile.txt`
	- `grep -Ev "." testFile.txt | wc -l`
3. Write a SED command that displays a file's lines deleting the first, the third, the fifth, the seventh, etc space on those lines
	- `sed -E "s/( )([^ ]* ?)/\2/g" a.txt`
4. Write an AWK command that displays the product of the last field of lines on odd positions having an odd number of fields.
	- `awk -F: 'BEGIN{p=1}{if (NR%2==1 && NF%2==1){p=1;for(i=1;i<=NF;i++)p*=$i}}END{print p}' numbers.txt`
5. Give four ways of redirecting the standard output of a process.
	- using dup2: `(dup2(fd,1));`
	- using redirection in the command line: `>` or `>>`
	- using pipes in the command line: `|`
	- using popen?
6. Write three UNIX Shell commands that check the existence of a file.
	- `test -f filename`
	- `[ -f filename ]`
	- `[ -e filename ]`
	- `for FILE in *; do; echo $FILE | grep filename; done`
	- `FILES=$(find ./ -name filename);`
	- `FILES=$(find ./ -name filename);MATCHES=$(echo $FILES | wc -l); if [ $MATCHES -eq 1 ]; then; echo found; fi`
7. Draw the hierarchy of processes created by the code below, including the parent process.
	```c
	    for(i=0; i<3; i++) {
	        if(execlp("ls", "ls", "/", NULL) != -1) {
	            fork();
	        }
	    }
	```
	- solution:
		```
		P
		```
8. Add the necessary code so that the instruction below does not get stuck waiting for standard input: `execlp("cat", NULL);`
	- 
9. Sketch an implementation of the popen and pclose functions, only for the case when the command output should be read in the C code.
	- popen:
		- function will only have a command as parameter (since the permission is implicitly "r")
		- create a pipe and open it
		- fork and create a child process
		- in the child process
			- close the end of the pipe used for reading
			- use dup2 to redirect output to pipe (dup2(pipe\[1], 1))
		- in the parent process
			- close the end of the pipe used for writing
			- open a FILE* stream to read from pipe and return it
	- pclose:
		- close the stream 
		- wait for the child process to terminate

10. How many FIFOs can a process open for reading if the FIFOs are and will ever be used by other processes only for reading?
	- if the FIFOS have not been opened anywhere else for writing, 
11. When would you prefer using a FIFO instead of a pipe?
	- 
12. What is a "critical section"?
	- 
13. When would you prefer using a mutex instead of a rwlock?
	- 
14. What will be the effect of replacing calls to pthread_mutex_lock with calls to sem_wait?
	- 
15. What does pthread_cond_wait do with the mutex it gets as argument?
	- 
16. Sketch a solution for the producer-consumer problem.
	- 
17. What can you do as a software developer to prevent deadlocks?
	- 
18. What state transition will a process undergo when it calls pthread_cond_wait? Justify your answer.
	- 
19. What is the content of file of type directory in the Linux file system?
	- 
20. Explain the difference between a symbolic link and a hard link.
	- 
## 2017-2018
1. Write a UNIX Shell command that displays the lines in a file a.txt that contains words starting with capital letters
	- 
2. Write a UNIX Shell command that inverts in file a.txt all pairs of neighboring digits (ex: a3972b -> a9327b)
	- 
3. File a.txt contains on each line two numbers separated by space. Write a UNIX Shell command that displays for each line the sum of its numbers
	- 
4. Display only the lines of file a.txt that appear only once (not duplicated).
	- 
5. Write a UNIX Shell script that displays the name of each .txt file in the current directory that contains the word "cat".
6. In the program fragment below, mark which process executes each line: the Parent, the Child, or both.
```c
k = fork();
if (k == 0){
	printf("A\n");
}
else{
	printf("B\n");
}
printf("C\n");
```
7. How many processes will be created by the code fragment below, excluding the initial parent process? `fork(); wait(0); fork(); wait(0); fork();
	- 
8. What are the possible console outputs of the following code fragment (ignoring any output that execl might generate), and when will they happen?: `printf("A\n"); execl(.....); printf("B\n");`
	- 
9. What does the system call "read" do when the pipe is empty?
	- 
10. What does the system call "open" do before returning from opening a FIFO?
	- 
11. Give a reason for choosing threads over processes
(not my answer)
	1. efficiency: threads are generally more lightweight than processes. creating a thread requires fewer system resources compared to creating a new process. threads share the same memory space, file descriptors, and other resources of the process that created them, resulting in lower overhead and faster communication between threads. this makes threads a more efficient option when multiple tasks need to be performed concurrently within a single program.
	2. shared memory: threads within a process can directly access and modify shared memory. this allows for efficient communication and data sharing between threads without the need for complex interprocess communication mechanism, such as pipes or sockets. Sharing data between threads can be simpler and faster compared to sharing data between separate processes.
	3. synchronization: threads can easily synchronize their execution using mechanisms like locks, semaphores, and conditional variables. Synchronization primitives enable threads to coordinate their activities, share resources safely, and avoid race conditions when accessing shared data. Inter-thread communication and coordination are generally simpler to implement and understand than inter-process communication.
12. Considering that functions "fa" and "fb" are run in concurrent threads, what will the value of "n" be after the threads are finished? why?
	- 
13. Schedule the following jobs (given ads Name/Duration/Deadline) so that they all meet their deadlines: A/5/9, B/7/13, C/1/10
	- 
14. Give one advantage and one disadvantage of the segmented allocation method over the paged allocation method
	- advantage: flexibility in memory allocation
		- segmented allocation allows for more flexible memory allocation compared to paged allocation. In segmented allocation, memory is divided into variable-sized segments, where each segment can represent a logical unit or a specific module of the program. This flexibility is beneficial when dealing with programs that have varying memory requirements for different modules or data structures. Segmented allocation can efficiently allocate memory for modules of different sizes without the fixed-size restrictions imposed by the paged allocation method.
	- disadvantage: external fragmentation
		- one significant disadvantage of the segmented allocation method is the potential for external fragmentation. external fragmentation occurs when free memory blocks are scattered throughout the memory space, resulting in the inability to allocate contiguous memory blocks for larger segments or modules. over time, as segments are allocated and deallocated, small gaps of unused memory may form between allocated segments, even when the total amount of free memory is sufficient. Dealing with external fragmentation requires additional memory management techniques, such as compaction or dynamic relocation, to reclaim fragmented memory blocks and provide larger contiguous memory spaces. paged allocation, on the other hand, can mitigate external fragmentation by dividing memory into fixed-size pages, allowing for more efficient memory allocation and utilization.
15. When would you load into memory the pages of a program that is being started?
	- demand paging is a technique where pages of a program are loaded into memory only when they are actually accessed or needed during the program's execution. when the program is first started, the operating system loads the initial set of pages that are required for program execution, such as the program's entry point and any necessary libraries or shared code.
16. When does a process change state from RUN to READY?
	- a process changes states from RUN to READY when it is no longer executing on the CPU and is temporarily suspended, waiting for the CPU to be allocated to it again.
17. Given a UNIX file system configured with a block size of B bytes that can contain A addresses, and i-nodes having S direct links, one simple indirection link, one double indirection link, and one triple indirection link, give the formula for the maximum file size possible.
18. What happens with the data when you delete a file that has a hard link pointing to it?
	1. reference count adjustment: each file on a file system has an associated reference count. when a file is created, the reference count is set to 1. each hard link to the file increments the reference count by 1. when a hard link is deleted, the reference count is decremented by 1.
	2. deletion of the directory entry: when you delete a file by removing its directory entry (using a command like `rm`), the directory entry is removed from the directory listing. this action removes the association between the file name and the file's metadata.
	3. reference count check: after deleting the directory entry, the file system checks the reference count of the file. If the reference count reaches zero, it means there are no more hard links pointing to the file.
	4. actual file deletion: when the reference count of the file reaches zero, indicating that no more hard links exists, the file system preoceeds to delete  the file's contents and release the disk space occupied by the file. however, if there are still one or more hard links pointing to the file (i.e., the reference count is greater than zero), the file contents remain intact, and only the directory entry associated with the deleted hard link is removed.
	-  hard links provide multiple names (directory entries) for the same file, and the file is not truly deleted until the reference count reaches zero. As long as there is at least one hard link remaining, the file's data is still accessible and can be modified through the remaining hard link(s).
19. Give a method for preventing deadlocks.
	1. 1. use a proper resource allocation strategy: employ a resource allocation strategy that ensures that resources are allocated in a wy that avoids circular wait conditions, one of the necessary conditions for deadlocks occurence. this can be achieved by implementing resource allocation algorithms such as the Banker's algorithm or using techniques like resource ordering
	2. avoid holding multiple resources simultaneously: encourage processes to request and acquire only one resource at a time, reducing the likelihood of circular dependencies. this approach helps prevent situations where a process holds one resource while waiting for another resource held by another process.
	3. use a deadlock detection and recovery algorithm: implement a deadlock detection algorithm that periodically checks for the existence of deadlocks within the system. if a deadlock is detected, the algorithm can initiate recovery mechanisms such as process termination or resource preemption to resolve the deadlock and release the involved resources.
	4. employ resource scheduling and allocation protocols: utilize scheduling and allocation protocols that aim to prevent or minimize the occurrence of deadlocks
20. What is a binary semaphore, and what is the effect of its P method, when called by multiple concurrent processes/threads?
- solution:
	- a binary semaphore is a synchronization primitive that can have two states: 0 (locked) and 1 (unlocked). it is often used to control access to a shared resource or coordinate the execution of concurrent processes or threads.
	- the P method of a binary semaphore decrements its value by 1 and, if the value becomes negative, blocks the calling process or thread until the semaphore becomes unlocked (i.e. its value becomes 1). if the semaphore is already unlocked, the P method simply decrements the value to 0 and continues executing.


## 2023 reexam
1. Give a regular expression that matches any even-length sequence of lower-case words separated by spaces, if for each word its length and its position in the sequence are either both odd or both even. Ex: the 5th word has to be of odd length and the 16th has to be of even length.
	- 
2. When would you load into memory the pages of a process that is just starting?
	- 
3. Considering that the size of a block is B and the size of an address isA, how many data blocks are addressed by the double indirect addressing of an i-node?
	- 
4. What state transition will a process undergo when it calls sem_wait and under what conditions? Justify your answer.
	- 
5. Give an example of distinct values greater than 0 for T, N1, N2 and N3 for which the program below finishes execution.
```c
pthread_barrier_t b1, b2;

void* f1(void* a)
{
	pthread_barrier_wait(&b1);
	return NULL;
}

void* f2(void* a)
{
	pthread_barrier_wait(&b2);
	return NULL;
}

int main()
{
	int i;
	pthread_t t[T][2];

	pthread_barrier_init(&b1, NULL, N1);
	pthread_barrier_init(&b2, NULL, N2);
	for (i = 0; i < T; i++)
	{
		pthread_create(&t[i][0], NULL, f1, NULL);
		pthread_create(&t[i][1], NULL, f2, NULL);
	}	
	for (i = 0; i < T; i++)
	{
		pthread_join(t[i][0], NULL);
		pthread_join(t[i][1], NULL);
	}
	pthread_barrier_destroy(&b1);
	pthread_barrier_destroy(&b2);
	return NULL;
}
```
6. What could happen if function f were executed by several simultaneous threads? Why?
```c
pthread_mutex_t m[2];
void* f(void* p)
{
	int id = (int) p;
	pthread_mutex_t* first = &m[id % 2];
	pthread_mutex_t* second = &m[(id + 1) % 2];

	pthread_mutex_lock(first);
	pthread_mutex_lock(second);
	...
	pthread_mutex_unlock(second);
	pthread_mutex_unlock(first);
}
```
7. What can you do as a software developer to prevent deadlocks?
	- 
8. What will be the effect of replacing calls to pthread_mutex_lock with calls to sem_post?
	- 
9. Give three function calls that ensure mutual exclusion.
	- 
10. What is a "critical section"?
	- 
11. When would you use execv instead of execl?
	- 
12. How many FIFOs can a process open for reading if the FIFOs are and will ever be used by other processes only for writing?
	- 
13. Explain why the file descriptor returned by popen must be closed with pclose instead of fclose.
	- 
14. What will the fragment below print? Justify your answer.
```c
execl("expr", "expr", "1", "+", "1", NULL);
execlp("echo", "echo", "3", NULL);
printf("4\n");
```
15. Give three ways of finding the size of a file on the linux command line.
	- 
16. Draw the hierarchy of processes created by the code below, including the parent process.
```c
for (i = 0; i < 3; i++)
{
	if (fork() > 0)
	{
		wait(0);
		wait(0);
		exit(0);
	}
}
```
17. Write two SED commands that display a file's lines deleting the first non-empty sequence of lower-case letters.
	- 
18. Write an AWK command that displays the sum of all the numbers in a text file whose lines consist of sequences of digits separated by spaces.
	- 
19. Give three GREP commands that display the lines of a file which consist exclusively of a non-empty sequence of alternating leters and digits (ex: a0g or 1r5m)
	- 
## 2018-2019 / 2
1.  Write a UNIX Shell command that displays all the lines in a file a.txt that contain at least one natural number divisible by 5
	- 
2. Write a UNIX Shell command that displays all lines from a.txt that contain words made of an odd number of lower-case letters
	- 
3. File a.txt contains lines of numbers separated by space. Write a UNIX Shell command that applied to a.txt displays for each line the sum of the first and last number on the line
	- 
4. Display the number of files in a directory and all its hierarchy of subdirectories
	- 
5. Write a UNIX shell script that sets permissions 600 to all C source files (extension .c) in the current directory for which the user has writing permissions
	- 
6. Draw the process hierarchy created by calling f(3)
```c
void f(int n){
	if (n > 0 && fork() == 0){
		if (n % 2 == 0)
			fork();
		f(n-1);
		exit(0);
	}
	wait(0); wait(0);
}
```
7. How many processes are created by the code fragment below, excluding the initial parent process?
```c
for (i = 0; i < 8; i++)
	if (i % 2 != 1)
		fork();
```
8. What will the code fragment below print to the console?
```c
char *s[3] = {"X", "Y", "Z"};
for (i = 0; i < 3; i++)
	execl("/bin/echo", "/bin/echo", s[i], NULL);
```
9. What does the system call "read" do when the FIFO contains less data then it is required to read, but it is not empty?
	- 
10. What will the code fragment below print to the console, if no other process opens the "abc" FIFO? Justify your answer.
```c
int r, w, n = 0;
r = open("abc", O_RDONLY);
n--;
w = open("abc", O_WRONLY);
n--;
printf("%d\n", n);
```
11. What happens with a process between the moment it finishes and the moment its parent calls wait?
	- uses up a pid for no reason
12. Schedule the following jobs (given as name/duration/deadline) so that the sum of their delays is minimized: A/3/8, B/10/15, C/3/5
	- 
13. What page category has the highest priority in the NRU replacement policy, when choosing a victim page?
	- 
14. Give one advantage and one disadvantage of the paged allocation method over the variable partitions allocation method
	- 
15. When would you load into memory the pages of a program that is being started?
	- 
16. Given two set-associative caches, one with 2 sets of 4 pages and one with 4 sets of two pages, which would perform better for the following sequence of page requests: 17, 2, 37, 6, 9. Why?
	- 
17. When does a process change state from RUN to READY?
	- 
18. Consider the producer-consumer problem with a buffer of capacity N. How many semaphores would you use to ensure operation correctness and what would be the semaphores' initial values?
	- 
19. Give a method for preventing the apparition of deadlocks, in a situation when you cannot avoid modifying resources concurrently
	- 
20. Under what conditions can UNIX processes communicate via PIPE
	- 

## 2017 - 2018/2 - Test A
1. Write a UNIX Shell command that displays the lines in a file a.txt that contains words starting with capital letters
	- 
2. Write a UNIX Shell command that inverts in file a.txt all pairs of neighbouring digits (ex a3972b->a9327b)
	- 
3. File a.txt contains on each line two numbers separated by space. Write a UNIX Shell command that displays for each line the sum of its numbers
	- 
4. Display only the lines of file a.txt that appear only once (not duplicated)
	- 
5. Write a UNIX Shell script that displays the name of each .txt file in the current directory that contains the word "cat"
	- 
6. in the program fragment below, mark which process executes each line (the parent, the child of both)
```c
P C
x x k = fork();
x x	if (k == 0)
  x		printf("A\n");
x	else
x		printf("B\n");
x x	printf("C\n");
```
7. How many proesses will be created by the code fragment below, excluding the initial parent process? `fork(); wait(0); fork(); wait(0); fork();`
	- 
8. What are the possible console outputs of the following code fragment (ignoring any output that execl might generate) and when will they happen?: `printf("A\n"); exdecl(...); printf("B/n");`
	- 
9. What does the system call "read" do when the pipe is empty?
	- 
10. What does the system call "open" do before returning from opening a FIFO?
	- 
11. Give a reason for choosing threads over processes
	- 
12. Considering that functions "fa" and "fb" are run in concurrent threads, what will the value of "n" be after the threads are finished? Why?
```c
pthread_mutex_t a, b;
int n = 0;
void* fa(void* p){
	pthread_mutex_lock(&a);
	n++;
	pthread_mutex_unlock(&a);
}
void* fb(void* p){
	pthread_mutex_lock(&b);
	n++;
	pthread_mutex_unlock(&b);
}
```
13. Schedule the following jobs (given as Name/Duration/Deadline) s.t. they all meet their deadlines: A/5/9, B/7/13, C/1/10
	- 
14. Give one advantage and one disadvantage of the segmented allocation method over the paged allocation method
	- 
15. When would you load into memory the pages of a program that is being started?
16. When does a process change state from RUN to READY?
	- 
17. Given a UNIX file system configured with a block size of B bytes that can contain A addresses, and i-noes having S direct links, one simple indirection link, one double indirection link, and one triple indirection link, give the formula for the maximum file size possible
	- 
18. What happens with the data when you delete a file that has a hard link pointing to it?
19. Give a method for preventing deadlocks
	- 
20. What is a binary semaphore, and what is the effect of its P method, when called by multiple concurrent processes/threads?
	- 
