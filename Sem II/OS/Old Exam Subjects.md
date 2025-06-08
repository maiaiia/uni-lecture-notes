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


