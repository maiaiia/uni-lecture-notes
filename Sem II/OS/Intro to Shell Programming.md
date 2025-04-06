# Intro to Shell Programming
___
Class: [[OS]]
Type: Lecture
Tags: # 
Date: March 6th, 2025
___
## Prerequisites
A commonly used trick in shell programming is taking advantage of 'lazy evaluation' (if the truth value of an expression is obvious before it's evaluated in its entirety, the evaluation will stop)
- Example: `test -f file.txt || echo not there` (if the file 'file.txt' exists, echo not there will not be evaluated, so not there will not be printed to the console)

Variables can also be used
- assign them as such: A=6
- access them as such: $A (or ${A})

The result of a command can be stored in a variable using back quotes: N = \`who | wc -l\`
A command can be stored in a variable using double quotes: N = "who | wc -l"

for test in the form of `[[]]`, =~ means 'is in the form of the regex'
example for checking if the first argument is a word:
`if [[ "$1" =~ ^[a-z]+$ ]]`

' - does not allow substitutions
" - does
## Shell Scripts 
A shell script is a file containing commands.
Any file can be run, but it must have execution permissions 
Every shell script must start with a specification of the interpreter: `#!/bin/bash`

>[!warning] when using '\[]' as an alias for `test`, remember to *add spaces* before and after the brackets

>[!warning] when using `while true`, remember to add `sleep 1` at the end of the loop

adding '$' after a command means that command will be run in the background

commands can be separated by ';' or simply written on different lines

>[!warning] **Double quotes** allow the evaluation of both content in between back quotes and $ variables, whereas simple quotes don't
### Quotes are Confusing

| Feature                  | `"` Double Quotes | `'` Simple Quotes | Backticks |
| ------------------------ | ----------------- | ----------------- | --------- |
| **Variable Expansion**   | Yes               | No                | No        |
| **Command Substitution** | `$(...)` works    | No                | Yes       |
| **Escape Sequences**     | Yes               | No                | No        |
>[!tip]
>Backticks are outdated. When working with BASH, `$(...)` is preferred. However, `$(...)` does not work with all shells

### Misc
>[!tip]
>add a -x after `#!/bin/bash` to (debug?). a step by step explanation of what's going on in the code
- $(command) - this captures the output of `command`
- for iterating through files: `for f in `find` ` (or `for f in $(find)`)
## Practice problems
### Boian
>[!Question]- 1. Display a report showing the full name of all the users currently connected, and the number of processes belonging to each of them.
>```bash
>#!/bin/bash
>for line in `cat who.fake | awk '{print $1}'`; do
    echo $line `cat ps.fake | awk '{print $1}' | grep "$line" -c`
>done
>```

>[!Question]- 2. Find recursively in a directory all ".c" files having more than 500 lines. Stop after finding 2 such files.
>My first attempt (didn't know find existed :)) - couldn't stop after finding 2 files
>```bash
>#!/bin/bash
>
>if [ $# != 1 ]; then
>       echo The number of arguments must be 1.
>       exit 1 
>fi 
>if ! [ -d $1 ]; then
        echo $1 is not a directory.
        exit 1 
fi
>
>path="$1"/*
>for item in $path; do
        if [ -f "$item" ] && [[ "$item" == *.c ]]; then
>              #echo "$item is a C file"
>             line_count=`wc -l "$item" | awk '{print $1}'`
>             #echo The number of lines is $line_count
                if [[ $line_count -gt 500 ]]; then
                        echo "$item" 
                fi
        elif [ -d "$item" ]; then
                $0 $item 
        fi      
done
>```
> This stops after finding 2 .c files that fit the criteria
> ```bash
>#!/bin/bash
>if [ $# != 1 ]; then
>        echo The number of arguments must be 1.
>        exit 1 
>fi 
>
>if ! [ -d $1 ]; then
>        echo $1 is not a directory.
>        exit 1 
>fi
>
>files_found=0
>
>files=`find "$1" -type f -name "*.c"`
>for file in $files; do
>       if [[ `wc -l "$file" | awk '{print $1}'` -gt 500 ]]; then
>               echo "$file"
>               ((files_found++))
>               if [[ $files_found -eq 2 ]]; then
>                       exit 0
>               fi
>       fi
>done
>```

>[!Question]- 3. Find recursively in a directory, all the files with the extension ".log" and sort their lines (replace the original file with the sorted content).
>```bash
>#!/bin/bash
>
>if ! [ $# == 1 ]; then
>       echo Number of arguments must be 1.
>       exit 1
>fi
>
>if ! [ -d $1 ]; then 
>       echo "$1" is not a directory.
>       exit 1
>fi
>
>logfiles=`find "$1"/*  -type f -name "*.log"`
>for file in $logfiles; do
>       touch copyfile
>       cat $file | sort > copyfile
>       mv copyfile "$file"
>       
>done
>```

>[!Question]- 4. Find recursively in a given directory all the symbolic links, and report those that point to files/directories that no longer exist. Use operator -L to test if a path is a symbolic link, and operator -e to test if it exists (will return false if the target to which the link points does not exist)
>```bash
>
>```

>[!Question]- 5. Write a script that receives dangerous program names as command line arguments. The script will monitor all the processes in the system, and whenever a program known to be dangerous is run, the script will kill it and display a message.
>```bash
>
>```

>[!Question]- 6. Find recursively in a directory, all the files that have write permissions for everyone. Display their names, and the permissions before and after removing the write permission for everybody. You will need to use chmod's symbolic permissions mode, instead of the octal mode we have used in class. The the chmod manual for details.
>```bash
>
>```

>[!Question]- 7. Consider a file containing a username on each line. Generate a comma-separated string with email addresses of the users that exist. The email address will be obtained by appending "@scs.ubbcluj.ro" at the end of each username. Make sure the generated string does NOT end in a comma.
>```bash
>
>```

>[!Question]- 8. Display all the mounted file systems who are either smaller than than 1GB or have less than 20% free space.
>```bash
>
>```

>[!Question]- 9. Write a script that finds in a given directory hierarchy, all duplicate files (content wise) and displays their paths 
>>[!hint]-
>>use checksums to detect whether two files are identical
>```tabs
>tab: Spoilers ahead!
>tab: Naive solution
>more inefficient - implementation is vulnerable (if filenames contain spaces)
>>[!Code]
>>```bash
>>#!/bin/bash>
>>
>>D=$1
>>
>>for F in `find $D -type f`; do
>>     for G in `find $D -type f`; do
>>              if [ "F" != "G" ]; then
>>                      if cmp -s $F $G; then
>>                              echo $F $G 
>>                      fi
>>              fi
>>      done
>>done
>>```
>tab: Slightly better
>Not vulnerable to white spaces in the filename
>>[!Code]
>>```bash
>>#!/bin/bash>
>>find $D -type f | while read F; do
>>      find $D -type f | while read G; do
>>              if test "$F" != "$G"; then
>>                      if cmp -s "$F" "$G"; then
>>                              echo "$F" "$G"
>>                      fi
>>              fi
>>      done
>>done
>>
>>```
>tab: No reading while piping
>>[!Code]
>>```bash
>>#!/bin/bash
>>
>>D=$1
>>N=0
>>
>>find $D -type f > files.txt
>>
>>while read F; do
>>      while read G; do
>>              if test "$F" != "$G" && cmp -s "$F" "$G"; then
>>                      N=`expr $N + 1`
>>                      echo "$F" "$G"
>>              fi
>>              if [ $N -eq 2 ]; then
>>                      break
>>              fi
>>      done < files.txt
>>done < files.txt
>>rm files.txt
>>```
>tab: Hashing
>>[!Code]
>>```bash
>>#!/bin/bash
>>
>>D=$1
>>N=0
>>
>>find $D -type f > files.txt
>>
>>while read F; do
>>      shasum $F
>>done < files.txt > checksums.txt
>>
>>while read C1 F1; do
>>      while read C2 F2; do 
>>              if [ "$C1" = "$C2" ]; then
>>                      echo "$F1" "$F2"
>>              fi
>>      done < checksums.txt
>>done < checksums.txt
>>
>>rm files.txt
>>```
>```

>[!Warning]
>When doing a while read in a pipe, a new shell is created, so changing certain values won't work

>[!Question]- 10. Display the session count and full names of all the users who logged into the system this month, sorting the output by the session count in descending order. Use the -s and/or -t options of command last to get this month's sessions, and the command date to generate the required timestamp in the expected format.
>```bash
>
>```
### Bota

>[!Question]- 1. Să se scrie un script bash care primeşte ca argument un număr natural N şi generează N fişiere de tip text, astfel:
>- numele fişierelor vor fi de forma: file_X.txt, unde X = {1, 2, ..., N}
>- fiecare fişier generat va conţine doar liniile de la X la X + 5 ale fişierului /etc/passwd.
>
>>[!hint]-
>>(comenzi: touch,sed)
>
>>[!solution]-
>>```bash
>>#!/bin/bash
>>
>>if ! [ $# -eq 1 ]; then
>>      echo Number of arguments must be 1 
>>      exit 1 
>>fi 
>>
>>if ! [ $1 -eq $1 ] 2>/dev/null; then
>>      echo $1 is not a number
>>      exit 1
>>fi
>>
>>I=1
>>while [ $I -le $1 ]; do
>>      touch file_$I.txt
>>      > file_$I.txt
>>      for J in $(seq ${I} $((I+4)) ); do
>>              sed -n "${J}p" passwd.fake >> file_$I.txt  
>>    done
>>      ((I++))
>>done
>>```
>

>[!Question]- 2. Să se scrie un script bash care afișează primele 3 linii și ultimele 3 linii ale fiecărui fișier de tip text din dintr-un director dat ca argument în linia de comandă. Dacă un fișier text are mai puțin de 6 linii, atunci conţinutul acestuia va fi afişat în întregime.
>>[!hint]-
>>(comenzi: find, file, grep, wc, head, tail)
>
>>[!solution]-
>>```bash
>>#!/bin/bash
>>
>>if ! [ $# -eq 1 ]; then
>>      echo Number of arguments must be 1
>>      exit 1 
>>fi 
>>
>>if ! [ -d $1 ]; then
>>      echo $1 is not a directory 
>>      exit 1 
>>fi
>>
>>for FILE in $(find ./$1); do
>>      if echo $FILE | grep -q -E ".txt$" ; then
>>              WORDCOUNT=$(wc -l < $FILE)
>>              if [[ $WORDCOUNT -lt 5 ]]; then
>>                      echo $FILE is a short file
>>                      cat $FILE
>>              else
>>                      echo $FILE is a long file
>>                      head -3 $FILE
>>                      tail -3 $FILE
>>              fi
>>      fi
>>done
>>```
>

>[!Question]- 3. Să se scrie un script bash care calculează numărul mediu de linii ale fișierelor de tip text dintr-un director dat ca argument.
>
>>[!hint]-
>>(comenzi: find, file, grep, wc)
>
>>[!solution]-
>>```bash
>>#!/bin/bash
>>
>>if ! [ $# -eq 1 ]; then
>>      echo "Numarul argumentelor trebuie sa fie 1"
>>      exit 1 
>>fi 
>>
>>if ! [ -d $1 ]; then
>>      echo $1 nu este un director
>>      exit 1 
>>fi 
>>
>>NRLINII=0
>>NRFISIERE=0
>>
>>for FILE in $(find ./$1); do
>>      if echo $FILE | grep -q -E ".txt$"; then
>>              ((NRFISIERE++))
>>              CURENT=$(wc -l<$FILE)
>>              ((NRLINII+=CURENT))
>>      fi
>>done
>>
>>echo $NRFISIERE $NRLINII $((NRLINII/NRFISIERE))
>>```
>

>[!Question]- 4. Să se scrie un script bash care afișează numele fișierelor dintr-un director dat ca argument care conțin numere cu peste 5 cifre.
>
>>[!hint]-
>>(comenzi: find, grep, sed)
>
>>[!solution]-
>>```bash
>>#!/bin/bash
>>
>>if ! [ $# -eq 1 ]; then
>>      echo "Number of arguments must be 1"
>>      exit 1 
>>fi 
>>
>>if ! [ -d $1 ]; then
>>      echo $1 is not a directory
>>      exit 1 
>>fi 
>>
>>
>>for FILE in $(find ./$1); do
>>      if [ -f $FILE ]; then
>>              FILENAME=$(echo $FILE | sed -E "s/(^.+\/)//")   
>>              if echo $FILENAME | grep -E -q "[0-9]{5,}"; then
>>                      echo $FILENAME
>>              fi 
>>      fi
>>done
>>```
>

>[!Question]- 5. Să se scrie un script bash care pentru fiecare argument din linia de comandă:
>- dacă e fișier, va afişa numele, numărul de caractere și de linii (în această ordine)
>- dacă e director, va afişa numele și câte fișiere conține (inclusiv în subdirectoare).
>
>>[!hint]-
>>(comenzi: find, grep, test, wc)
>
>>[!solution]-
>>```bash
>>```
>

>[!Question]- 6. Să se scrie un script bash care primește ca argumente oricâte nume de fișiere. Scriptul va citi de la tastatură un cuvânt, va determina și afișa numărul de apariţii ale cuvântului în fiecare fișier furnizat ca argument.
>
>>[!hint]-
>>(comenzi: read, grep)
>
>>[!solution]-
>>```bash
>>```
>

>[!Question]- 7. Să se scrie un script bash care primește ca argumente oricâte nume de fișiere. Scriptul va citi de la tastatură două cuvinte și va înlocui TOATE aparițiile primului cuvânt cu cel de-al doilea în fiecare fișier furnizat ca argument.
>
>>[!hint]-
>>(comenzi: read, sed)
>
>>[!solution]-
>>```bash
>>```
>

>[!Question]- 8. Să se scrie un script bash care are ca argumente triplete formate dintr-un nume de fisier, un cuvant si un numar k. Pentru fiecare astfel de triplet, se vor afişa toate liniile fişierului care contin cuvăntul respectiv exact de k ori.
>
>>[!hint]-
>>(comenzi: shift, wc, sed, grep)
>
>>[!solution]-
>>```bash
>>```
>

>[!Question]- 9. Să se scrie un script bash care afişează, pentru fiecare fişier dat ca argument, linia care apare de cele mai multe ori. Afişarea se va face în ordinea descrescătoare a numărului de apariţii.
>
>>[!hint]-
>>(comenzi: sort, uniq, head)
>
>>[!solution]-
>>```bash
>>```
>

>[!Question]- 10. Să se scrie un script bash care va afişa toate numele de fişiere dintr-un director dat ca argument şi din subdirectoarele sale, care au numele mai scurte de 8 caractere. Pentru acestea, dacă sunt fişiere text, li se vor afişa primele 10 linii.
>
>>[!solution]-
>>```bash
>>```
>

>[!Question]- 11. Să se scrie un script bash care pentru fiecare fişier cu drepturile 755 dintr-un director (şi subdirectoarele sale) dat ca argument îi va modifica drepturile de acces în 744. Înainte de a modifica drepturile de acces, script-ul va cere confirmarea din partea utilizatorului (pentru fiecare fişier în parte).
>
>>[!hint]-
>>(comenzi: find, chmod, read)
>
>>[!solution]-
>>```bash
>>```
>

### Calin

>[!Question]- Write a shell script that reads numbers until 0 and computes the sum, average of the numbers and counts how many are multiples of 5.
>
>>[!code]
>>```bash
>> #!/bin/bash
>> 
>> SUM=0
>> M5=0
>> 
>> while read NUMBER; do
>> 	if [ $NUMBER -eq $NUMBER ] 2>/dev/null; then
>> 		if ((NUMBER==0)); then
>> 			break
>> 		fi
>> 		if ((NUMBER%5==0)) ; then
>> 			((M5++))
>> 		fi
>> 		SUM=`expr $SUM + $NUMBER`
>> 	else
>> 		echo $NUMBER is not a number
>> 	fi
>> 
>> done
>> 
>>echo The sum of all the numbers is $SUM. The number of multiples of 5 is $M5 
>>```
>

>[!Question]- Write a script that reads filenames and check for each file how many words each one contains on the first line and the size of the file.
>
>>[!code]
>>```bash
>>#!/bin/bash
>>
>>while read FILENAME; do
>>      if ! [ -f $FILENAME ]; then
>>              if [ $FILENAME -eq $FILENAME ] 2>/dev/null && (($FILENAME==0)); then
>>                      break
>>              fi
>>              echo $FILENAME is not a file
>>              continue 
>>      fi
>>      WORDS=$(cat $FILENAME | head -n 1 | wc -w)
>>      BYTES=$(cat $FILENAME | wc -c)
>>      echo $FILENAME has $WORDS words on the first line and a size of $BYTES bytes
>>
>>done
>>```
>

>[!Question]- Same as above but input by command line arguments(ex. ./script.sh file1.txt notanexistingfile file4.sh )
>
>>[!code]
>>```bash
>>#!/bin/bash
>>
>>for FILENAME in $*; do
>>      if ! [ -f $FILENAME ]; then
>>              if [ $FILENAME -eq $FILENAME ] 2>/dev/null && (($FILENAME==0)); then
>>                      break
>>              fi
>>              echo $FILENAME is not a file
>>              continue 
>>      fi
>>      WORDS=$(cat $FILENAME | head -n 1 | wc -w)
>>      BYTES=$(cat $FILENAME | wc -c)
>>      echo $FILENAME has $WORDS words on the first line and a size of $BYTES bytes
>>
>>done
>>```
>

>[!Question]- Sort files given as command line arguments in ascending order according to file size.
>
>>[!code]
>>```bash
>>#!/bin/bash
>>
>>touch auxiliary.txt
>>
>>for FILENAME in $*; do
>>      if ! [ -f $FILENAME ]; then
>>              echo $FILENAME is not a file
>>              continue 
>>      fi
>>      
>>      echo $(wc -c $FILENAME) >> auxiliary.txt
>>
>>done
>>sort -n auxiliary.txt
>>rm auxiliary.txt
>>```
>

>[!Question]- Write a script that monitors the state of a directory and prints a notification when something changed
>
>>[!code]
>>```bash
>>```
>

>[!Question]- 9. Create a bash script that displays every second the process count per user sorted descending by process count for all users specified as command line arguments. If no arguments are given, the script will display the process count per user for all users. Validate usernames provided.
>
>>[!code]
>>```bash
>>```
>

>[!Question]- 10. Write a shell script that receives any number of words as command line arguments, and continuously reads from the keyboard one file name at a time. The program ends when all words received as parameters have been found at least once across the given files.
>
>>[!code]
>>```bash
>>```
>

>[!Question]- 11. Write a shell script that, for all the users in /etc/passwd, creates a file with the same name as the username and writes in it all the ip addresses from which that user has logged in. (hint: use the last command to find the ip addresses).
>
>>[!code]
>>```bash
>>```
>

>[!Question]- Write a shell script that received triplets of command line arguments consisting a filename, a word and a number (validate input data). For each such triplet, print all the lines in the filename that contain the word exactly k times.
>
>>[!code]
>>```bash
>>```
>

>[!Question]- Write a shell script that for each command line parameter will do:
>
 >- if it’s a file, print the name, number of characters and lines in the file
>
>- if it’s a directory, print the name and how many files it contains (including subdirectories files)
>
>>[!code]-
>>```bash
>>```
>

>[!Question]- 15. Write a script that finds recursively in the current folder and displays all the regular files that have write permissions for everybody (owner, group, other). Then the script removes the write permissions from everybody.
>
>>[!code]
>>```bash
>>```
>

### Misc
>[!Question]- Replace all dialogue lines with the quotation representation
>Read line by line
>```bash
#!/bin/bash
>
>read -p "Fisier: " FILE
>
if ! [ -f $FILE ]; then
>	echo $FILE is not a file
>	exit 1
>fi
>
>
>while read LINE; do
>	echo $LINE | sed -E 's/^(-)(.+)$/\"\2\"/'
>done <"$FILE"
>exit 0
>```
> simple sed solution
> ```bash
>  #!/bin/bash
>  #replace all dialogue lines with quotes
>  
>  for FILE in $*; do
>       if [ -w $FILE ]; then
>           sed -E 's/^(-)(.+)$/\"\2\"/' $FILE >> aux.txt
>           #echo $FILE is a file
>           mv aux.txt $FILE
>      else
>          echo $FILE is not a writeable file
>      fi  
>  done
>```



