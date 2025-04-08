# Practice Problems
___
Class: [[OS]]
___
## [[Grep. Sed. Awk]]

^4f4c2e
### Calin
#### Lab 3
>[!done]- 1. Display the lines in /etc/passwd that belong to users having three parent initials in their name, even if the initials do not have a dot after them.
>```regex
>cat pass | grep -E " [A-Z].? [A-Z].? [A-Z].? " 
>```

>[!done]- 2. Display the lines in /etc/passwd that belong to users having names of 11 characters or longer
> Last name:
> ```regex
> cat pass | grep -E " - ([A-Z]){12,} " --color
>```
>Any name:
>```regex
>cat pass | grep -E '([A-Z]){12,}:|([A-Z]){12,}-|- ([A-Z]){12,} ' 
>```
> The solutions above are kinda bad cause they don't take into account special characters, so it's better to also use the username
> ```regex
> cat pass | grep -E '([A-Z]){12,}:|([A-Z]){12,}-|- ([A-Z]){12,} |:([a-z]){12,}.|.([a-z]){12,} ' 
>```
>(the first 3 matches are kinda redundant now but oh well)

>[!done]- 3. Convert the content of /etc/passwd using a sort of  Leet/Calculator spelling (eg Bogdan -> B09d4n)
>```regex
>cat pass | sed "y/elaoszbgELAOSZBG/3140528931405289/"
>```

>[!done]- 4. Convert the content of /etc/passwd surrounding with parentheses and sequence of 3 or more vowels
>```regex
>sed -E "s/([aeiou]){3,}/(&)/gi" pass
>```

>[!done]- 5. Display the full names (but only the full names) of the students belonging to group 211
>```
>grep -E " - 211 - " pass  | sed -E "s/(.)+- //" | awk -F: '{print $1}' | sort | uniq
>```

>[!todo]- 6. Count the numbers of male and female users in /etc/passwd, accepting as true the following incorrect assumptions: All users have their last name as the first name in the user-info filed (5th field) All women have one of their first or middle names ending in the letter “a”

#### Lab 4.
>[!done]- 1. Use file /etc/passwd and print out how many groups contain students named Andreea with an even student ID number (numar matricol).
>```regex
>cat passwd.fake | grep -E -i " dan" | awk -F: '{if ($3 % 2 == 0) print $0}'
>```

>[!done]- 2. Print the 3rd column for lines that do not start with a digit.
>```regex
>cat random_text.txt| grep -E "^[0-9]" -v | awk '{print $3}'
>```

>[!done]- 3. Create a file with the content of manual for the command man. Use grep/sed/awk to select the lines that start with "MAN" or with spaces followed by "MAN" and replace all occurrences of "MAN" with "\*star\*". Print the first and second column of these lines,separated by dash "-", but only the lines that do not contain "WILL" or "Will" or "will" in the first two columns.
>```regex
>man man > manual.txt
>cat manual.txt| grep -E "^( )*MAN" | sed -E "s/MAN/\*star\*/g" | awk '{print $1,$2}' | grep -E -v -i "will"
>```

>[!done]- 4. Write a shell command that prints out a statistic of the number of processes per user, using commands ps, awk/cut, sort and uniq.
>```bash
>#!/bin/bash
>
>if [ $# != 1 ] ; then
>
    echo "Number of processes must be 1"
    exit 1
>
>fi
>
cat $1 | awk '{print $1}' | tail -n+2 | sort | uniq -c | sort -n -r
>```
>(a file with the processes will be passed as an argument. in order to see the processes on the current server, replace cat with ps and discard the if statement)

>[!todo]- 5. Display only the last name of each user in /etc/passwd, considering the last name to be the first word in the 5th field, and accepting it only if it starts with a capital letter

>[!todo]- 6. Extent the solution above to only show the top 10 most frequent last names, ordered descending by their popularity


>[!todo]- 7. Display all the directories under /etc that contain files with the extension .sh. Each directory should be displayed only once. Hide the permission denied errors given by find.


>[!todo]- 8. Display in the pager, the number of processes of each username, sorting their usernames descending by their process count.


>[!todo]- 9. Display the processes that involve editing a C file


>[!todo]- 10. Display in the pager, the usernames with the most logins in the system.


>[!todo]- 11. Display in the pager the top of usernames by their time spent logged on in the system.



### Boian
>[!done]-  Find all the usernames that logged in from "economica" on a Sunday 
>```regex
cat last.fake | grep economica | grep Sun | awk '{print $1}' | sort | uniq
>```

>[!done]- Find all the users that logged into the system after 11PM
>```regex
cat last.fake | awk '{print $7,$1}' | sed -E s/":[0-9][0-9]"// | sort -n -r | head -n 6 | awk '{print $2}' | sort | uniq
>```

>[!done]- Display the full names of the users having a username that starts with "m" and with a user ID divisible by 7.
>```regex
cat passwd.fake | grep -E "^m" --colour | awk -F: '{print $1, $5}' | sed -E "s/([0-9]){4}/ &/" | awk '$2 % 7==0'  | awk '{print $3,$4}'
>```

>[!done]- Display all the distinct TTYs used by user root.
>```regex
cat ps.fake | grep root | awk '{print $6}' | sort | uniq
>```

>[!done]- Find the full names of all the users whose username ends in 88
>```regex
cat passwd.fake | awk -F: '{print $1,$5}' | grep -E "88 " | awk '{print $2,$3}'
>```

>[!done]- Find all users whose user ID has three digits and starts with 23
>```regex
cat passwd.fake | awk -F: '{print $1 ":" $5}' | grep --color -E "^([a-z]+023[0-9])" | awk -F: '{print $2}'
>```

>[!done]- Find all usersnames starting with "t" that logged on "pts/9"
>```regex
cat last.fake | grep "pts/9" | grep "^t" | awk '{print $1}'
>```

>[!done]- Find all the distinct usernames starting with "r" that are currently running programs, and display them duplicating every vowel
>```regex
cat ps.fake | awk '{print $1}' | grep --color -E "^r" | sort | uniq | sed -E "s/a|e|i|o|u/&&/gi"
>```

>[!done]- Display all the distinct lines left in /etc/passwd after deleting all letter and digits and spaces.
>```regex
cat ps.fake | sed -E "s/[a-z]| |[0-9]//gi"
>```

>[!done]- Display all the distinct lines left in /etc/passwd after deleting all characters except "r".
>```regex
cat ps.fake | sed -E "s/[^r]//gi"
>```

>[!done]- Calculate the average of the PIDs of the processes currently running in the system.
>```regex
cat ps.fake | awk '{print $2}'| awk '{sum+=$1; total += 1}END{print sum,total, sum/total}'
>```

### Bota

>[!todo]- Find the number of unique accounts that connected to the server on 08.03.2022
>```regex
>```
>

>[!todo]- Get the number of files in a given directory
>```regex
>```
>

>[!todo]- Get the number of subdirectories in a given directory
>```regex
>```
>

>[!todo]- Get the number of exe files in a directory
>```regex
>```
>

>[!todo]- Compute the average of the PIDs of the processes currently running in the system.
>```regex
>```
>

## [[Intro to Shell Programming|Shell Programming - Esh]]

^03fc49
### Boian
>[!done]- 1. Display a report showing the full name of all the users currently connected, and the number of processes belonging to each of them.
>```bash
>#!/bin/bash
>for line in `cat who.fake | awk '{print $1}'`; do
    echo $line `cat ps.fake | awk '{print $1}' | grep "$line" -c`
>done
>```

>[!done]- 2. Find recursively in a directory all ".c" files having more than 500 lines. Stop after finding 2 such files.
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

>[!done]- 3. Find recursively in a directory, all the files with the extension ".log" and sort their lines (replace the original file with the sorted content).
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

>[!todo]- Find recursively in a given directory all the symbolic links, and report those that point to files/directories that no longer exist. Use operator -L to test if a path is a symbolic link, and operator -e to test if it exists (will return false if the target to which the link points does not exist)
>```bash
>
>```

>[!todo]- Write a script that receives dangerous program names as command line arguments. The script will monitor all the processes in the system, and whenever a program known to be dangerous is run, the script will kill it and display a message.
>```bash
>
>```

>[!done]- 6. Find recursively in a directory, all the files that have write permissions for everyone. Display their names, and the permissions before and after removing the write permission for everybody. 
>>[!Hint]-
>>You will need to use chmod's symbolic permissions mode, instead of the octal mode we have used in class. The the chmod manual for details.
>
>>[!Code]
>>```bash
>>#!/bin/bash
>>
>>#chmod o-w
>>
>>if ! [ $# -eq 1 ]; then
>>      echo The number of arguments must be 1.
>>      exit 1
>>fi
>>
>>if ! [ -d $1 ]; then
>>      echo $1 must be a directory.
>>      exit 1
>>fi
>>
>>D=$1
>>
>>touch allfiles.txt
>>find $D -type f  > allfiles.txt
>>
>>
>>while read FILENAME; do
>>      COUNT=`ls -l $FILENAME | awk '{print $1}' | grep -E -c "([-rwx]){8,8}w."`;
>>      if [ $COUNT -eq 1 ]; then
>>              echo `ls -l $FILENAME | awk '{print $1,$9}'`
>>              chmod o-w $FILENAME
>>              echo `ls -l $FILENAME | awk '{print $1,$9}'`
>>      fi      
>>
>>
>>done < allfiles.txt
>>
>>rm allfiles.txt
>>```

>[!todo]- Consider a file containing a username on each line. Generate a comma-separated string with email addresses of the users that exist. The email address will be obtained by appending "@scs.ubbcluj.ro" at the end of each username. Make sure the generated string does NOT end in a comma.
>```bash
>
>```

>[!todo]- Display all the mounted file systems who are either smaller than than 1GB or have less than 20% free space.
>```bash
>
>```

>[!done]- 9. Write a script that finds in a given directory hierarchy, all duplicate files (content wise) and displays their paths 
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

>[!todo]- 10. Display the session count and full names of all the users who logged into the system this month, sorting the output by the session count in descending order. Use the -s and/or -t options of command last to get this month's sessions, and the command date to generate the required timestamp in the expected format.
>```bash
>
>```
### Bota

>[!done]- 1. Să se scrie un script bash care primeşte ca argument un număr natural N şi generează N fişiere de tip text, astfel:
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

>[!done]- 2. Să se scrie un script bash care afișează primele 3 linii și ultimele 3 linii ale fiecărui fișier de tip text din dintr-un director dat ca argument în linia de comandă. Dacă un fișier text are mai puțin de 6 linii, atunci conţinutul acestuia va fi afişat în întregime.
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

>[!done]- 3. Să se scrie un script bash care calculează numărul mediu de linii ale fișierelor de tip text dintr-un director dat ca argument.
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

>[!done]- 4. Să se scrie un script bash care afișează numele fișierelor dintr-un director dat ca argument care conțin numere cu peste 5 cifre.
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

>[!done]- 5. Să se scrie un script bash care pentru fiecare argument din linia de comandă:
>- dacă e fișier, va afişa numele, numărul de caractere și de linii (în această ordine)
>- dacă e director, va afişa numele și câte fișiere conține (inclusiv în subdirectoare).
>
>>[!hint]-
>>(comenzi: find, grep, test, wc)
>
>>[!solution]-
>>```bash
>>#!/bin/bash
>>
>>for ITEM in $*; do
>>      if [ -f $ITEM ]; then
>>              CHARACTERS=`wc -c < $ITEM`
>>              LINES=`wc -l < $ITEM`
>>              echo file $ITEM contains $CHARACTERS characters and $LINES lines 
>>      elif [ -d $ITEM ]; then
>>              find $ITEM -type f > subfiles.txt
>>              COUNT=`wc -l<subfiles.txt`
>>              rm subfiles.txt
>>              echo directory $ITEM contains $COUNT files
>>      else
>>              echo $ITEM is neither a file, nor a directory
>>      fi
>>done
>>```
>

>[!done]- 6. Să se scrie un script bash care primește ca argumente oricâte nume de fișiere. Scriptul va citi de la tastatură un cuvânt, va determina și afișa numărul de apariţii ale cuvântului în fiecare fișier furnizat ca argument.
>
>>[!hint]-
>>(comenzi: read, grep)
>
>>[!solution]- Naive ish solution
>>```bash
>>#!/bin/bash
>>
>>if [ $# -eq 0 ]; then 
>>      echo enter at least one filename
>>      exit 1 
>>fi
>>
>>
>>read WORD
>>
>>for FILENAME in $*; do
>>      if ! [ -f $FILENAME ]; then
>>              echo $FILENAME is not a valid file
>>              exit 1 
>>      fi 
>>      CNT=0
>>      while read LINE; do
>>              for W in $LINE; do
>>                      #CNT=$((CNT+`echo $LINE | grep -c $WORD`))
>>                      ((CNT+=`echo $W | grep -c $WORD`))
>>              done            
>>      done < $FILENAME
>>      echo $FILENAME - $CNT
>>done
>>
>>```
>
>>[!Solution]- Slightly better? maybe?
>>```bash
>>#!/bin/bash
>>
>>if [ $# -eq 0 ]; then 
>>      echo enter at least one filename
>>      exit 1 
>>fi
>>
>>
>>read WORD
>>
>>for FILENAME in $*; do
>>      if ! [ -f $FILENAME ]; then
>>              echo $FILENAME is not a valid file
>>              exit 1 
>>      fi 
>>      CNT=0
>>      while read LINE; do
>>              ((CNT+=`echo $LINE | grep -o $WORD | wc -l`))
>>      done < $FILENAME
>>      echo $FILENAME - $CNT
>>done
>>```

>[!todo]- 7. Să se scrie un script bash care primește ca argumente oricâte nume de fișiere. Scriptul va citi de la tastatură două cuvinte și va înlocui TOATE aparițiile primului cuvânt cu cel de-al doilea în fiecare fișier furnizat ca argument.
>
>>[!hint]-
>>(comenzi: read, sed)
>
>>[!solution]-
>>```bash
>>```
>

>[!todo]- 8. Să se scrie un script bash care are ca argumente triplete formate dintr-un nume de fisier, un cuvant si un numar k. Pentru fiecare astfel de triplet, se vor afişa toate liniile fişierului care contin cuvăntul respectiv exact de k ori.
>
>>[!hint]-
>>(comenzi: shift, wc, sed, grep)
>
>>[!solution]-
>>```bash
>>```
>

>[!todo]- 9. Să se scrie un script bash care afişează, pentru fiecare fişier dat ca argument, linia care apare de cele mai multe ori. Afişarea se va face în ordinea descrescătoare a numărului de apariţii.
>
>>[!hint]-
>>(comenzi: sort, uniq, head)
>
>>[!solution]-
>>```bash
>>```
>

>[!todo]- 10. Să se scrie un script bash care va afişa toate numele de fişiere dintr-un director dat ca argument şi din subdirectoarele sale, care au numele mai scurte de 8 caractere. Pentru acestea, dacă sunt fişiere text, li se vor afişa primele 10 linii.
>
>>[!solution]-
>>```bash
>>```
>

>[!todo]- 11. Să se scrie un script bash care pentru fiecare fişier cu drepturile 755 dintr-un director (şi subdirectoarele sale) dat ca argument îi va modifica drepturile de acces în 744. Înainte de a modifica drepturile de acces, script-ul va cere confirmarea din partea utilizatorului (pentru fiecare fişier în parte).
>
>>[!hint]-
>>(comenzi: find, chmod, read)
>
>>[!solution]-
>>```bash
>>```
>

### Calin

>[!done]- Write a shell script that reads numbers until 0 and computes the sum, average of the numbers and counts how many are multiples of 5.
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

>[!done]- Write a script that reads filenames and check for each file how many words each one contains on the first line and the size of the file.
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

>[!done]- Same as above but input by command line arguments(ex. ./script.sh file1.txt notanexistingfile file4.sh )
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

>[!done]- (done)Sort files given as command line arguments in ascending order according to file size.
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

>[!todo]- Write a script that monitors the state of a directory and prints a notification when something changed
>
>>[!code]
>>```bash
>>```
>

>[!todo]- Create a bash script that displays every second the process count per user sorted descending by process count for all users specified as command line arguments. If no arguments are given, the script will display the process count per user for all users. Validate usernames provided.
>
>>[!code]
>>```bash
>>```
>

>[!done]- 10. Write a shell script that receives any number of words as command line arguments, and continuously reads from the keyboard one file name at a time. The program ends when all words received as parameters have been found at least once across the given files.
>
>>[!code]
>>```bash
>>#!/bin/bash
>>
>>if [ $# -eq 0 ]; then
>>      exit 0 
>>fi 
>>
>>touch aux.txt
>>> aux.txt
>>
>>while read FILENAME; do
>>      if ! [ -f $FILENAME ]; then 
>>              echo $FILENAME is not a file
>>              continue 
>>      fi
>>
>>      while read LINE; do
>>              for WORD in $LINE; do
>>                      for SEARCHED in $*; do
>>                              if [ $WORD = $SEARCHED ]; then
>>                                      echo $WORD >> aux.txt
>>                              fi
>>                      done
>>              done            
>>              
>>      # remove duplicates - slightly faster search
>>      done < $FILENAME
>>      touch aux2.txt
>>      sort aux.txt | uniq > aux2.txt
>>      mv aux2.txt aux.txt
>>      
>>       # check if there are any words left to search
>>      for SEARCHED in $*; do
>>              FOUND_FLAG=0
>>              while read FOUND; do
>>                      if [ $SEARCHED = $FOUND ]; then
>>                              FOUND_FLAG=1;
>>                              break
>>                      fi      
>>              done < aux.txt
>>              if [ $FOUND_FLAG -eq 0 ]; then # word has not been found yet in any file
>>                      break
>>              fi
>>      done
>>      if [ $FOUND_FLAG -eq 1 ]; then # all words were found (otherwise, the previous loop would have been exited with an unset FOUND_FLAG)
>>              break
>>      fi
>>
>>done 
>>
>>rm aux.txt
>>```
>

>[!todo]- Write a shell script that, for all the users in /etc/passwd, creates a file with the same name as the username and writes in it all the ip addresses from which that user has logged in. (hint: use the last command to find the ip addresses).
>
>>[!code]
>>```bash
>>```
>

>[!done]- Write a shell script that received triplets of command line arguments consisting of a filename, a word and a number (validate input data). For each such triplet, print all the lines in the filename that contain the word exactly k times.
>
>>[!code]
>>```bash
>>#!/bin/bash
>>
>>if [ $# -eq 0 ]; then 
>>      echo enter at least one triplet
>>      exit 1 
>>fi
>>
>>if (( $# % 3 != 0 )) ; then
>>      echo The number of arguments must be a multiple of 3
>>      exit 1
>>fi
>>
>>while ! [ $# -eq 0 ]; do
>>      FILENAME=$1
>>      WORD=$2
>>      NUMBER=$3
>>      shift 3
>>
>>      if ! [ $NUMBER -eq $NUMBER ] 2>/dev/null; then
>>              echo $NUMBER is not a number
>>              exit 1
>>      fi
>>      if ! [ -f $FILENAME ]; then
>>              echo $FILENAME is not a file 
>>              exit 1 
>>      fi
>>      echo Matches for $FILENAME : 
>>      while read LINE; do
>>              COUNT=`echo $LINE | grep -o $WORD | wc -l`
>>              if [ $COUNT -eq $NUMBER ]; then
>>                      echo $LINE
>>              fi
>>      done < $FILENAME
>>      
>>
>>done 
>>```
>

>[!done]- Write a shell script that for each command line parameter will:
>
> - if it’s a file, print the name, number of characters and lines in the file
>
>- if it’s a directory, print the name and how many files it contains (including subdirectories files)
>
>>[!code]-
>>```bash
>>#!/bin/bash
>>
>>for ITEM in $*; do
>>      if [ -f $ITEM ]; then
>>              CHARACTERS=`wc -c < $ITEM`
>>              LINES=`wc -l < $ITEM`
>>              echo file $ITEM contains $CHARACTERS characters and $LINES lines 
>>      elif [ -d $ITEM ]; then
>>              find $ITEM -type f > subfiles.txt
>>              COUNT=`wc -l<subfiles.txt`
>>              rm subfiles.txt
>>              echo directory $ITEM contains $COUNT files
>>      else
>>              echo $ITEM is neither a file, nor a directory
>>      fi
>>done
>>```
>

### Misc
>[!done]- Replace all dialogue lines with the quotation representation
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

