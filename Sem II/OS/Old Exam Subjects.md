# Old Exam Subjects
___
Class: [[OS]]
Type: Exam Session Prep
___

```tabs
tab: 27.06.2024

- EN: Give three regular expressions that match any line that contains a least two vowels but no digits.

Answer:

- EN: Give a GREP command that display all the lines in a file that contain an even number of vowels (among other potential characters).

Answer:

- EN: Write a SED command that display from a file only the lines that contain exclusively a valid artihmetical expression of integer additions and subtractions.

Answer:

- EN: Write an AWK command that displays the sum of the fields on the position equal to the current line number.

Answer:

- EN: Give two solutions for hiding a commands standard and error outputs by redirecting them to /dev/null.

Answer:

- EN: Write a UNIX Shell script that asks the user for a directory name and insists until it gets a directory that does not exist already.

Answer:

- EN: Draw the hierarchy of processes created by the code below, including the parent process.
>```c
>for(i=0; i<2; i++) {
>>fork();
>>execl("/etc", "/etc", NULL);
>```

Answer:

- EN: Add the necessary lines of C code so that the instruction below overwrites the content of a file b.txt. Do not change the instruction.

    execlp("sort", "sort", "a.txt", NULL);

Answer:

- EN: Why is it not advisable to communicate bidirectionally through a single pipe?

Answer:

- EN: What will display the sequence of commands below, considering the f is created successfully?

mkfifo f
echo asdf > f
cat f

Answer:

- EN: When would you prefer using a process instead of a thread?

Answer:

- EN: What is a "critical resource"?

Answer:

- EN: Why does the pthread_cond_wait call get also a mutex as argument?

Answer:

- EN: What will be the effect of replacing calls to pthread_mutex_lock with calls to pthread_rwlock_wrlock?

Answer:

- EN: What is the effect of calling sem_wait on a semaphore with value zero?

Answer:

- EN: How can you decrement the value of a POSIX semaphore?

Answer:

- EN: What can you do as a software developer to prevent deadlocks? Justify your answer.

Answer:

- EN: What state transition will a process undergo when writing to a file?

Answer:

- EN: What is the content of the superblock on a Linux disk?

Answer:

- EN: Considering that a block can contain N addresses towards other blocks, how many data blocks are addressed by an i-node's double and triple indirections together?

Answer:

tab: 29.06.2023
1. scrieti un grep care ia grupurile de cate 2 cuvinte, separate de un singur spatiu, care sunt formate doar din litere mici si fiecare cuvant contine cel putin 2 vocale

2. scrieti 2 grep uri care iau liniile care nu au numarul de caractere multiplu al lui 3

3. scrieti un sed care inlocuieste prima aparitie a caracterului A cu caracterul B

4. scrieti un awk care afiseaza liniile care au primul cuvant identic cu ultimul cuvant si al caror penultim cuvant are numar par de caractere

5. scrieti 3 moduri de a crea un fisier gol

6. scrieti 5 moduri de a verifica daca un string este gol(cu test)

7. afisati ierarhia proceselor a urmatorului cod:
>```c
>for(int i = 0; i < 3; i++)
>    if (fork() != 0)
>        wait();
>```

8. scrieti ce afiseaza codul:
execlp(“expr”,”expr”,”a”,”+”,”1”);mut
printf(“xyz\n”);

9. schitati o implementare a functiilor popen si pclose

10. cate FIFO pot fi deschise de catre un fisier daca fiecare dintre acele FIFO-uri va avea capatul celalalt deschis de catre un alt proces?

11. cand am dori sa folosim execl si cand am dori sa folosim execv?

12. definiti notiunea de sectiune critica

13. care sunt consecintele inlocuirii lui pthread_mutex_lock cu sem_post in cod?

14. definiti un semafor binar si explicati cum functioneaza

15. scrieti un mod de a preveni deadlock

16. prin ce stare(gen ready, wait, swap, etc) trece un proces cand apelam pthread_join?

17. daca avem B drept block size si A drept address size, cate adrese o sa aiba un double indirect dintr-un i-node?

18. ce se intampla cu continutul directorului in care montam o partitie?

tab: ??.??.2023
1. Give a regular expression that matches any odd number of words, each word having an odd number of letters.

2. EN: Give four commands that display the number of empty lines in a file.

3. EN: Write a SED command that displays a file's lines deleting the first, the third, the fifth, the seventh, etc space on those lines

4. EN: Write an AWK command that displays the product of the last field of lines on odd positions having an odd number of fields.
5. EN: Give four ways of redirecting the standard output of a process.
6. EN: Write three UNIX Shell conditions that check the existence of a file.
7. EN: Draw the hierarchy of processes created by the code below, including the parent process.
>```c
>    for(i=0; i<3; i++) {
>        if(execlp("ls", "ls", "/", NULL) != -1) {
>            fork();
>        }
>    }
>```

8. EN: Add the necessary code so that the instruction below does not get stuck waiting for standard input: `execlp("cat", NULL);`

9. EN: Sketch an implementation of the popen and pclose functions, only for the case when the command output should be read in the C code.
10. EN: How many FIFOs can a process open for reading if the FIFOs are and will ever be used by other processes only for reading?
11. EN: When would you prefer using a FIFO instead of a pipe?
12. EN: What is a "critical section"?
13. EN: When would you prefer using a mutex instead of a rwlock?
14. EN: What will be the effect of replacing calls to pthread_mutex_lock with calls to sem_wait?

15. EN: What does pthread_cond_wait do with the mutex it gets as argument?

16. EN: Sketch a solution for the producer-consumer problem.

17. EN: What can you do as a software developer to prevent deadlocks?

18. EN: What state transition will a process undergo when it calls pthread_cond_wait? Justify your answer.

19. EN: What is the content of file of type directory in the Linux file system?

20. EN: Explain the difference between a symbolic link and a hard link.

```
