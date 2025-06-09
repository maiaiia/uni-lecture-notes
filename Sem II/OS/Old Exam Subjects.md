# Old Exam Subjects
___
Class: [[OS]]
Type: Exam Session Prep
___
## 27.06.2024

>[!Question] Give three regular expressions that match any line that contains a least two vowels but no digits.
> 
>1. `cat randomText.txt | grep -E -i "(.)*([aeiou])+(.)*([aeiou])+" | grep -E "([0987654321])" -v`
>2. 

>[!Question] Give a GREP command that display all the lines in a file that contain an even number of vowels (among other potential characters).
> `grep -Ei "^([^aeiou])*([aeiou]([^aeiou])*[aeiou]([^aeiou])*)+$" randomText.txt`

>[!Question]- Write a SED command that display from a file only the lines that contain exclusively a valid artihmetical expression of integer additions and subtractions.

>[!Question]- Write an AWK command that displays the sum of the fields on the position equal to the current line number.

>[!Question]- Give two solutions for hiding a commands standard and error outputs by redirecting them to /dev/null.
> 
>2. `>/dev/null 2>/dev/null`
>3. `>/dev/null 2>&1` 

>[!Question]- Write a UNIX Shell script that asks the user for a directory name and insists until it gets a directory that does not exist already.

>[!Question]- Draw the hierarchy of processes created by the code below, including the parent process.
>>[!code]
>>```c
>>for(i=0; i<2; i++) {
>>	fork();
>>	execl("/etc", "/etc", NULL);
>>}
>>```
>

>[!Question]- Add the necessary lines of C code so that the instruction below overwrites the content of a file b.txt. Do not change the instruction: `execlp("sort", "sort", "a.txt", NULL);`
>

>[!Question]- Why is it not advisable to communicate bidirectionally through a single pipe?

>[!Question]- What will display the sequence of commands below, considering the f is created successfully?
>>[!code]
>>```
>>mkfifo f
>>echo asdf > f
>>cat f
>>```
>

>[!Question]- When would you prefer using a process instead of a thread?

>[!Question]- EN: What is a "critical resource"?

>[!Question]- EN: Why does the pthread_cond_wait call get also a mutex as argument?

>[!Question]- EN: What will be the effect of replacing calls to pthread_mutex_lock with calls to pthread_rwlock_wrlock?

>[!Question]- EN: What is the effect of calling sem_wait on a semaphore with value zero?

>[!Question]- EN: How can you decrement the value of a POSIX semaphore?

>[!Question]- EN: What can you do as a software developer to prevent deadlocks? Justify your answer.

>[!Question]- EN: What state transition will a process undergo when writing to a file?

>[!Question]- EN: What is the content of the superblock on a Linux disk?

>[!Question]- EN: Considering that a block can contain N addresses towards other blocks, how many data blocks are addressed by an i-node's double and triple indirections together?

## 29.06.2023

>[!Question]- scrieti un grep care ia grupurile de cate 2 cuvinte, separate de un singur spatiu, care sunt formate doar din litere mici si fiecare cuvant contine cel putin 2 vocale

>[!Question]- scrieti 2 grep uri care iau liniile care nu au numarul de caractere multiplu al lui 3

>[!Question]- scrieti un sed care inlocuieste prima aparitie a caracterului A cu caracterul B

>[!Question]- scrieti un awk care afiseaza liniile care au primul cuvant identic cu ultimul cuvant si al caror penultim cuvant are numar par de caractere

>[!Question]- scrieti 3 moduri de a crea un fisier gol

>[!Question]- scrieti 5 moduri de a verifica daca un string este gol(cu test)

>[!Question]- afisati ierarhia proceselor a urmatorului cod:
>>[!Code]
>>```c
>>for(int i = 0; i < 3; i++)
>>    if (fork() != 0)
>>        wait();
>>```

>[!Question]-  scrieti ce afiseaza codul:
execlp(“expr”,”expr”,”a”,”+”,”1”);mut
printf(“xyz\n”);

>[!Question]- schitati o implementare a functiilor popen si pclose

>[!Question]- cate FIFO pot fi deschise de catre un fisier daca fiecare dintre acele FIFO-uri va avea capatul celalalt deschis de catre un alt proces?

>[!Question]- cand am dori sa folosim execl si cand am dori sa folosim execv?

>[!Question]- definiti notiunea de sectiune critica

>[!Question]- care sunt consecintele inlocuirii lui pthread_mutex_lock cu sem_post in cod?

>[!Question]- definiti un semafor binar si explicati cum functioneaza

>[!Question]- scrieti un mod de a preveni deadlock

>[!Question]- prin ce stare(gen ready, wait, swap, etc) trece un proces cand apelam pthread_join?

>[!Question]- daca avem B drept block size si A drept address size, cate adrese o sa aiba un double indirect dintr-un i-node?

>[!Question]- ce se intampla cu continutul directorului in care montam o partitie?

## ??.??.2023

>[!Question]- Give a regular expression that matches any odd number of words, each word having an odd number of letters.

>[!Question]- EN: Give four commands that display the number of empty lines in a file.

>[!Question]-  EN: Write a SED command that displays a file's lines deleting the first, the third, the fifth, the seventh, etc space on those lines

>[!Question]-  EN: Write an AWK command that displays the product of the last field of lines on odd positions having an odd number of fields.

>[!Question]- EN: Give four ways of redirecting the standard output of a process.

>[!Question]- EN: Write three UNIX Shell conditions that check the existence of a file.

>[!Question]-  EN: Draw the hierarchy of processes created by the code below, including the parent process.
>>[!code]
>>```c
>>    for(i=0; i<3; i++) {
>>        if(execlp("ls", "ls", "/", NULL) != -1) {
>>            fork();
>>        }
>>    }
>>```
>

>[!Question]- EN: Add the necessary code so that the instruction below does not get stuck waiting for standard input: `execlp("cat", NULL);`

>[!Question]-  EN: Sketch an implementation of the popen and pclose functions, only for the case when the command output should be read in the C code.

>[!Question]- EN: How many FIFOs can a process open for reading if the FIFOs are and will ever be used by other processes only for reading?

>[!Question]- EN: When would you prefer using a FIFO instead of a pipe?

>[!Question]- EN: What is a "critical section"?

>[!Question]- EN: When would you prefer using a mutex instead of a rwlock?

>[!Question]-  EN: What will be the effect of replacing calls to pthread_mutex_lock with calls to sem_wait?

>[!Question]-  EN: What does pthread_cond_wait do with the mutex it gets as argument?

>[!Question]- EN: Sketch a solution for the producer-consumer problem.

>[!Question]- EN: What can you do as a software developer to prevent deadlocks?

>[!Question]- EN: What state transition will a process undergo when it calls pthread_cond_wait? Justify your answer.

>[!Question]- EN: What is the content of file of type directory in the Linux file system?

>[!Question]-  EN: Explain the difference between a symbolic link and a hard link.


## 2017-2018
1. Write a UNIX Shell command that displays the lines in a file a.txt that contains words starting with capital letters
2. Write a UNIX Shell command that inverts in file a.txt all pairs of neighboring digits (ex: a3972b -> a9327b)
3. File a.txt contains on each line two numbers separated by space. Write a UNIX Shell command that displays for each line the sum of its numbers
4. Display only the lines of file a.txt that appear only once (not duplicated).
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
7. How many processes will be created by the code fragment below, excluding the initial parent process?
	`fork(); wait(0); fork(); wait(0); fork();`
8. What are the possible console outputs of the following code fragment (ignoring any output that execl might generate), and when will they happen?
	`printf("A\n"); execl(.....); printf("B\n");`
9. What does the system call "read" do when the pipe is empty?
10. What does the system call "open" do before returning from opening a FIFO?
11. Give a reason for choosing threads over processes
(not my answer)
	1. efficiency: threads are generally more lightweight than processes. creating a thread requires fewer system resources compared to creating a new process. threads share the same memory space, file descriptors, and other resources of the process that created them, resulting in lower overhead and faster communication between threads. this makes threads a more efficient option when multiple tasks need to be performed concurrently within a single program.
	2. shared memory: threads within a process can directly access and modify shared memory. this allows for efficient communication and data sharing between threads without the need for complex interprocess communication mechanism, such as pipes or sockets. Sharing data between threads can be simpler and faster compared to sharing data between separate processes.
	3. synchronization: threads can easily synchronize their execution using mechanisms like locks, semaphores, and conditional variables. Synchronization primitives enable threads to coordinate their activities, share resources safely, and avoid race conditions when accessing shared data. Inter-thread communication and coordination are generally simpler to implement and understand than inter-process communication.
12. Considering that functions "fa" and "fb" are run in concurrent threads, what will the value of "n" be after the threads are finished? why?
13. Schedule the following jobs (given ads Name/Duration/Deadline) so that they all meet their deadlines: A/5/9, B/7/13, C/1/10
14. Give one advantage and one disadvantage of the segmented allocation method over the paged allocation method
	- advantage: flexibility in memory allocation
		- segmented allocation allows for more flexible memory allocation compared to paged allocation. In segmented allocation, memory is divided into variable-sized segments, where each segment can represent a logical unit or a specific module of the program. This flexibility is beneficial when dealing with programs that have varying memory requirements for different modules or data structures. Segmented allocation can efficiently allocate memory for modules of different sizes without the fixed-size restrictions imposed by the paged allocation method.
	- disadvantage: external fragmentation
		- one significant disadvantage of the segmented allocation method is the potential for external fragmentation. external fragmentation occurs when free memory blocks are scattered throughout the memory space, resulting in the inability to allocate contiguous memory blocks for larger segments or modules. over time, as segments are allocated and deallocated, small gaps of unused memory may form between allocated segments, even when the total amount of free memory is sufficient. Dealing with external fragmentation requires additional memory management techniques, such as compaction or dynamic relocation, to reclaim fragmented memory blocks and provide larger contiguous memory spaces. paged allocation, on the other hand, can mitigate external fragmentation by dividing memory into fixed-size pages, allowing for more efficient memory allocation and utilization.
15. When would you load into memory the pages of a program that is being started?
	- demand paging is a technique where pages of a program are loaded into memory only when they are actually accessed or needed during the program's execution. when the program is first started, the operating system loads the initial set of pages that are required for program execution, such as the program's entry point and any necessary libraries or shared code.
16. When does a process change state from RUN to READY?
	- a process changes states from RUN to READY when it is no longer executing on the CPU and is temporarily suspended, waiting for the CPU to be allocated to it again.
17. Given a UNIX file system configured with a block size of B bytes that can contain A addresses, and i-nodes having S direct link, one simple indirection link, one double indirection link, and one triple indirection link, give the formula for the maximum file size possible.
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

## 2021-2022
1. How many threads would you use for processing a million files? Justify your choice.
	- i would use a number of threads equal to the number of cores on the processor so there is a balance between having too many threads that don't actualyy get the processor to run their code and to few threads that the code becomes almost as if we were to write it iteratively.
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
3. Why I/O operations cause a process to move from the state RUN to the state WAIT?
	- Because I/O operations take a long time. if the process were to remain in a RUN state, it would keep the processor "busy" for no reason. instead, by having it move to the "wait" state, other processes can utilise it
4. How is the address calculation done in the absolute fixed partition allocation?
5. Give an advantage and a disadvantage of the First-Fit placement policy versus the Worst-Fit
6. What is the most prioritary memory page that the NRU replacement policy chooses as victim page?
7. Considering that the size of a block is B and the size of an address is A, how many data blocks are addressed by the triple indirect addressing of an i-node?
8. Write a regular expression that accepts lines that contain the letter "a" but do not contain the letter "b"
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
10. Processes A, B and C communicate through FIFOs X, Y and Z according to the diagram below. Sketch the code fragments that open the FIFOs in the 3 processes.
```
A --X--> B
B --Y--> C
C --Z--> A
```
11. Why can a hard-link only be created toward files on the same partition and not toward files on other partitions? 
## 2023
1. Give three regular expressions that match any non-negative number that is a multiple of 5
2. Give 5 GREP commands that display all the lines in a file that contain the letter "a" (either uppercase of lower case)
3. Write two SED commands that display from a file only the lines that do not contain the digit '7'
4. Write an AWK command that displays the sum of the next to last field of all lines
5. How can one redirect in the command line the standard error through pipe to another program?
6. Write a UNIX Shell script that displays all command line arguments without using FOR
7. Draw the hierarchy of processes created by the code below, including the parent process: 
```c
for (i = 0; i < 3; i++){
	fork();
	execlp("ls", "ls", "/", NULL);
}
```
8. Add the necessary code so that file b.txt is overwritten with the content of file a.txt from the instruction `execlp("cat", "cat", "a.txt", NULL);`
9. Why is it not advisable to communicate bidirectionally though a single FIFO?
10. How many FIFOs can a process open if they are not and will not ever be used by any other process?
11. When would you prefer using a process instead of a thread?
12. What is a "critical section"?
13. Why should the thread recheck the condition after returning from the pthread_cond_wait call?
14. What will be the effect of replacing calls to pthread_mutex_lock with calls to pthread_rwlock_rdlock
15. What is the effect of calling pthread_barrier_wait on a barrier initialized with 1?
16. How can you increment the value of a POSIX semaphore?
17. What can you do as a software developer to prevent deadlocks?
18. What state transition will a process undergo when reading from a file?
	- the process will go to a wait state until the content required is loaded into memory from the disk
19. What is the content of the superblock on a Linux disk?
20. Can you create a hard link towards a file on a different partition? Justify your answer.

## 2023 reexam
1. Give a regular expression that matches any even-length sequence of lower-case words separated by spaces, if for each word its length and its position in the sequence are either both odd or both even. Ex: the 5th word has to be of odd length and the 16th has to be of even length.
2. When would you load into memory the pages of a process that is just starting?
3. Considering that the size of a block is B and the size of an address isA, how many data blocks are addressed by the double indirect addressing of an i-node?
4. What state transition will a process undergo when it calls sem_wait and under what conditions? Justify your answer.
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
8. What will be the effect of replacing calls to pthread_mutex_lock with calls to sem_post?
9. Give three function calls that ensure mutual exclusion.
10. What is a "critical section"?
11. When would you use execv instead of execl?
12. How many FIFOs can a process open for reading if the FIFOs are and will ever be used by other processes only for writing?
13. Explain why the file descriptor returned by popen must be closed with pclose instead of fclose.
14. What will the fragment below print? Justify your answer.
```c
execl("expr", "expr", "1", "+", "1", NULL);
execlp("echo", "echo", "3", NULL);
printf("4\n");
```
15. Give three ways of finding the size of a file on the linux command line.
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
18. Write an AWK command that displays the sum of all the numbers in a text file whose lines consist of sequences of digits separated by spaces.
19. Give three GREP commands that display the lines of a file which consist exclusively of a non-empty sequence of alternating leters and digits (ex: a0g or 1r5m)
## 2018-2019 / 2
1.  Write a UNIX Shell command that displays all the lines in a file a.txt that contain at least one natural number divisible by 5
2. Write a UNIX Shell command that displays all lines from a.txt that contain words made of an odd number of lower-case letters
3. File a.txt contains lines of numbers separated by space. Write a UNIX Shell command that applied to a.txt displays for each line the sum of the first and last number on the line
4. Display the number of files in a directory and all its hierarchy of subdirectories
5. Write a UNIX shell script that sets permissions 600 to all C source files (extension .c) in the current directory for which the user has writing permissions
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
13. What page category has the highest priority in the NRU replacement policy, when choosing a victim page?
14. Give one advantage and one disadvantage of the paged allocation method over the variable partitions allocation method
15. When would you load into memory the pages of a program that is being started?
16. Given two set-associative caches, one with 2 sets of 4 pages and one with 4 sets of two pages, which would perform better for the following sequence of page requests: 17, 2, 37, 6, 9. Why?
17. When does a process change state from RUN to READY?
18. Consider the producer-consumer problem with a buffer of capacity N. How many semaphores would you use to ensure operation correctness and what would be the semaphores' initial values?
19. Give a method for preventing the apparition of deadlocks, in a situation when you cannot avoid modifying resources concurrently
20. Under what conditions can UNIX processes communicate via PIPE

## 2017 - 2018/2 - Test A
1. Write a UNIX Shell command that displays the lines in a file a.txt that contains words starting with capital letters
2. Write a UNIX Shell command that inverts in file a.txt all pairs of neighbouring digits (ex a3972b->a9327b)
3. File a.txt contains on each line two numbers separated by space. Write a UNIX Shell command that displays for each line the sum of its numbers
4. Display only the lines of file a.txt that appear only once (not duplicated)
5. Write a UNIX Shell script that displays the name of each .txt file in the current directory that contains the word "cat"
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
8. What are the possible console outputs of the following code fragment (ignoring any output that execl might generate) and when will they happen?: `printf("A\n"); exdecl(...); printf("B/n");`
9. What does the system call "read" do when the pipe is empty?
10. What does the system call "open" do before returning from opening a FIFO?
11. Give a reason for choosing threads over processes
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
14. Give one advantage and one disadvantage of the segmented allocation method over the paged allocation method
15. When would you load into memory the pages of a program that is being started?
16. When does a process change state from RUN to READY?
17. Given a UNIX file system configured with a block size of B bytes that can contain A addresses, and i-noes having S direct links, one simple indirection link, one double indirection link, and one triple indirection link, give the formula for the maximum file size possible
18. What happens with the data when you delete a file that has a hard link pointing to it?
19. Give a method for preventing deadlocks
20. What is a binary semaphore, and what is the effect of its P method, when called by multiple concurrent processes/threads?
## 2018-2019/2 - Test D
1. Write a UNIX Shell command that displays all the lines in a file a.txt that contain at least one number with more than 2 decimal digits
2. Write a UNIX Shell command that eliminates all non-letter characters from file a.txt 
3. Write an AWK program that applied to a file containing words separated by spaces, calculates the average word count per line
4. Display all the unique file names (without the path) in a given directory and all its hierarchy of subdirectories
5. Write a UNIX shell script that calculates the average number of lines in the files with the .txt extension in the current directory
6. How many processes will be created by the code fragment below, excluding the parent process? 
```c
for(i=0;i<6;i++)
	if(i%3 != 1)
		fork();
```
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
8. What will the code fragment below print to the console?
```c
char *s[3] = {"X", "Y", "Z"};
for (i = 0; i < 3; i++)
	execl("/bin/echo", "/bin/echo", s[i], NULL);
```
9. What does the system call "read" do when the FIFO contains less data then it is required to read, but it is not empty?
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
12. impossible to read
13. scheduling thing
14. Consider the producer consumer problem with a buffer of capacity N. How many semaphores would you use to ensure operation correctness and what would the semaphores' initial values be?
15. Add the necessary instructions to the code fragment below, so that the stdin of command /bin/pwd is read from PIPE p
```c
int p[2];

pipe(p);

if(fork()==0){
	
	execl("/bin/pwd", "/bin/pwd", NULL);
	
	exit(0);	
	
}

```