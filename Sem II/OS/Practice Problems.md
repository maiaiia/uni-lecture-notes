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
>
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
>
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
>
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
>
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

>[!done]- 9. Să se scrie un script bash care afişează, pentru fiecare fişier dat ca argument, linia care apare de cele mai multe ori. Afişarea se va face în ordinea descrescătoare a numărului de apariţii.
>
>>[!hint]-
>>(comenzi: sort, uniq, head)
>
> Afisare pentru fiecare linie in parte
>>[!solution]-
>>```bash
>>#!/bin/bash
>>
>>if [ $# -eq 0 ]; then
>>      echo The number of arguments must be at least 1
>>      exit 1
>>fi
>>
>>for FILENAME in $*; do
>>      if ! [ -f $FILENAME ]; then
>>              echo $FILENAME is not a file
>>              exit 1 
>>      fi
>>done
>>
>>for FILENAME in $*; do
>>      echo $FILENAME
>>      cat $FILENAME | sort | uniq -c | sort -n -r | head -n 1 | sed -E 's/^[ 0-9]+//'
>>
>>done
>>```
>
>Afisare in ordine descrescatoare dupa numarul de aparitii totale
>>[!Solution]-
>>```bash
>>#!/bin/bash
>>
>>if [ $# -eq 0 ]; then
>>      echo The number of arguments must be at least 1
>>      exit 1
>>fi
>>
>>for FILENAME in $*; do
>>      if ! [ -f $FILENAME ]; then
>>              echo $FILENAME is not a file
>>              exit 1 
>>      fi
>>done
>>
>>touch aparitii.txt
>>
>>for FILENAME in $*; do
>>      cat $FILENAME | sort | uniq -c | sort -n -r | head -n 1 >> aparitii.txt
>>      
>>
>>done
>>
>>sort -n -r aparitii.txt | sed -E 's/^[ 0-9]+//'
>>
>>rm aparitii.txt
>>```

>[!done]- 10. Să se scrie un script bash care va afişa toate numele de fişiere dintr-un director dat ca argument şi din subdirectoarele sale, care au numele mai lungi de 8 caractere. Pentru acestea, dacă sunt fişiere text, li se vor afişa primele 10 linii.
>
>>[!solution]-
>>```bash
>>#!/bin/bash
>>
>>if ! [ $# -eq 1 ]; then 
>>      echo The number of arguments must be 1.
>>      exit 1 
>>fi
>>
>>if ! [ -d $1 ]; then 
>>      echo $1 is not a directory.
>>      exit 1 
>>fi 
>>
>>D=$1
>>
>>FILES=`find $D -type f`
>>
>>for FILENAME in $FILES; do
>>      NOPATH=`echo $FILENAME |sed -E 's/(.+\/)//g'`   
>>      if echo $NOPATH | grep -E -q '.{9,}'; then
>>              echo $FILENAME 
>>              if echo $FILENAME | grep -q -E '(.)+\.txt\>' ; then
>>                      cat $FILENAME | head -n 10
>>              fi
>>      fi
>>done
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

>[!done]- Sort files given as command line arguments in ascending order according to file size.
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
>
>```bash
>#!/bin/bash
>
>read -p "Fisier: " FILE
>
>if ! [ -f $FILE ]; then
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
>
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

## Processes
### Calin
>[!done]- Write a program that receives as cmd line arguments numbers. For each argument it creates a new process that will check and print if the number is prime or not 
>You will need:
>- A program that checks if a number is prime
>- Main C program -> fork (process) for each argument and call check using exec
>
>>[!code]- prime.c
>>```c
>>#include <stdio.h>
>>#include <stdlib.h>
>>
>>int prime(int number){
>>      if (number <= 1)
>>              return 0;
>>      if (number == 2 || number == 3)
>>              return 1;
>>      if (number % 2 == 0 || number % 3 == 0)
>>              return 0;
>>      for (int i = 5; i * i <= number; i += 6)
>>              if (number % i == 0 || number % (i + 2) == 0)
>>                      return 0;
>>
>>      return 1;
>>}
>>
>>int main(int argc, char* argv[]){
>>      if (argc < 1)
>>              return 1;
>>      int number = atoi(argv[1]);
>>      if (prime(number))
>>              printf("%d is a prime number\n", number);
>>      else
>>              printf("%d is not a prime number\n", number);
>>      return 0;
>>}
>>```
>
>>[!code]- test_primes.c
>>```c
>>#include <stdio.h>
>>#include <unistd.h>
>>#include <sys/wait.h>
>>#include <stdlib.h>
>>
>>int main(int argc, char* argv[]){
>>      for (int i = 1; i <= argc; i++){
>>              if (fork() == 0){
>>                      execl("./prime","./prime",argv[i],NULL);
>>                      printf("Error\n");
>>                      exit(1);
>>              }       
>>      }
>>      for (int i = 1; i <= argc; i++)
>>              wait(0);
>>      return 0;
>>}
>>```

>[!done]- 5. compares 2 or more numbers as arguments and returns 0 if all are equal, 1 otherwise. This program is called by a C program which reads several numbers and prints if they are equal or not (the main program calls the comparing program for pairs of numbers and checks if the exit status of the child processes is 1 for all cases).
>
>>[!code]- compare.c
>>```c
>>#include <stdio.h>
>>#include <stdlib.h>
>>#include <unistd.h>
>>
>>int main(int argc, char** argv){
>>      if (argc != 3){
>>              perror("Please enter exactly 2 arguments");
>>              exit(1);
>>      }
>>
>>      int n1 = atoi(argv[1]);
>>      int n2 = atoi(argv[2]);
>>
>>      if (n1 == n2)
>>              exit(0);
>>
>>      exit(1);
>>}
>>```
>
>>[!code]- main.c
>>```c
>>#include <stdio.h>
>>#include <unistd.h>
>>#include <sys/wait.h>
>>#include <stdlib.h>
>>
>>int main(int argc, char** argv){
>>      if (argc < 3){
>>              perror("Please enter at least 2 arguments");
>>              exit(1);
>>      }
>>
>>      //int n1 = atoi(argv[1]);
>>      for (int i = 2; i < argc; i++){
>>              //int n2 = atoi(argv[i]);
>>              int cpid = fork();
>>              if (cpid == -1){
>>                      perror("Error on fork");
>>                      exit(1);
>>              }
>>              if (cpid == 0){
>>                      execl("./proc_c_5_compare", "./proc_c_5_compare", argv[1], arg[i], NULL);
>>                      printf("Error");
>>                      exit(1);
>>              }
>>      }
>>      int status, eq = 1;
>>      for (int i = 2; i < argc; i++){
>>              wait(&status);
>>              if (WEXITSTATUS(status) != 0)
>>                      eq = 0;
>>      }
>>      if (!eq)
>>              printf("Not equal\n");
>>      else
>>              printf("Equal\n");
>>
>>      return 0;
>>}
>>```
>

>[!done]- 6. receives as arguments a filename and a string and writes in the file the reversed string. This program is called by a C program which reads several strings and concatenates them in reverse in the file (using the first program).
> I assumed the order of the strings didn't need to be reversed as well
>
>>[!code]- reverse.c
>>```c
>>#include <stdio.h>
>>#include <unistd.h>
>>#include <stdlib.h>
>>#include <string.h>
>>
>>int main(int argc, char** argv){
>>      if (argc != 3){
>>              perror("Please enter exactly 2 arguments.");
>>              exit(1);
>>      }
>>
>>      int l = strlen(argv[2]);
>>      for (int i = 0; i < l / 2; i++){
>>              char aux = argv[2][i];
>>              argv[2][i] = argv[2][l-i-1];
>>              argv[2][l-i-1] = aux;
>>      }
>>      
>>      FILE* desc = fopen(argv[1], "a");
>>      fprintf(desc, "%s\n", argv[2]);
>>      fclose(desc);
>>
>>
>>      return 0;
>>}
>>```
>>[!code]- main.c
>>```c
>>#include <stdio.h>
>>#include <stdlib.h>
>>#include <unistd.h>
>>#include <sys/wait.h>
>>
>>
>>int main(int argc, char** argv){
>>      if (argc < 3){
>>              perror("Please enter at least 2 arguments.");
>>              exit(1);
>>      }
>>      
>>      FILE* desc = fopen(argv[1], "w");
>>      fclose(desc);
>>
>>
>>      for (int i = 2; i < argc; i++){
>>              int cpid = fork();
>>              if (cpid == -1){
>>                      perror("Error on fork");
>>                      exit(1);
>>              }
>>              if (cpid == 0){
>>                      execl("./cpp6_rev", "./cpp6_rev", argv[1], argv[i], NULL);
>>                      perror("Error on exec");
>>                      exit(1);
>>              } else {
>>                      wait(NULL); //in order to avoid concurrency problems
>>              }
>>
>>      }
>>
>>      return 0;
>>}
>>```
>

>[!todo]- 7. receives as arguments 2 numbers and a filename and prints in the file the lowest common multiple of the two numbers. This program is called by a C program which reads a string of natural numbers and prints the lowest common multiple of all. Use the exit status.
>
>>[!code]
>>```c
>>```

>[!todo]- 8. receives as arguments 3 filenames, the first two contain a sorted array of numbers, and prints in the third the sorted merge of the two arrays. This program is called by a C program which reads an array of integer numbers, sorts them and writes the sorted array. You may use merge sort (split the array in files with one number each, then merge all files into one).
>
>```c
>```

>[!todo]- 9. receives as arguments two file names and adds the contents of the first at the end of the second. This program is called by a C program which receives as arguments filenames and concatenates the first n-1 files into the nth file.
>
>```c
>```

>[!done]- (not really done though) 10. Write a program that creates three child processes that loop forever printing their ID in the form “PID is running”. The parent process suspends the execution of each child and then prints the PID of each child  created, prompting the user to choose which one should continue next. Parent process reads the PID from stdin and then resumes the execution of the child having PID for the next three seconds, after which it suspends it again and prompts the user to choose a new PID that will run for the next 3 seconds etc in a continuous loop. When the user sends Ctrl+C signal, the program will prompt the user to choose which of the three child processes should be terminated and will read the PID of the child that will be terminated with a message. When there are no child processes running, the parent process will also terminate with a message.
>
> Pretty bad solution but it's all i managed to come up with
>>[!code]-
>>```c
>>#include <stdio.h>
>>#include <unistd.h>
>>#include <sys/wait.h>
>>#include <signal.h>
>>#include <stdlib.h>
>>
>>int cpid[3], child_running = 0;
>>
>>void parent_handler(int sig){
>>	(void)sig;
>>	printf("Choose process to terminate: %d, %d, %d\n", cpid[0], cpid[1], cpid[2]);
>>	int id; scanf("%d", &id);
>>	if (id == -1)
>>		return;
>>	for (int i = 0; i < 3; i++){
>>		if (cpid[i] == id){
>>			kill(cpid[i], SIGINT);
>>			wait(0);
>>			cpid[i] = -1;
>>			printf("Successfully terminated process %d.\n", id);
>>		}
>>	}
>>
>>	int active = 0;
>>    for (int i = 0; i < 3; i++)
>>        if (cpid[i] != -1)
>>            active = 1;
>>	if (!active){
>>		printf("No more active child processes. Terminating current process...");
>>		exit(0);
>>	}
>>
>>}
>>void child_handler_1(int sig){
>>	(void)sig;
>>	child_running = 0;
>>}
>>
>>void child_handler_2(int sig){
>>	(void)sig;
>>	child_running = 1;
>>}
>>
>>void child_loop(){
>>	signal(SIGUSR1, child_handler_1);
>>    signal(SIGUSR2, child_handler_2);
>>    while (1){
>>		if (child_running){
>>			printf("%d is running\n", getpid());
>>			usleep(100000); //too many print statements otherwise	
>>		}
>>	}
>>
>>}
>>
>>void parent_loop(){
>>	signal(SIGINT, parent_handler);
>>    for (int i = 0; i < 3; i++)
>>        kill(cpid[i], SIGUSR1);
>>    while (1){
>>        printf("Choose process to execute: %d, %d, %d\n", cpid[0], cpid[1], cpid[2]);
>>        int id; scanf("%d", &id);
>>        for (int i = 0; i < 3; i++)
>>            if (cpid[i] == id && id != -1){
>>                kill(cpid[i], SIGUSR2);
>>                sleep(3);
>>                kill(cpid[i], SIGUSR1);
>>                break;
>>            }
>>    }
>>
>>}
>>
>>
>>int main(){
>>	for (int i = 0; i < 3; i++){
>>		cpid[i] = fork();
>>		if (cpid[i] == -1){
>>			perror("Error on fork");
>>			for (int j = 0; j < i; j++){
>>				kill(cpid[j], SIGINT);
>>				wait(0);
>>			}
>>			exit(1);
>>		}
>>		if (cpid[i] == 0){
>>			child_loop();
>>			exit(0); //this should not be executed like ever but
>>		}
>>	}
>>	usleep(100000); //attempt to avoid race conditions causing the child loops to not execute properly i guess
>>	parent_loop();
>>	return 0;
>>}
>>```

### Horea
>[!tip]
>>[!code]
>>```c
>>void write_to_fd(int fd, char *buf) {
>>    int len = strlen(buf);
>>    if (0 > write(fd, &len, sizeof(int))) {
>>        perror("Error on write length");
>>    }
>>    if (0 > write(fd, buf, len * sizeof(char))) {
>>        perror("Error on write buffer");
>>    }
>>}
>>
>>void read_from_fd(int fd, int max, char *buf) {
>>    int read_bytes = 0;
>>    while(read_bytes < max) {
>>        int k;
>>        if((k = read(fd, buf + read_bytes, (max - read_bytes) * sizeof(char))) > 0) {
>>            read_bytes += k;
>>        }
>>    }
>>}
>>```
>

>[!done]- 1. Write a C program that creates n child processes. Each child process will print its PID and its parent PID. The parent process will print its PID and the PID of each of the child processes.
>>[!code]-
>>```c
>>#include <stdio.h>
>>#include <sys/wait.h>
>>#include <unistd.h>
>>#include <stdlib.h>
>>
>>int main(int argc, char** argv)
>>{
>>	if (argc != 2){
>>		perror("Please enter exactly one argument");
>>		exit(1);
>>	}
>>
>>	int n = atoi(argv[1]);
>>
>>	int pid = getpid();
>>	for (int i = 0; i < n; i++) {
>>		int cpid = fork();
>>		if (cpid == -1){
>>			perror("Error on fork");
>>			exit(1);
>>		}
>>		if (cpid == 0){
>>			printf("Child Iteration %d - PID - %d - PPID: %d\n", i, getpid(), getppid());
>>			exit(0);
>>		} 
>>		else {
>>			printf("Parent Iteration %d - PID %d - Child PID %d\n",i, pid, cpid);
>>		}
>>	}
>>	for (int i = 0; i < n; i++)
>>		wait(NULL);
>>
>>	return 0;
>>}
>>```
>

>[!done]- 2. Write a C program that creates a linear hierarchy of n processes (a parent process creates a child process, which in turn creates a child process, and so on).
>
>>[!code]
>>```c
>>#include <stdio.h>
>>#include <sys/wait.h>
>>#include <unistd.h>
>>#include <stdlib.h>
>>
>>
>>int main(int argc, char** argv){
>>	if (argc != 2){
>>		perror("Please enter exactly one argument");
>>		exit(1);
>>	}
>>
>>	int n = atoi(argv[1]);
>>
>>	for (int i = 0; i < n; i++) {
>>		int cpid = fork();
>>		if (cpid == -1){
>>			perror("Error on fork");
>>			exit(1);
>>		}
>>		if (cpid == 0){
>>			printf("Iteration %d: PID - %d, PPID - %d\n", i, getpid(), getppid());
>>		}
>>		else {
>>			wait(NULL);
>>			exit(0);
>>		}
>>
>>	}
>>	
>>
>>	return 0;
>>}
>>```

>[!todo]- 3. Write a C program that creates a child process. Both the parent and the child processes will run until they receive a SIGUSR1 signal. Implement signal handling such that if the parent receives the SIGUSR1 signal first, it sends it to the child process as well. If the child process receives a SIGUSR1 signal without the parent receiving the same signal, it will terminate and then the parent should correctly call wait for the child process.
>
>>[!code]
>>```c
>>```

>[!todo]- 4. Write a C program that runs a bash command (potentially with arguments) received as a command line argument and times its execution.
>
>>[!code]
>>```c
>>```
>

>[!todo]- 5. Write a C program that implements the boltz game. Exactly N processes (numbered 1 to N, where N is given) take turns incrementing a number, starting from 1, and sending it to the next process. Process 1 starts the game by incrementing the number and sends it to process 2, which increments and sends it to process 3 and so on. Process N will send the number back to process 1, ant the cycle starts again. Each process must print the number it sends, unless the number contains the digit 7 or is divisible by 7, in which case it must print "boltz". Implement so that each process has a 1 in 3 chance to fail printing "boltz" when it should, in which case the game stops.
>
>>[!code]
>>```c
>>```

## Pipe. FIFO
### Bota
>[!done]- 1. Să se scrie un program C care creează un proces copil cu care comunică prin pipe. Procesul părinte citeşte de la tastatură un număr natural şi îl trimite prin pipe procesului copil, iar procesul copil verifică şi afişează dacă acest număr este par sau impar.
>
>>[!code]-
>>```c
>>#include <stdio.h>
>>#include <sys/wait.h>
>>#include <unistd.h>
>>#include <stdlib.h>
>>
>>int main(){
>>	int p[2]; pipe(p);
>>	int id = fork();
>>	if (id == -1){
>>		perror("Error on fork.");
>>		exit(1);
>>	}
>>	if (id == 0){
>>		close(p[1]);
>>		int n;
>>		read(p[0], &n, sizeof(int));
>>		if (n % 2)
>>			printf("%d is odd\n", n);
>>		else
>>			printf("%d is even\n", n);
>>
>>		close(p[0]);
>>		exit(0);
>>	}
>>	close(p[0]);
>>	int n; 
>>	printf("Enter a number: ");
>>	scanf("%d", &n);
>>	write(p[1], &n, sizeof(int));
>>	close(p[1]);
>>
>>	wait(NULL);
>>	return 0;
>>}
>>```
>

>[!done]- 3. Să se scrie un program C care creează un proces copil cu care comunică prin pipe. Procesul părinte citeşte de la tastatură un caracter c şi un şir s şi le trimite prin pipe procesului copil, iar procesul copil verifică şi afişează numărul de apariţii ale caracterului c în şirul s.
>
>>[!code]-
>>```c
>>#include <stdio.h>
>>#include <sys/wait.h>
>>#include <unistd.h>
>>#include <stdlib.h>
>>#include <string.h>
>>
>>int read_string_no_size(int fd, char* buf){
>>	int bytes_read = 0;	
>>	while (1){
>>		int k = read(fd, buf + bytes_read, sizeof(char));
>>		if (!k || buf[bytes_read] == '\0')
>>			break;
>>		bytes_read += k; //should be 1 (otherwise i woul've had to perform the addition before comparing buf[bytes+read] w '\0')
>>	}
>>
>>	return bytes_read;
>>}
>>
>>int main(){
>>	int p[2]; pipe(p);
>>	int id = fork();
>>	if (id == -1){
>>		perror("Error on fork.");
>>		exit(1);
>>	}
>>	if (id == 0){
>>		close(p[1]);
>>		char c, * s;
>>    	s = malloc(sizeof(char) * 101);
>>		read(p[0], &c, sizeof(char));
>>		read_string_no_size(p[0], s);
>>		int cnt = 0;
>>		for (int i = 0; s[i] != '\0'; i++)
>>			if (s[i] == c)
>>				cnt++;
>>		printf("'%c' appears in '%s' %d times\n", c, s, cnt);
>>		close(p[0]);
>>		free(s);
>>		exit(0);
>>	}
>>	close(p[0]);
>>
>>	char c, * s;
>>	s = malloc(sizeof(char) * 101);
>>	printf("Enter a character: ");
>>	scanf("%c", &c);
>>	printf("Enter a string: ");
>>	fgets(s, 100, stdin);
>>	fgets(s, 100, stdin);
>>	s[strlen(s)-1] = '\0';
>>
>>	write(p[1], &c, sizeof(char));
>>	write(p[1], s, (strlen(s) + 1) * sizeof(char));
>>	free(s);
>>	close(p[1]);
>>	wait(NULL);
>>	return 0;
>>}
>>```
>

>[!todo]- 4. Să se scrie un program C care creează un proces copil cu care comunică prin pipe. Procesul părinte citeşte de la tastatură două numere întregi pe care le trimite prin pipe procesului copil, iar procesul copil returnează prin pipe suma lor.
>
>>[!code]-
>>```c
>>```
>

>[!todo]- 5. Să se scrie un program C care creează un proces copil cu care comunică prin pipe. Procesul părinte citeşte dintr-un fişier de tip text două numere întregi pe care le trimite prin pipe procesului copil, iar procesul copil returnează prin pipe suma lor.
>
>>[!code]-
>>```c
>>```
>

>[!todo]- 6. Write a C program in which two processes communicate via pipes, like this:
>Parent process:
>- opens a text file, reads its entire contents and sends it via pipe to the child process
>
>Child process:
>- reads from the pipe, calculates and displays the number of words/letters
>
>>[!code]-
>>```c
>>```
>

>[!todo]- 7. Write a C program in which two processes communicate via pipes, like this:
>Parent process:
>- continuously reads an operation ('+', '-', ' * ', '/') and two integers from the keyboard and writes them to the pipe
>
>Child process:
>- reads from the pipe, executes the operation and writes the numbers and the result obtained to a text file
>
>>[!code]-
>>```c
>>```
>

### Calin 
>[!done]- 4. Write a program that creates a child process. The two communicate through a pipe. The parent reads a string with >25 characters and sends it to the child, which removes 1 vowel and sends it to the parent, which removes the first and the last character and sends it to the child back which removes again a vowel and sends it back .... and so on untill the string contains 3 or less characters.
>
>>[!code]
>>```c
>>#include <stdio.h>
>>#include <sys/wait.h>
>>#include <unistd.h>
>>#include <stdlib.h>
>>#include <string.h>
>>
>>const int STOP_READ = -100;
>>
>>void read_string(int l, int fd, char* buf){
>>	int bytes_read = 0;
>>	while (bytes_read != l){
>>		int k = read(fd, buf + bytes_read, sizeof(char));
>>		if (k)
>>			bytes_read += k;
>>	}
>>
>>}
>>
>>int main(){
>>	int p2c[2], c2p[2];
>>	pipe(p2c); pipe(c2p);
>>	int id = fork();
>>	if (id == -1){
>>		perror("Error on fork.");
>>		exit(1);
>>	}
>>	if (id == 0){
>>		close(p2c[1]); close(c2p[0]);
>>		while (1){
>>			int l;
>>			char * w;
>>			read(p2c[0], &l, sizeof(int));
>>			if (l == STOP_READ)
>>				break;
>>			w = malloc(sizeof(char) * (l+2));
>>			read_string(l+1, p2c[0], w);
>>			//printf("Child  reads: %s\n", w);
>>			
>>			//remove vowel
>>			for (int i = 0; i < l; i++)
>>				if (strchr("aeiouAEIOU", w[i])!=NULL){
>>					char* aux = malloc(sizeof(char) * (l + 2));
>>					strcpy(aux, w+i+1);
>>					strcpy(w+i, aux);
>>					free(aux);
>>					l = strlen(w);
>>					break;
>>				}
>>
>>			printf("Child  sends: %s\n", w);
>>			write(c2p[1], &l, sizeof(int));
>>			write(c2p[1], w, (l + 1) * sizeof(char));
>>			free(w);
>>		}
>>		close(p2c[0]); close(c2p[1]);
>>		exit(0);
>>	}
>>	close(p2c[0]); close(c2p[1]);
>>	int l; char * w = malloc(100 * sizeof(char));
>>	printf("Enter a long string with no spaces\n");
>>	scanf("%s", w); 
>>	l = strlen(w);
>>	w[l] = '\0'; //redundant but idc
>>	while (l > 3){
>>		printf("Parent sends: %s\n", w);
>>		write(p2c[1], &l, sizeof(int));
>>		write(p2c[1], w, (l + 1) * sizeof(char));
>>
>>		read(c2p[0], &l, sizeof(int));
>>		read_string(l + 1, c2p[0], w);
>>		w[l]='\0';
>>		//printf("Parent reads: %s\n", w);
>>		if (l <= 3)
>>			break;
>>		//remove first and last letter
>>		w[l-1]='\0';
>>		char* aux = malloc((l+2) * sizeof(char));
>>		strcpy(aux, w + 1);
>>		strcpy(w, aux);
>>		free(aux);
>>		l = strlen(w);
>>	}
>>	close(c2p[0]);
>>	if (l <= 3)
>>		write(p2c[1], &STOP_READ, sizeof(int));
>>	close(p2c[1]);
>>	printf("Game stops with the final string: %s", w);
>>	
>>	free(w);
>>	wait(NULL);
>>	return 0;
>>}
>>```

>[!done]- 5. Write two independent programs A and B that communicate using fifos. Program A reads words from keyboard and send them to process B, receiving back the word in uppercase letters and a number representing the number of letters of the word. Program B received from A a word, computes the corresponsing word with uppercase letters and number of letters and sends these to to program A. This continues in a loop, untill program A sends word "000" and receives back the same word and number 0 and terminates. So doesa program B, when received "000", sends to A "000" and number 0 and terminates.
>```tabs
>tab: fifo_c5a.c
>>[!code] fifo_c5a.c
>>```c
>>#include <stdio.h>
>>#include <fcntl.h>
>>#include <unistd.h>
>>#include <string.h>
>>#include <stdlib.h>
>>
>>int a2b, b2a;
>>
>>int read_string(int fd, char* buf){
>>    int bytes_read = 0;
>>    while (1){
>>        int k = read(fd, buf+bytes_read, sizeof(char));
>>        if (!k) break;
>>        if (k == -1){
>>            perror("Error on read");
>>            close(a2b); close(b2a);
>>                      free(buf);
>>                      exit(1);
>>        }
>>        if (buf[bytes_read] == '\0')
>>            break;
>>        bytes_read++;
>>    }
>>    return bytes_read;
>>}
>>
>>int main(){
>>      a2b = open("a2b", O_WRONLY);
>>      b2a = open("b2a", O_RDONLY);
>>
>>      while (1){
>>              printf("Enter a word: \n");
>>              char* w = malloc(50 * sizeof(char));
>>              scanf("%s", w);
>>              w[strlen(w)]='\0'; //redundant, again
>>              printf("A sends %s\n", w);
>>              write(a2b, w, (strlen(w)+1) * sizeof(char));
>>
>>              read_string(b2a, w);
>>              int l; read(b2a, &l, sizeof(int));
>>              printf("A reads %s and %d\n", w, l);
>>              
>>              int b = (strcmp(w, "000") == 0);
>>              free(w);
>>              if (b)
>>                      break;
>>
>>      }
>>      close(a2b); close(b2a);
>>      return 0;
>>}
>>```
>
>tab: fifo_c5b.c
>>[!code] fifo_c5b.c
>>```c
>>#include <stdio.h>
>>#include <fcntl.h>
>>#include <unistd.h>
>>#include <string.h>
>>#include <stdlib.h>
>>
>>int a2b, b2a;
>>
>>int read_string(int fd, char* buf){
>>      int bytes_read = 0;
>>      while (1){
>>              int k = read(fd, buf+bytes_read, sizeof(char));
>>              if (!k) break;
>>              if (k == -1){
>>                      perror("Error on read");
>>                      close(a2b); close(b2a);
>>                      free(buf);
>>                      exit(1);
>>              }
>>              if (buf[bytes_read] == '\0')
>>                      break;
>>              bytes_read++;
>>      }
>>      return bytes_read;
>>}
>>
>>int main(){
>>      //int a2b, b2a;
>>    a2b = open("a2b", O_RDONLY);
>>    b2a = open("b2a", O_WRONLY);
>>      
>>      while (1){
>>        char* w = malloc(50 * sizeof(char));
>>              read_string(a2b, w);
>>              printf("B reads %s\n", w);
>>              int l = strlen(w);
>>              int cnt = 0;
>>              for (int i = 0; i < l; i++)
>>                      if ('a' <= w[i] && w[i] <= 'z'){
>>                              w[i] += 'A' - 'a';
>>                              cnt++;
>>                      }
>>              w[l] = '\0';
>>              
>>        printf("B sends %s and %d\n", w, cnt);
>>        write(b2a, w, (l+1)*sizeof(char));
>>              write(b2a, &cnt, sizeof(int));
>>        int b = (strcmp(w, "000") == 0);
>>              free(w);
>>        if (b)
>>            break;
>>
>>      }
>>      close(a2b); close(b2a);
>>      return 0;
>>
>>}
>>```
>```

>[!done]- 6. Six children are in a circle, playing the alphabet game.  
One of them starts with A, the next continues with B and so on, until they reach Z.  
A dice determines the player that starts the game.  
Write a program with 6 processes to model this game: each process receives a letter, prints out their ID and the next letter in the alphabet and sends it to the next process.  
The transmission of data is unidirectional throughout the game.  
Use a random function to determine the player that starts the game (players are named: 1, 2, 3, 4, 5, 6).  
Print out the number of the player that finishes the alphabet.  
Solve the problem using pipes.
>
>>[!code]-
>>```c
>>#include <stdio.h>
>>#include <stdlib.h>
>>#include <unistd.h>
>>
>>int firstPlayer, p[12], id[6], rd_idx[6], wr_idx[6];
>>
>>void childLoop(int ord){
>>	for (int i = 0; i < 12; i++)
>>		if (i != rd_idx[ord] && i != wr_idx[ord])
>>			close(p[i]);
>>	char curr = 'A';
>>	if (ord == firstPlayer){
>>		printf("Game starts with player %d\n", ord + 1);
>>		printf("Player | PID | Character\n");
>>		printf("------------------------\n");
>>		printf("  %d      %d      %c\n", ord + 1, getpid(), curr);
>>		write(p[wr_idx[ord]], &curr, sizeof(char));
>>	}
>>	while (1){
>>		if (read(p[rd_idx[ord]], &curr, sizeof(char)) <= 0)
>>			break;
>>		//if (curr == stopFlag)
>>			//break;
>>		curr++;
>>	  //printf("Player | PID | Character\n");
>>		printf("  %d      %d      %c\n", ord + 1, getpid(), curr);
>>		if (curr == 'Z'){
>>			printf("Game over on player %d.\n", ord + 1);
>>			//write(p[wr_idx[ord]], &stopFlag, sizeof(char));
>>			break;
>>		}
>>		//printf("%d - %d - %c\n", ord + 1, getpid(), curr);
>>		write(p[wr_idx[ord]], &curr, sizeof(char));
>>	}
>>	close(p[wr_idx[ord]]);
>>	close(p[rd_idx[ord]]);
>>	exit(0);
>>}
>>
>>int main(){
>>	//process k reads from (2 * (k - 1)+12) % 12 and writes to 2 * k + 1
>>	// (for k in {0,...,5})
>>	//int p[12], id[6], rd_idx[6], wr_idx[6];
>>	
>>	srandom(getpid());
>>	firstPlayer = random() % 6;
>>
>>	for (int k = 0; k < 6; k++){
>>		pipe(p+2*k);
>>		rd_idx[k] = (12 + 2 * (k - 1)) % 12;
>>		wr_idx[k] = 2 * k + 1;
>>	}
>>
>>	for (int k = 0; k < 6; k++){
>>		id[k] = fork();
>>		if (id[k] == -1){
>>			perror("Error on fork");
>>			exit(1);
>>		}
>>		if (id[k] == 0)
>>			childLoop(k);
>>	}
>>	for (int i = 0; i < 12; i++)
>>		close(p[i]);
>>
>>	for (int i = 0; i < 6; i++)
>>		wait(NULL);
>>	return 0;
>>}
>>```
>

>[!done]- 7. Model problem 6 such that one of the 6 children randomly skips an alphabet letter.  
When this mistake happens, the direction of the game is changed.  
You will need an additional set of pipes, in order to have one for each direction of the game (clockwise/counterclockwise).  
Solve the problem using fifos.
>
>>[!code]-
>>```c
>>#include <stdio.h>
>>#include <stdlib.h>
>>#include <unistd.h>
>>#include <sys/types.h>
>>#include <sys/stat.h>
>>#include <fcntl.h>
>>
>>const char CHANGE_DIRECTION = '#';
>>
>>int firstPlayer, skipPlayer, id[6], rd_desc[2][6], wr_desc[2][6];
>>const char fifos[2][6][3] = {{"01", "12", "23", "34", "45", "50"},{"05","10", "21", "32", "43", "54"}};
>>
>>//0 - clockwise, 1 - anti-clockwise
>>
>>void childLoop(int ord){
>>      //OPEN FIFO - be mindful of deadlocks!
>>      if (ord % 2){
>>              //open read first
>>              rd_desc[0][ord] = open(fifos[0][(ord + 6 - 1) % 6], O_RDONLY);
>>              wr_desc[0][ord] = open(fifos[0][ord], O_WRONLY);
>>              rd_desc[1][ord] = open(fifos[1][(ord + 1) % 6], O_RDONLY);
>>              wr_desc[1][ord] = open(fifos[1][ord], O_WRONLY);
>>      }
>>      else {
>>              //open write first
>>              wr_desc[0][ord] = open(fifos[0][ord], O_WRONLY);
>>              rd_desc[0][ord] = open(fifos[0][(ord + 5) % 6], O_RDONLY);
>>              wr_desc[1][ord] = open(fifos[1][ord], O_WRONLY);
>>              rd_desc[1][ord] = open(fifos[1][(ord + 1) % 6], O_RDONLY);
>>      }
>>
>>
>>      int dir = 0; //when the direction changes, dir ^= 1     
>>      char curr = 'A';
>>
>>      if (ord == firstPlayer){
>>              printf("Game starts with player %d\n", ord + 1);
>>              printf("Player | PID | Character\n");
>>              printf("------------------------\n");
>>              printf("  %d      %d      %c\n", ord + 1, getpid(), curr);
>>              write(wr_desc[dir][ord], &curr, sizeof(char));
>>      }
>>
>>      while (1){
>>              if (read(rd_desc[dir][ord], &curr, sizeof(char)) <= 0)
>>                      break;
>>              if (curr == CHANGE_DIRECTION){
>>                      int nextPlayer;
>>                      if (dir == 0) //clockwise
>>                              nextPlayer = (ord + 1) % 6;
>>                      else
>>                              nextPlayer = (ord + 5) % 6; // - 1 + 6
>>                      if (nextPlayer != skipPlayer)
>>                              write(wr_desc[dir][ord], &CHANGE_DIRECTION, sizeof(char));
>>                      dir ^= 1;
>>                      continue;
>>              }
>>              
>>              curr++;
>>              int skip = 0;
>>              if (ord == skipPlayer && curr < 'Z' && random() % 3 == 0) 
>>                      skip = 1 ; 
>>              
>>              if (!skip)
>>                      printf("  %d      %d      %c\n", ord + 1, getpid(), curr);
>>              else {
>>                      printf("Skip!\n");
>>                      write(wr_desc[dir][ord], &CHANGE_DIRECTION, sizeof(char));
>>                      curr--;
>>                      dir ^= 1;
>>              }
>>              if (curr >= 'Z'){
>>                      printf("Game over on player %d.\n", ord + 1);
>>                      break;
>>              }
>>              write(wr_desc[dir][ord], &curr, sizeof(char));
>>              
>>      }
>>      close(rd_desc[0][ord]); close(rd_desc[1][ord]);
>>      close(wr_desc[0][ord]); close(wr_desc[1][ord]);
>>      exit(0);
>>}
>>
>>int main(){
>>      for (int i = 0; i < 6; i++)
>>              for (int dir = 0; dir < 2; dir++)
>>                      mkfifo(fifos[dir][i], 0600);
>>
>>      srandom(getpid());
>>      firstPlayer = random() % 6;
>>      skipPlayer = random() % 6;
>>      printf("Player %d is the 'skipper'\n", skipPlayer + 1);
>>
>>      for (int k = 0; k < 6; k++){
>>              id[k] = fork();
>>              if (id[k] == -1){
>>                      perror("Error on fork");
>>                      exit(1);
>>              }
>>              if (id[k] == 0)
>>                      childLoop(k);
>>      }
>>
>>      for (int i = 0; i < 6; i++)
>>              wait(NULL);
>>      
>>      for (int i = 0; i < 6; i++)
>>        for (int dir = 0; dir < 2; dir++)
>>            unlink(fifos[dir][i]);
>>
>>      return 0;
>>}
>>```
>

>[!todo]- 11. Write a program that receives as command line arguments any number of strings. For each argument, it creates a new process that launches a C or Shell program that checks if the argument is a prime number, then it returns that number as int, if it's a number not prime it returns zero, if it's a string it returns the length of the string, sending these numbers to the main program using a pipe. The main program receives these numbers, prints them and computes their sum.
>
>>[!code]-
>>```c
>>```
>

### Horea 
>[!done]- 6. Create a C program that generates N random integers (N given at the command line). It then creates a child, sends the numbers via pipe. The child calculates the average and sends the result back.
>
>>[!code]-
>>```c
>>#include <stdio.h>
>>#include <stdlib.h>
>>#include <sys/wait.h>
>>#include <unistd.h>
>>#include <time.h>
>>
>>int main(int argc, char** argv){
>>      if (argc != 2){
>>              perror("Please enter exactly one argument");
>>              exit(1);
>>      }
>>
>>      int n = atoi(argv[1]);
>>      int p2c[2]; pipe(p2c);
>>      int c2p[2]; pipe(c2p);
>>      int id = fork();
>>      if (id == -1){
>>              perror("Error on fork\n");
>>              exit(1);
>>      }
>>      if (id == 0){
>>              close(p2c[1]); close(c2p[0]);
>>              int sum = 0;
>>              for (int i = 0; i < n; i++){
>>                      int val;
>>                      read(p2c[0], &val, sizeof(int));
>>                      sum += val;
>>              }
>>              close(p2c[0]);
>>              sum /= n; //don't feel like bothering w floats
>>              write(c2p[1], &sum, sizeof(int));
>>              close(c2p[1]);
>>              exit(0);
>>      }
>>      close(p2c[0]); close(c2p[1]);
>>      srandom(time(0));
>>      for (int i = 0; i < n; i++){
>>              int num = random() % 100;
>>              printf("Iteration %d: Randomly generated value: %d\n", i, num);
>>              write(p2c[1], &num, sizeof(int));
>>      }
>>      close(p2c[1]);
>>      int avg;
>>      read(c2p[0], &avg, sizeof(int));
>>      printf("The average of the randomly generated values is: %d\n", avg);
>>      wait(NULL);
>>
>>      return 0;
>>}
>>```

>[!done]- 7. Write a C program that creates two child processes. The two child processes will alternate sending random integers between 1 and 10 (inclusively) to one another until one of them sends the number 10. Print messages as the numbers are sent.
>
>Sol 1 (misread the problem statement)
>>[!code]-
>>```c
>>#include <stdio.h>
>>#include <time.h>
>>#include <sys/wait.h>
>>#include <unistd.h>
>>#include <stdlib.h>
>>
>>int main(){
>>      int p2c[2], c2p[2];
>>    pipe(p2c); pipe(c2p);
>>   
>>    //srandom(time(0));
>>      int id = fork();
>>      if (id == -1){
>>              perror("Error on fork.");
>>              exit(1);
>>      }
>>
>>
>>      if (id == 0){
>>              srandom(time(0) ^ getpid());
>>              close(p2c[1]); close(c2p[0]);
>>              int num = -1;
>>              while (num != 10){
>>                      read(p2c[0], &num, sizeof(int));
>>                      printf("Child receives %d.\n", num);
>>                      if (num == 10)
>>                              break;
>>                      num = random() % 10 + 1;
>>                      printf("Child sends %d.\n", num);
>>                      write(c2p[1], &num, sizeof(int));
>>              }
>>              close(p2c[0]); close(c2p[1]);
>>              exit(0);
>>      }
>>      close(p2c[0]); close(c2p[1]);
>>      srandom(time(0));
>>      //parent starts the game
>>      int num = random() % 10 + 1;
>>      write(p2c[1], &num, sizeof(int));
>>      printf("Parent sends %d.\n", num);
>>      while (num != 10){
>>              read(c2p[0], &num, sizeof(int));
>>              printf("Parent receives %d.\n", num);
>>              if (num == 10)
>>                      break;
>>              num = random() % 10 + 1;
>>              printf("Parent sends %d.\n", num);
>>              write(p2c[1], &num, sizeof(int));
>>      }
>>      close(p2c[1]); close(c2p[0]);
>>      wait(NULL);
>>
>>      return 0;
>>}
>>```
>
>Actual solution
>>[!code]-
>>```c
>>#include <stdio.h>
>>#include <time.h>
>>#include <sys/wait.h>
>>#include <unistd.h>
>>#include <stdlib.h>
>>
>>void play(int rd_desc, int wr_desc){
>>      int nr = -1;
>>      int id = getpid() - getppid();
>>      while (nr != 10){
>>              read(rd_desc, &nr, sizeof(int));
>>              printf("Child %d reads %d.\n", id, nr);
>>              if (nr == 10)
>>                      return;
>>              nr = random() % 10 + 1;
>>              printf("Child %d writes %d.\n", id, nr);
>>              write(wr_desc, &nr, sizeof(int));
>>      }
>>}
>>
>>int main(){
>>      int a2b[2], b2a[2];
>>    pipe(a2b); pipe(b2a);
>>   
>>      int pid_a = fork();
>>      if (pid_a == -1){
>>              perror("Error on fork.");
>>              exit(1);
>>      } 
>>      if (pid_a == 0) {
>>              close(a2b[0]); close(b2a[1]);
>>              srandom(getpid());              
>>              //first child starts the game
>>              int nr = random() % 10 + 1;
>>              printf("Starting the game...\nChild 1 sends %d.\n", nr);
>>              write(a2b[1], &nr, sizeof(int));
>>              if (nr != 10)
>>                      play(b2a[0], a2b[1]);
>>              close(b2a[0]); close(a2b[1]);
>>              exit(0);
>>      }
>>      int pid_b = fork();
>>      if (pid_b == -1){
>>              perror("Error on fork.");
>>              exit(1);
>>      }
>>      if (pid_b == 0){
>>              close(a2b[1]); close(b2a[0]);
>>              srandom(getpid());
>>              play(a2b[0], b2a[1]);
>>              close(a2b[0]); close(b2a[1]);
>>              exit(0);
>>      }
>>      
>>
>>      close(a2b[0]); close(a2b[1]); close(b2a[0]); close(b2a[1]);
>>      wait(NULL); wait(NULL);
>>      return 0;
>>}
>>```
>

>[!done]- 7a. Write two C programs that communicate via fifo. The two processes will alternate sending random integers between 1 and 10 (inclusively) to one another until one of them sends the number 10. Print messages as the numbers are sent. One of the two processes must be responsible for creating and deleting the fifos.
>
>>[!code]-
>>```c
>>#include <stdio.h>
>>#include <time.h>
>>#include <sys/wait.h>
>>#include <unistd.h>
>>#include <stdlib.h>
>>#include <fcntl.h>
>>
>>void play(int rd_desc, int wr_desc){
>>     int nr = -1;
>>     int id = getpid() - getppid();
>>     while (nr != 10){
>>             read(rd_desc, &nr, sizeof(int));
>>             printf("Child %d reads %d.\n", id, nr);
>>             if (nr == 10)
>>                     return;
>>             nr = random() % 10 + 1;
>>             printf("Child %d writes %d.\n", id, nr);
>>             write(wr_desc, &nr, sizeof(int));
>>     }
>>}
>>
>>int main(){
>>     int pid_a = fork();
>>     if (pid_a == -1){
>>             perror("Error on fork.");
>>             exit(1);
>>     } 
>>     if (pid_a == 0) {
>>             srandom(getpid());
>>                       int a2b = open("f2s", O_WRONLY);
>>                       int b2a = open("s2f", O_RDONLY);
>>             //first child starts the game
>>             int nr = random() % 10 + 1;
>>             printf("Starting the game...\nChild 1 sends %d.\n", nr);
>>             write(a2b, &nr, sizeof(int));
>>             if (nr != 10)
>>                     play(b2a, a2b);
>>             exit(0);
>>     }
>>     int pid_b = fork();
>>     if (pid_b == -1){
>>             perror("Error on fork.");
>>             exit(1);
>>     }
>>     if (pid_b == 0){
>>             srandom(getpid());
>>                       int a2b = open("f2s", O_RDONLY);
>>                       int b2a = open("s2f", O_WRONLY);
>>             play(a2b, b2a);
>>             exit(0);
>>     }
>>     
>>
>>     wait(NULL); wait(NULL);
>>     return 0;
>>}
>>```
>

>[!done]- 8. Write 2 C programs, A and B. A receives however many command line arguments and sends them to process B. Process B converts all lowercase letters from the received arguments to uppercase arguments and sends the results back to A. A reads the results, concatenates them and prints.
>
>>[!code]- a.c
>>```c
>>#include <stdio.h>
>>#include <fcntl.h>
>>#include <unistd.h>
>>#include <string.h>
>>#include <stdlib.h>
>>int main(int argc, char** argv){
>>	int a2b = open("a2b", O_WRONLY);
>>	int b2a = open("b2a", O_RDONLY);
>>
>>	int n = argc - 1;
>>	int total_length = 0;
>>	write(a2b, &n, sizeof(int));
>>	for (int i = 1; i < argc; i++){
>>		int l = strlen(argv[i]);
>>		total_length += l + 1;
>>		char * w = malloc((l+1)*sizeof(char));
>>		strcpy(w, argv[i]);
>>		//printf("%s\n", w);
>>		write(a2b, &l, sizeof(int));
>>		write(a2b, w, l * sizeof(char)); 
>>		free(w);
>>	}
>>	close(a2b);
>>
>>	char * result = malloc((total_length + 1) * sizeof(char));
>>	
>>	int current_length = 0;
>>	for (int i = 1; i < argc; i++){
>>		const int l = strlen(argv[i]);
>>		char * w = malloc((l+2) * sizeof(char));
>>		read(b2a, w, l * sizeof(char));
>>		w[l]=' '; w[l + 1] = '\0';
>>		//printf("%s\n", w);
>>		strcpy(result + current_length, w);
>>		free(w);
>>		current_length += l + 1;
>>	}
>>	close(b2a);
>>	printf("%s\n", result);
>>
>>	free(result);
>>}
>>```
>
>>[!code]- b.c
>>```c
>>#include <fcntl.h>
>>#include <unistd.h>
>>#include <stdlib.h>
>>int main(){
>>	int a2b = open("a2b", O_RDONLY);
>>	int b2a = open("b2a", O_WRONLY);
>>
>>	int n;
>>	read(a2b, &n, sizeof(int));
>>	for (int i = 0; i < n; i++){
>>		int l;
>>		read(a2b, &l, sizeof(int));
>>		char * w = malloc(sizeof(char) * (l+1));
>>		read(a2b, w, sizeof(char) * l);
>>		for (int j = 0; j < l; j++)
>>			if ('a' <= w[j] && w[j] <= 'z')
>>				w[j] += 'A' - 'a';
>>		write(b2a, w, sizeof(char) * l);
>>		free(w);	
>>	}
>>	close(a2b); close(b2a);
>>
>>	return 0;
>>}
>>```

>[!todo]- 9. Write two C programs that communicate via fifo. Program A is responsible for creating/deleting the fifo. Program A reads commands from the standard input, executes them and sends the output to program B. Program B keeps reading from the fifo and displays whatever it receives at the standard output. This continues until program A receives the "stop" command.
>
>>[!code]
>>```c
>>```

>[!done]- 10. Create two processes A and B. A generates a random number n between 50 and 200. If it is even, it sends it to B, if it is odd it sends n+1 to B. B receives the number and divides it by 2 and sends it back to A. The process repeats until n is smaller than 5. The processes will print the value of n at each step
>
>
>>[!code]- a.c
>>```c
>>#include <stdio.h>
>>#include <time.h>
>>#include <sys/stat.h>
>>#include <sys/types.h>
>>#include <unistd.h>
>>#include <stdlib.h>
>>#include <fcntl.h>
>>
>>int main(){
>>      mkfifo("a2b", 0600);
>>      mkfifo("b2a", 0600);
>>
>>      int a2b = open("a2b", O_WRONLY);
>>      int b2a = open("b2a", O_RDONLY);
>>
>>      srandom(time(0));
>>      int n = random() % 201;
>>      if (n < 50)
>>              n += 50;
>>      while (n > 5){
>>              if (n % 2)
>>                      n++;
>>              write(a2b, &n, sizeof(int));
>>              printf("A writes %d\n", n);
>>              read(b2a, &n, sizeof(int));
>>              printf("A reads %d\n", n);
>>      }
>>      close(a2b); close(b2a);
>>      unlink("a2b");
>>      unlink("b2a");
>>      return 0;
>>
>>}
>>```
>
>>[!code]- b.c
>>```c
>>#include <stdio.h>
>>#include <time.h>
>>#include <fcntl.h>
>>#include <unistd.h>
>>#include <stdlib.h>
>>
>>int main(){
>>      int a2b = open("a2b", O_RDONLY);
>>      int b2a = open("b2a", O_WRONLY);
>>
>>      srandom(time(0));
>>      int n = 201;
>>      while (n > 5){
>>              read(a2b, &n, sizeof(int));
>>              printf("B reads %d\n", n);
>>              n /= 2;
>>              write(b2a, &n, sizeof(int));
>>              printf("B writes %d\n", n);
>>      }
>>      close(a2b); close(b2a);
>>      return 0;
>>
>>}
>>```

>[!todo]- 11. Create two processes A and B. A creates a shared memory segment. A then keeps reading strings from the standard input and places whatever it reads in the shared memory segment (replacing previous data). Process B, on each run, reads the data from the shared memory segment and counts the number of vowels. Process A, upon receiving a SIGINT, deletes the shared memory segment.
>
>>[!code]
>>```c
>>```

>[!todo]- 12. Write a C program that receives any number of command-line arguments. For each argument, create a child process that attempts to run the argument using one of the exec functions. If the exec function call fails, the child process sends a message to the parent, obeying the template “Unable to run \[argument\] since it is not a valid command.”, where \[argument\] is the actual value of the argument. The parent will read the message from the pipe and display it together with the PID of the child process that sent the message. (Note: In the case where the child process successfully runs the command with exec, the parent does not need to print anything.) selected.
>
>>[!code]-
>>```c
>>```
>

>[!todo]- 13. Write a simple one-to-one chat program that communicates via FIFO. The program will receive as arguments the names/paths of two FIFOs, one for incoming messages and one for outgoing messages. The program must create a process that awaits messages on the incoming FIFO and displays them as they are received. In a separate process, the program will wait for the user to write messages from the keyboard and will write them in the outgoing FIFO. 
>
>>[!code]-
>>```c
>>```
>

>[!todo]- 14. Write a C program (we'll refer to it as A) that creates a child process B. Process B generates one random number N between 100 and 1000. Process A keeps generating and sending random numbers between 50 and 1050 to B until the absolute difference between the number generated by A and the number generated by B is less than 50. B prints the generated numbers and all the received numbers. A will print at the end the number of numbers generated until the stop condition was met.
>
>>[!code]
>>```c
>>```

>[!todo]- 13. Using PIPE channels create and implement the following scenario:  
Process A reads N integer numbers from the keyboard and sends them another process named B. Process B will add a random number, between 2 and 5, to each received number from process A and will send them to another process named C. The process C will add all the received numbers and will send the result back to process A. All processes will print a debug message before sending and after receiving a number.
>
>>[!code]-
>>```c
>>```

## Threads 
### Calin
>[!done]- 2. Write a program that creates 4 threads and had 3 global variables v5, v2, v3.
Each thread generates a random number and:
>- if the number is multiple of 2 increments v2
>- if the number is multiple of 3, increments v3
>- if the number is multiple of 5 increments v5
>The number can be a multiple of more numbers (ex. for 10 we will increment both V2 and V5)
>
>Threads print the generated numbers and stop when 30 numbers have been generated.
>
>The main program prints the 3 global variables.  
>!!! Use mutex for synchronisation.
>
>>[!code]-
>>```c
>>#include <stdio.h>
>>#include <pthread.h>
>>#include <time.h>
>>#include <stdlib.h>
>>
>>int v2, v3, v5, generated=0;
>>pthread_mutex_t m, m2, m3, m5; //generate + increments
>>
>>void* threadFunc(void* arg){
>>    (void)arg;
>>    while(1){
>>      pthread_mutex_lock(&m);
>>              if (generated == 30){
>>                      pthread_mutex_unlock(&m);
>>                      return NULL;
>>      }
>>      generated++;
>>      int newNumber = abs((int)random()) % 200;
>>      printf("%d\t%d:\t%d %d %d\n", generated, newNumber, newNumber%2==0, newNumber%3==0, newNumber%5==0);
>>      pthread_mutex_unlock(&m);
>>      if (newNumber % 2 == 0){
>>              pthread_mutex_lock(&m2);
>>                      v2++;
>>                      pthread_mutex_unlock(&m2);
>>      }
>>      if (newNumber % 3 == 0){
>>                      pthread_mutex_lock(&m3);
>>                      v3++;
>>                      pthread_mutex_unlock(&m3);
>>      }
>>      if (newNumber % 5 == 0){
>>                      pthread_mutex_lock(&m5);
>>                      v5++;
>>                      pthread_mutex_unlock(&m5);
>>      }
>>    }
>>    return NULL;
>>}
>>
>>int main(){
>>    srand(time(0));
>>    pthread_t thr[4];
>>    for (int i = 0; i < 4; i++)
>>              pthread_create(&thr[i], NULL, threadFunc, NULL);
>>    for (int i = 0; i < 4; i++)
>>              pthread_join(thr[i], NULL);
>>    printf("%d - %d - %d\n", v2, v3, v5);
>>      return 0;
>>}
>>```

>[!done]- 3. Write a program that creates 20 threads, giving each thread a string as parameter. Each thread will count and add to the global variables v and n as follows: the number of vowels contained by the string added to v, and the number of digits contained in the string added to n. Synchronise threads using mutex and check for memory leaks.
>
>>[!code]
>>```c
>>#include <stdio.h>
>>#include <pthread.h>
>>#include <time.h>
>>#include <stdlib.h>
>>#include <string.h>
>>
>>
>>int v, n;
>>pthread_mutex_t mv, mn;
>>
>>char* generateString(){
>>	int l = abs((int)random()) % 20 + 5;
>>	char* w = malloc((l+1) * sizeof(char));
>>	int vs = 0, ns = 0;
>>	for (int i = 0; i < l; i++){
>>		// one in eight chance of a digit
>>		int digit = (random() % 8 == 0);
>>		if (digit){
>>			ns++;
>>			w[i] = '0' + (abs((int)random())%10);
>>		}
>>		else{
>>			w[i] = 'a' + (abs((int)random())%26);
>>			if (strchr("aeiou", w[i]))
>>				vs++;
>>		}
>>	}
>>	w[l]='\0';
>>	printf("V: %d - N: %d - S: %s\n", vs, ns, w);
>>	return w;
>>}
>>
>>void* threadFunc(void* arg){
>>	char* s = (char*)arg;
>>	for (int i = 0; i < (int)strlen(s); i++)
>>		if ('0' <= s[i] && s[i] <= '9'){
>>			pthread_mutex_lock(&mn);
>>			n++;
>>			pthread_mutex_unlock(&mn);
>>		}
>>		else if (strchr("aeoiu", s[i])){
>>			pthread_mutex_lock(&mv);
>>			v++;
>>			pthread_mutex_unlock(&mv);
>>		}
>>
>>	return NULL;
>>}
>>
>>int main(){
>>	srand(time(0));
>>	pthread_t thr[20];
>>	for (int i = 0; i < 20; i++){
>>		pthread_create(&thr[i], NULL, threadFunc, (void*)generateString());
>>	}
>>	for (int i = 0; i < 20; i++)
>>		pthread_join(thr[i], NULL);
>>	printf("%d - %d\n", v, n);
>>	return 0;
>>}
>>
>>```

>[!done]- 4. A C program receives command line args pairs of numbers, and creates for each pair a thread that checks is the two numbers are relatively prime (gcd=1), incrementing a global variable. The program prints at the end how many relatively prime pairs have been found and the respective pairs.
>
>>[!code]
>>```c
>>#include <stdio.h>
>>#include <pthread.h>
>>#include <stdlib.h>
>>#include <sys/param.h>
>>
>>int relPrimes;
>>pthread_mutex_t m;
>>
>>struct pair{
>>	int t1, t2;
>>};
>>
>>void* threadFunc(void* arg){
>>	struct pair* p = (struct pair*)(arg);
>>	for (int i = 2; i <= MIN(p->t1, p->t2); i++)
>>		if (p->t1 % i == 0 && p->t2 % i == 0){
>>			free(p);
>>			return NULL;
>>		}
>>	//free(p);
>>	pthread_mutex_lock(&m);
>>	relPrimes++;
>>	pthread_mutex_unlock(&m);
>>	return p;
>>
>>}
>>
>>int main(int argc, char* argv[]){
>>	const int pairCount = argc / 2;
>>	pthread_t thr[pairCount];
>>	for (int i = 0; i < pairCount; i++){
>>	  struct pair* p = malloc(sizeof(struct pair));
>>		p->t1 = atoi(argv[2*i+1]); p->t2=atoi(argv[2*i+2]);
>>		pthread_create(&thr[i], NULL, threadFunc, (void*)p);
>>	}
>>	
>>	struct pair* ret[pairCount];// = NULL; 
>>	for (int i = 0; i < pairCount; i++){
>>			pthread_join(thr[i], (void**)&ret[i]);
>>	}
>>	printf("%d\n", relPrimes);
>>	
>>	for (int i = 0; i < pairCount; i++)
>>		if (ret[i] != NULL){
>>			printf("%d - %d\n", ret[i]->t1, ret[i]->t2);
>>			free(ret[i]);
>>		}
>>	//free(ret);
>>	
>>	return 0;
>>}
>>
>>```

>[!todo]- 5. Write a program that computes the sum of the elements of a matix using threads. Try to come up with a most efficient solution.
>
>>[!code]
>>```c
>>```

>[!done]- 6. Write a C program that reads strings (words) from stdin until the word stop is given. For each string, the program will launch a thread that receives this string as argument and computes the number of vowels in the string. The thread will send this result as a return value to the main thread. The main thread will print each string and their number of vowels, as well as the total sum. Solve the problem without using global variables.
>
>>[!code]- 
>>```c
>>#include <stdio.h>
>>#include <pthread.h>
>>#include <stdlib.h>
>>#include <string.h>
>>
>>struct ret{
>>	char* w;
>>	int cnt;
>>};
>>
>>void* threadFunc(void* arg){
>>	char* w = (char*)arg;
>>	int cnt = 0;
>>	
>>	for (int i = 0; i < (int)strlen(w); i++)
>>		if (strchr("aeiou", w[i]))
>>			cnt++;
>>
>>	struct ret* val = malloc(sizeof(struct ret));
>>	val->w = w;
>>	val->cnt = cnt;
>>	return (void*)val;
>>}
>>
>>int main(){
>>	pthread_t t[100];
>>	int wordCount = 0;
>>	while (1){
>>		char*w = malloc(30 * sizeof(char));
>>		fgets(w,25, stdin);
>>		w[strlen(w)-1]='\0';
>>		if (strcmp(w, "stop")==0){
>>			free(w);
>>			break;
>>		}
>>		pthread_create(&t[wordCount], NULL, threadFunc, (void*)w);
>>		wordCount++;
>>	}
>>	int sum = 0;
>>	struct ret** vals = malloc(sizeof(struct ret*)*wordCount);
>>	for (int i = 0; i < wordCount; i++){
>>		pthread_join(t[i], (void**)&vals[i]);
>>		sum += vals[i]->cnt;
>>	}
>>	printf("%d\n", sum);
>>	for (int i = 0; i < wordCount; i++){
>>		printf("%s - %d\n", vals[i]->w, vals[i]->cnt);
>>		free(vals[i]->w); free(vals[i]);
>>  }
>>	free(vals);
>>	return 0;
>>}
>>
>>```

>[!done]- 7. Write a C program that creates 2 threads. Each one will print their thread ID, but always alternatively.
>
>>[!code]
>>```c
>>#include <stdio.h>
>>#include <pthread.h>
>>#include <unistd.h>
>>
>>int turn;
>>pthread_mutex_t m;
>>
>>void* threadFunc(void* arg){
>>	int flag = *(int*)arg;
>>	while(1){
>>		int b = 0;
>>		pthread_mutex_lock(&m);
>>		if (turn == flag) {
>>			printf("%ld\n", pthread_self());
>>			turn ^= 1; b = 1;
>>		}
>>		pthread_mutex_unlock(&m);
>>		if (b)
>>			sleep(1);
>>	}
>>	return NULL;
>>}
>>
>>int main()
>>{
>>	pthread_t t[2];
>>	int flag0=0, flag1=1;
>>	pthread_create(&t[0], NULL, threadFunc, &flag0);
>>	pthread_create(&t[1], NULL, threadFunc, &flag1);
>>
>>	pthread_join(t[1], NULL);
>>	pthread_join(t[0], NULL);
>>
>>	return 0;
>>}
>>
>>```

>[!todo]- 8. Write a C program using threads and mutexes that results in a deadlock.
>
>>[!code]
>>```c
>>```

>[!todo]-
>
>>[!code]
>>```c
>>```

>[!todo]-
>
>>[!code]
>>```c
>>```

>[!todo]-
>
>>[!code]
>>```c
>>```

>[!todo]-
>
>>[!code]
>>```c
>>```

>[!todo]-
>
>>[!code]
>>```c
>>```

>[!todo]-
>
>>[!code]
>>```c
>>```

### Horea
>[!done]- 15. Write a program that receives strings of characters as command line arguments. For each string the program creates a thread which calculates the number of digits, the number of leters and the number of special characters (anything other than a letter or digit). The main program waits for the threads to terminate and prints the total results (total number of digits, letters and special characters across all the received command line arguments) and terminates. Use efficient synchronization. Do not use global variables
>
>>[!code]
>>```c
>>#include <stdio.h>
>>#include <pthread.h>
>>#include <string.h>
>>#include <unistd.h>
>>#include <stdlib.h>
>>
>>struct counter{
>>	int letter, digit, special;
>>};
>>
>>void* thrFunc(void* arg){
>>	char* w = (char*)arg;
>>	struct counter* ret = malloc(sizeof(struct counter));
>>	ret->letter = 0; ret->digit = 0; ret->special = 0;
>>	for (int i = 0; i < (int)strlen(w); i++)
>>		if ('0' <= w[i] && w[i] <= '9')
>>			ret->digit++;
>>		else if ('a' <= w[i] && w[i] <= 'z')
>>			ret->letter++;
>>		else
>>			ret->special++;
>>	return (void*)ret;
>>}
>>
>>int main(int argc, char* argv[]){
>>	pthread_t thr[argc+2];
>>	for (int i = 1; i < argc; i++)
>>		pthread_create(&thr[i], NULL, thrFunc, (void*) argv[i]);
>>
>>	int letters = 0, specials = 0, digits = 0;
>>	struct counter* ret = NULL;
>>	for (int i = 1; i < argc; i++){
>>		pthread_join(thr[i], (void**)&ret);
>>  	letters += ret->letter;
>>		specials += ret->special;
>>		digits += ret->digit;
>>		free(ret);
>>	}
>>	printf("Letters: %d\nDigits: %d\nSpecial Characters: %d\n", letters, digits, specials);
>>	
>>	return 0;
>>}
>>```

>[!done]-  16. Write a C program that receives integers as command line argument. The program will keep a frequency vector for all digits. The program will create a thread for each argument that counts the number of occurences of each digit and adds the result to the frequency vector. Use efficient synchronization.
>
>>[!code]
>>```c
>>#include <stdio.h>
>>#include <pthread.h>
>>#include <string.h>
>>#include <unistd.h>
>>#include <stdlib.h>
>>
>>struct counter{
>>	int d[10];
>>};
>>
>>void* thrFunc(void* arg){
>>	int n = atoi((char*)arg);
>>	struct counter* ret = malloc(sizeof(struct counter));
>>	for (int i = 0; i < 10; i++)
>>		ret->d[i] = 0;
>>
>>	if (!n)
>>		ret->d[0]++;
>>	while(n){
>>		ret->d[n%10]++;
>>		n /= 10;
>>	}
>>
>>	return (void*)ret;
>>}
>>
>>int main(int argc, char* argv[]){
>>	pthread_t thr[argc+2];
>>	for (int i = 1; i < argc; i++)
>>		pthread_create(&thr[i], NULL, thrFunc, (void*) argv[i]);
>>
>>	struct counter total;
>>	for (int i = 0; i < 10; i++)
>>		total.d[i]=0;
>>	struct counter* ret = NULL;
>>	for (int i = 1; i < argc; i++){
>>		pthread_join(thr[i], (void**)&ret);
>>		for (int j = 0; j < 10; j++)
>>			total.d[j] += ret->d[j];
>>		free(ret);
>>	}
>>	for (int i = 0; i < 10; i++)
>>		printf("%d: %d\n", i, total.d[i]);
>>	return 0;
>>}
>>
>>```

>[!done]- 17. Write a C program that reads a number N and creates 2 threads. One of the threads will generate an even number and will append it to an array that is passed as a parameter to the thread. The other thread will do the same, but using odd numbers. Implement a synchronization between the two threads so that they alternate in appending numbers to the array, until they reach the maximum length N.
>
>>[!code]
>>```c
>>#include <stdio.h>
>>#include <pthread.h>
>>#include <stdlib.h>
>>
>>int n, appended;
>>pthread_mutex_t m;
>>
>>void* oddFunc(void* arg){
>>	int* arr = (int*) arg;
>>	while (1){
>>    int num = abs((int)random()) % 100;
>>    if (num % 2 == 0)
>>      num++;
>>
>>		pthread_mutex_lock(&m);
>>		if (appended == n){
>>			pthread_mutex_unlock(&m);
>>			break;
>>		}
>>		if (appended % 2){
>>			arr[appended] = num;
>>			appended++;
>>		}
>>		pthread_mutex_unlock(&m);
>>		
>>	}
>>
>>	return NULL;
>>}
>>
>>void* evenFunc(void* arg){
>>  int* arr = (int*) arg;
>>  while (1){
>>    int num = abs((int)random()) % 100;
>>    if (num % 2)
>>      num++;
>>
>>    pthread_mutex_lock(&m);
>>    if (appended == n){
>>      pthread_mutex_unlock(&m);
>>      break;
>>    }
>>    if (appended % 2 == 0){
>>      arr[appended] = num;
>>      appended++;
>>    }
>>    pthread_mutex_unlock(&m);
>>
>>  }
>>
>>  return NULL;
>>}
>>
>>
>>int main()
>>{
>>	printf("Enter maximum array length: ");
>>	scanf("%d", &n);
>>
>>	int* arr = malloc(sizeof(int) * (n+1));
>>
>>	pthread_t odd, even;
>>	pthread_create(&odd, NULL, oddFunc, (void*)arr);
>>	pthread_create(&even, NULL, evenFunc, (void*)arr);
>>
>>	pthread_join(odd, NULL);
>>	pthread_join(even, NULL);
>>	for (int i = 0; i < n; i++)
>>		printf("%d ", arr[i]);
>>	free(arr);
>>	printf("\n");
>>	return 0;
>>}
>>
>>```

>[!done]- 18. Create a C program that converts all lowecase letters from the command line arguments to uppercase letters and prints the result. Use a thread for each given argument.
>
>>[!code]
>>```c
>>#include <stdio.h>
>>#include <pthread.h>
>>#include <string.h>
>>
>>void* thrFunc(void* arg){
>>	char* w = (char*) arg;
>>	for (int i = 0; i < (int)strlen(w); i++)
>>		if ('a' <= w[i] && w[i] <= 'z')
>>			w[i] += 'A'-'a';
>>
>>	return NULL;
>>}
>>
>>int main(int argc, char* argv[]){
>>	pthread_t thr[argc+1];
>>	for (int i = 1; i < argc; i++)
>>		pthread_create(&thr[i], NULL, thrFunc, (void*)argv[i]);
>>	
>>	for (int i = 1; i < argc; i++)
>>		pthread_join(thr[i], NULL);
>>
>>	for (int i = 1; i < argc; i++)
>>		printf("%s ", argv[i]);
>>	printf("\n");
>>	return 0;
>>}
>>
>>```

>[!done]- 19. Create a C program that takes one integer N as a command line argument, and then reads N integers from the keyboard and stores them in an array. It then calculates the sum of all the read integers using threads that obey the hierarchy presented in the image below. For any given N, the array has to be padded with extra integers with value 0 to ensure that it always contains a number of elements equal to a power of 2 (let this number be M). The required number of threads will be M - 1, let each thread have and ID from 1 to M - 1. As per the image, threads with ID >= M / 2 will calculate the sum of 2 numbers on consecutive positions in the array. Threads with an ID < M / 2 must wait for 2 threads to finish and then they will add the results produced by those two threads.
>![[Pasted image 20250531171250.png]]
>>[!code]
>>```c
>>#include <stdio.h>
>>#include <pthread.h>
>>#include <unistd.h>
>>#include <stdlib.h>
>>
>>struct leafArg{
>>	int l, r;
>>};
>>struct intArg{
>>	pthread_t l, r;
>>};
>>
>>void* leaf(void*arg){
>>	struct leafArg* a = (struct leafArg*)arg;
>>	int l = a->l; int r = a->r;
>>	free(a);
>>	
>>	int* sum = malloc(sizeof(int));
>>	*sum = l + r;
>>	return (void*)sum;
>>}
>>
>>void* internal(void* arg){
>>	struct intArg* a = (struct intArg*)arg;
>>	pthread_t l = a->l, r = a->r;
>>	free(a);
>>	int* lsum, *rsum;
>>	pthread_join(l, (void**)&lsum);
>>	pthread_join(r, (void**)&rsum);
>>	int*sum = malloc(sizeof(int));
>>	*sum = *lsum + *rsum;
>>	free(lsum); free(rsum);
>>	return (void*)sum;
>>}
>>
>>
>>int main(int argc, char* argv[]){
>>	if (argc != 2){
>>		perror("Please enter one argument only\n");
>>		return 1;
>>	}
>>
>>	int N = atoi(argv[1]);
>>	int M = 1;
>>	while (M < N)
>>		M *= 2;
>>
>>	int num[M+2];
>>	for (int i = N; i <= M; i++)
>>		num[i] = 0;
>>
>>	printf("Enter %d numbers:\n", N);
>>	for (int i = 0; i < N; i++)
>>		scanf("%d", num+i);
>>
>>	pthread_t thr[M+2];
>>	for (int i = M / 2, j = 0; i < M; i++, j += 2){
>>		struct leafArg* p = malloc(sizeof(struct leafArg));
>>		p->l = num[j]; p->r = num[j+1];
>>		pthread_create(&thr[i], NULL, leaf, (void*)p);
>>	}
>>	for (int i = M / 2 - 1; i; i--){
>>		struct intArg* p = malloc(sizeof(struct intArg));
>>		p->l = thr[2 * i]; p->r = thr[2 * i + 1];
>>		pthread_create(&thr[i], NULL, internal, (void*)p);
>>	}
>>
>>	int* sum;
>>	pthread_join(thr[1], (void**)&sum);
>>	printf("The sum is: %d\n", *sum);
>>	free(sum);
>>	return 0;
>>}
>>
>>```

>[!done]- 20. Write a C program that takes as command line arguments 2 numbers: N and M. The program will simulate a thread race that have to pass through M checkpoints. Through each checkpoint the threads must pass one at a time (no 2 threads can be inside the same checkpoint). Each thread that enters a checkpoint will wait between 100 and 200 milliseconds (usleep(100000) makes a thread or process wait for 100 milliseconds) and will print a message indicating the thread number and the checkpoint number, then it will exit the checkpoint. Ensure that no thread will try to pass through a checkpoint until all threads have been created.
>
>>[!code]
>>```c
>>#include <pthread.h>
>>#include <stdio.h>
>>#include <semaphore.h>
>>#include <unistd.h>
>>#include <stdlib.h>
>>
>>pthread_barrier_t b;
>>
>>int M;
>>
>>struct s{
>>	int ord;
>>	sem_t* checkpoint;
>>};
>>
>>pthread_mutex_t mtx; //mutex for printing
>>
>>void* runner(void* arg){
>>	struct s* p = (struct s*)arg;
>>	int threadNumber = p->ord;
>>	sem_t* checkpoint = p->checkpoint;
>>	free(p);
>>	pthread_barrier_wait(&b);
>>	for (int i = 0; i < M; i++){
>>		sem_wait(checkpoint+i);
>>		pthread_mutex_lock(&mtx);
>>		printf("Runner %d arrived at checkpoint %d\n",threadNumber,i+1);
>>		pthread_mutex_unlock(&mtx);
>>		usleep(100000+abs((int)random())%100000);
>>		sem_post(checkpoint+i);
>>	}
>>
>>	return NULL;
>>}
>>
>>int main(int argc, char* argv[]){
>>	if (argc != 3){
>>		perror("Please enter 2 integers only");
>>		return 0;
>>	}
>>	
>>	const int N = atoi(argv[1]);
>>	M = atoi(argv[2]);
>>
>>	pthread_barrier_init(&b, 0, N);
>>	sem_t checkpoint[M+5];
>>	for (int i = 0; i < M; i++)
>>		sem_init(&checkpoint[i],0, 1);
>>
>>	pthread_t thr[N+5];
>>	for (int i = 0; i < N; i++){
>>		struct s* p = malloc(sizeof(struct s));
>>		p->ord = i + 1;
>>		p->checkpoint = checkpoint;
>>		pthread_create(&thr[i], NULL, runner, (void*)p);
>>	}
>>	for (int i = 0; i < N; i++)
>>		pthread_join(thr[i], NULL);
>>	
>>	pthread_barrier_destroy(&b);
>>	for (int i = 0; i < M; i++)
>>		sem_destroy(checkpoint+i);
>>	return 0;
>>}
>>
>>```

>[!done]- 21. Write a C program that creates 2^N threads that race to the finish (N is a command line argument). The threads must pass through N checkpoint. The checkpoint with number X will allow half as many threads to pass simultaneously than checkpoint number X - 1 (N >= X >=1). Checkpoint 0 (the first one) will allow 2^(N-1) to pass simultaneously through it.
>
>>[!code]
>>```c
>>#include <pthread.h>
>>#include <stdio.h>
>>#include <semaphore.h>
>>#include <unistd.h>
>>#include <stdlib.h>
>>
>>pthread_barrier_t b;
>>
>>int M;
>>
>>struct s{
>>	int ord;
>>	sem_t* checkpoint;
>>};
>>
>>pthread_mutex_t mtx; //mutex for printing
>>
>>void* runner(void* arg){
>>	struct s* p = (struct s*)arg;
>>	int threadNumber = p->ord;
>>	sem_t* checkpoint = p->checkpoint;
>>	free(p);
>>	pthread_barrier_wait(&b);
>>	for (int i = 0; i < M; i++){
>>		sem_wait(checkpoint+i);
>>		pthread_mutex_lock(&mtx);
>>		printf("Runner %d arrived at checkpoint %d\n",threadNumber,i+1);
>>		pthread_mutex_unlock(&mtx);
>>		usleep(600000+abs((int)random())%100000);
>>		sem_post(checkpoint+i);
>>	}
>>
>>	return NULL;
>>}
>>
>>int main(int argc, char* argv[]){
>>	if (argc != 2){
>>		perror("Please enter one integer only");
>>		return 0;
>>	}
>>	
>>	M = atoi(argv[1]);
>>	int N = 1;
>>	for (int i = 0; i < M; i++)
>>		N *= 2;
>>
>>	pthread_barrier_init(&b, 0, N);
>>	sem_t checkpoint[M+5];
>>	for (int i = M-1, pw = 1; i>=0; i--, pw *= 2)
>>		sem_init(&checkpoint[i],0, pw);
>>
>>	pthread_t thr[N+5];
>>	for (int i = 0; i < N; i++){
>>		struct s* p = malloc(sizeof(struct s));
>>		p->ord = i + 1;
>>		p->checkpoint = checkpoint;
>>		pthread_create(&thr[i], NULL, runner, (void*)p);
>>	}
>>	for (int i = 0; i < N; i++)
>>		pthread_join(thr[i], NULL);
>>	
>>	pthread_barrier_destroy(&b);
>>	for (int i = 0; i < M; i++)
>>		sem_destroy(checkpoint+i);
>>	return 0;
>>}
>>
>>```

>[!todo]- 22. Write a C program that creates 10 child processes and synchronizes their execution. Each process will sleep for 1 second and then exit. Time the execution of the processes. (If all goes well, the total time should be a little over 10 seconds).
>
>>[!code]
>>```c
>>```

>[!done]- 23. Write a C program that receives any number of strings as command line arguments. The program creates two child processes, which inherit the parent's command line arguments (ie. no need to send the arguments via pipe/fifo to the children for this problem). Each child process creates a thread for each of the command line arguments. Each thread created by the first child will extract the vowels from its argument and will append them to a string shared among the threads. Each thread created by the second child process will extract the digits from its argument and will add them to a sum shared among the threads. Both child processes wait for their respective threads to finish and send the result to the parent via pipe. The parent displays the results.
>
>>[!code]
>>```c
>>#include <stdio.h>
>>#include <pthread.h>
>>#include <sys/wait.h>
>>#include <unistd.h>
>>#include <fcntl.h>
>>#include <string.h>
>>#include <stdlib.h>
>>
>>int sum = 0, current;
>>char w[200];
>>pthread_mutex_t vm, dm;
>>
>>void* vowelThr(void* arg){
>>	char* word = (char*) arg;
>>	for (int i = 0; i < (int)strlen(word); i++)
>>		if (strchr("aeiou", word[i])){
>>			pthread_mutex_lock(&vm);
>>			w[current] = word[i];
>>			current++;
>>			pthread_mutex_unlock(&vm);
>>		}
>>	return NULL;
>>}
>>
>>void* digitThr(void* arg){
>>	char* word = (char*)arg;
>>	for (int i = 0; i < (int)strlen(word); i++)
>>		if ('0' <= word[i] && word[i] <= '9'){
>>			pthread_mutex_lock(&dm);
>>			sum += word[i] - '0';
>>			pthread_mutex_unlock(&dm);
>>		}
>>	return NULL;
>>}
>>
>>
>>int main(int argc, char* argv[]){
>>	int one2p[2], two2p[2]; //r-w
>>	pipe(one2p); pipe(two2p);
>>
>>	if (fork() == 0){ //vowels
>>		close(one2p[0]); 
>>		close(two2p[0]); close(two2p[1]);
>>		pthread_t thr[argc];
>>		for (int i = 1; i < argc; i++)
>>			pthread_create(&thr[i], NULL, vowelThr, (void*)argv[i]);
>>		for (int i = 1; i < argc; i++)
>>			pthread_join(thr[i], NULL);
>>		w[current] = '\0';
>>		write(one2p[1], &current, sizeof(int));
>>		write(one2p[1], w, sizeof(char) * current);
>>		close(one2p[1]);
>>		return 0;
>>	}
>>	if (fork() == 0){ //digits
>>		close(two2p[0]);
>>		close(one2p[0]); close(one2p[1]);
>>		pthread_t thr[argc];
>>		for (int i = 1; i < argc; i++)
>>			pthread_create(&thr[i], NULL, digitThr, (void*)argv[i]);
>>		for (int i = 1; i < argc; i++)
>>			pthread_join(thr[i], NULL);
>>		write(two2p[1], &sum, sizeof(int));
>>		close(two2p[1]);
>>		return 0;
>>	}
>>	close(one2p[1]); close(two2p[1]);
>>	int n, l;
>>
>>	read(one2p[0], &l, sizeof(int));
>>	char* w = malloc(sizeof(char)*(l+1));
>>	read(one2p[0], w, sizeof(char) * l);
>>	w[l]='\0';
>>	close(one2p[0]);
>>
>>	read(two2p[0], &n,sizeof(int));
>>	close(two2p[0]);
>>	wait(NULL);
>>	wait(NULL);
>>
>>	printf("Sum: %d\nVowels: %s\n", n, w);
>>	free(w);
>>	return 0;
>>}
>>
>>```

>[!done]- 24. Write a C program that creates N threads and one child process (N given as a command line argument). Each thread will receive a unique id from the parent. Each thread will generate two random numbers between 1 and 100 and will print them together with its own id. The threads will send their generated numbers to the child process via pipe or FIFO. The child process will calculate the average of each pair of numbers received from a thread and will print it alongside the thread id. Use efficient synchronization.
>
>>[!code]
>>```c
>>#include <stdio.h>
>>#include <pthread.h>
>>#include <unistd.h>
>>#include <errno.h>
>>#include <stdlib.h>
>>#include <fcntl.h>
>>#include <semaphore.h>
>>#include <sys/wait.h>
>>#include <stdlib.h>
>>
>>pthread_mutex_t  sendMtx;
>>// a semaphore shared between processes would have also been necessary for the output but idk how to work with shared memory so 
>>
>>void* func(void* arg){
>>	int fd = *((int*)arg);
>>	int n = abs((int)random()) % 100 + 1;
>>	int m = abs((int)random()) % 100 + 1;
>>	long id = pthread_self();
>>	printf("Thread %ld generated %d and %d\n", id, n, m);
>>	pthread_mutex_lock(&sendMtx);
>>	write(fd, &id, sizeof(long));
>>	write(fd, &n, sizeof(int));
>>	write(fd, &m, sizeof(int));
>>	pthread_mutex_unlock(&sendMtx);
>>	return NULL;
>>}
>>
>>int main(int argc, char* argv[]){
>>	if (argc != 2){
>>		perror("Please enter one integer only\n");
>>		return 0;
>>	}
>>	const int N = atoi(argv[1]);
>>	
>>	srand(getpid());
>>
>>	int p2c[2];
>>	pipe(p2c);
>>	
>>	if (fork() == 0){ //child
>>		close(p2c[1]);
>>		int n, m;
>>		long id;
>>		double avg;
>>		for (int i = 0; i < N; i++){
>>			read(p2c[0], &id, sizeof(long));
>>			read(p2c[0], &n, sizeof(int));
>>			read(p2c[0], &m, sizeof(int));
>>			avg = n + m; avg /= 2;
>>			printf("%ld - %f\n", id, avg);
>>		}
>>		close(p2c[0]);
>>		
>>
>>		return 0;
>>	}
>>	close(p2c[0]);
>>
>>	pthread_t thr[N+2];
>>	for (int i = 0; i < N; i++)
>>		pthread_create(&thr[i], NULL, func, (void*)(p2c + 1)); //too lazy to actually generate ids, will use thread ids instead
>>	for (int i = 0; i < N; i++)
>>		pthread_join(thr[i], NULL);
>>	close(p2c[1]);
>>	wait(NULL);
>>	return 0;
>>}
>>
>>```

>[!done]- 25. Write a C program named A that creates 3 child processes named B, C and D. A generates a random number between 10 and 20 and sends it to process D. Processes B and C keep generating numbers between 1 and 200 and send them to process D which calculates their difference. The processes stop when the absolute difference between the numbers generated by B and C is less or equal to the number generated by process A.
>
>>[!code]
>>```c
>>#include <pthread.h>
>>#include <stdio.h>
>>#include <sys/wait.h>
>>#include <unistd.h>
>>#include <stdlib.h>
>>
>>// A --> D
>>// B <-> D
>>// C <-> D
>>
>>const int STOP = -1;
>>const int SEND = 1;
>>
>>int main(){
>>	int a2d[2], b2d[2], c2d[2], d2b[2], d2c[2];
>>	pipe(a2d); pipe(b2d); pipe(c2d); pipe(d2b); pipe(d2c);
>>	if (fork() == 0){ //D
>>		close(a2d[1]); close(b2d[1]); close(c2d[1]);
>>		close(d2b[0]); close(d2c[0]);
>>		
>>		int a; read(a2d[0], &a, sizeof(int));
>>		close(a2d[0]); 
>>
>>		while (1){
>>			int b, c;
>>			read(b2d[0], &b, sizeof(int));
>>			read(c2d[0], &c, sizeof(int));
>>			int dif = abs(b - c);
>>			printf("b=%d - c=%d - dif=%d\n",b,c,dif);
>>			if (dif <= a){
>>				write(d2b[1], &STOP, sizeof(int));
>>				write(d2c[1], &STOP, sizeof(int));
>>				break;
>>			}
>>			write(d2b[1], &SEND, sizeof(int));
>>			write(d2c[1], &SEND, sizeof(int));
>>
>>		}
>>
>>		close(b2d[0]); close(c2d[0]);
>>		close(d2b[1]); close(d2c[1]);
>>		return 0;
>>	}
>>	if (fork() == 0){ //B
>>		close(a2d[0]); close(a2d[1]); 
>>		close(c2d[0]); close(c2d[1]);
>>		close(d2c[0]); close(d2c[1]);
>>
>>		close(b2d[0]); close(d2b[1]);
>>
>>		srand(getpid());
>>
>>		while(1){
>>			int n = abs((int)random()) % 200 + 1;
>>	    write(b2d[1], &n, sizeof(int));
>>
>>			int flag; read(d2b[0], &flag, sizeof(int));
>>			if (flag == STOP)
>>				break;
>>		}
>>
>>		close(b2d[1]); close(d2b[0]);
>>		return 0;
>>	}
>>	if (fork() == 0){ //C
>>		close(a2d[0]); close(a2d[1]);
>>		close(b2d[0]); close(b2d[1]);
>>		close(d2b[0]); close(d2b[1]);
>>
>>		close(c2d[0]); close(d2c[1]);
>>
>>		srand(getpid());
>>	  while(1){
>>      int n = abs((int)random()) % 200 + 1;
>>      write(c2d[1], &n, sizeof(int));
>>
>>      int flag; read(d2c[0], &flag, sizeof(int));
>>      if (flag == STOP)
>>        break;
>>    }	
>>		close(c2d[1]); close(d2c[0]);
>>		return 0;
>>	}
>>	close(b2d[0]); close(b2d[1]);
>>	close(c2d[0]); close(c2d[1]);
>>	close(d2b[0]); close(d2b[1]);
>>	close(d2c[0]); close(d2c[1]);
>>
>>	close(a2d[0]);
>>
>>	srand(getpid());
>>
>>	int n = 10 + abs((int)random()) % 10;
>>	printf("A generated %d\n", n);
>>	write(a2d[1], &n, sizeof(int));
>>	close(a2d[1]);
>>
>>	wait(NULL); wait(NULL); wait(NULL);
>>
>>	return 0;
>>}
>>
>>
>>```

>[!done]- 26. Write a C program that receives a command line argument representing a filename. The main process creates a child process. The child will read the content of the specified file, and will convert all lowercase letters preceded by the "." character to uppercase. If there are any amount of whitespaces (space, tab, newline, etc.) between the "." character and the next lowercase letter, the letter will be converted to uppercase. However, if there is any non-whitespace character between the "." character and a lowercase letter, that letter will not be changed. The child process sends to the parent the modified text. The parent process prints everything it receives from the child process.
>
>>[!code]
>>```c
>>#include <stdio.h>
>>#include <pthread.h>
>>#include <string.h>
>>#include <unistd.h>
>>#include <stdlib.h>
>>#include <sys/wait.h>
>>#include <ctype.h>
>>
>>int main(int argc, char* argv[]){
>>	if (argc != 2){
>>		perror("Please enter one argument only\n");
>>		return 1;
>>	}
>>	char* filename = malloc(sizeof(char) * (strlen(argv[1])+1));
>>	strcpy(filename, argv[1]);
>>
>>	int c2p[2]; pipe(c2p);
>>
>>	if (fork() == 0){
>>		close(c2p[0]);
>>		FILE * file = fopen(filename, "r");
>>		free(filename);
>>		char line[100];
>>		fgets(line, 100, file);
>>		fclose(file);
>>		int l = strlen(line);
>>		//printf("%d\n", l);
>>		//printf("%s\n", line);
>>		write(c2p[1], &l, sizeof(int));
>>		
>>		int capitalize = 0;
>>		for (int i = 0; i < l; i++){
>>			if (line[i]=='.')
>>				capitalize = 1;
>>			else if (!(isalpha(line[i]) || line[i] == ' ' || line[i] == '\t'))
>>				capitalize = 0;
>>			else if (islower(line[i]) && capitalize)
>>				line[i] += 'A' - 'a';
>>		}
>>
>>		write(c2p[1], line, sizeof(char) * l);
>>		close(c2p[1]);
>>		return 0;
>>	}
>>	free(filename);
>>	close(c2p[1]);
>>	int l; char line[100]="\0";
>>	read(c2p[0], &l, sizeof(int));
>>	read(c2p[0], line, l * sizeof(char));
>>	printf("%s", line);
>>	close(c2p[0]);
>>	wait(NULL);
>>	return 0;
>>}
>>
>>```

>[!done]- 27. Write a C program that takes two numbers, N and M, as arguments from the command line. The program creates N "generator" threads that generate random lowercase letters and append them to a string with 128 positions. The program will create an additional "printer" thread that that waits until all the positions of the string are filled, at which point it prints the string and clears it. The N "generator" threads must generate a total of M such strings and the "printer" thread prints each one as soon as it gets to length 128.
>
>>[!code]
>>```c
>>#include <stdio.h>
>>#include <pthread.h>
>>#include <stdlib.h>
>>#include <unistd.h>
>>
>>#define L 128
>>
>>int n, m, genCnt, currL;
>>char wrd[L+1];
>>pthread_mutex_t mtx;
>>pthread_cond_t cond;
>>
>>void* prt(){
>>	while(1){
>>		pthread_mutex_lock(&mtx);
>>		while (currL != L)
>>			pthread_cond_wait(&cond, &mtx);
>>		printf("%s", wrd);
>>		currL = 0;
>>		genCnt++;
>>		pthread_mutex_unlock(&mtx);
>>		//i can check this outside the mutex, since only the printer modifies the value of genCnt
>>		if (genCnt == m)
>>			break;
>>	}
>>	return NULL;
>>}
>>
>>void* gen(){
>>	while (1){
>>		char c = 'a' + (abs((int)random()) % 26);
>>		pthread_mutex_lock(&mtx);
>>		if (currL == L){
>>			pthread_mutex_unlock(&mtx);
>>			continue;
>>		}
>>		if (genCnt == m){
>>			pthread_mutex_unlock(&mtx);
>>			break;
>>		}
>>		wrd[currL] = c;
>>		currL++;
>>		if (currL == L){
>>			pthread_mutex_unlock(&mtx);
>>			pthread_cond_signal(&cond);
>>			continue;
>>		}
>>		pthread_mutex_unlock(&mtx);
>>	}
>>	return NULL;
>>}
>>
>>
>>int main(int argc, char* argv[]){
>>	if (argc != 3){
>>		perror("Please enter 2 arguments only\n");
>>		return 1;
>>	}
>>	wrd[L]='\n';
>>	n = atoi(argv[1]);
>>	m = atoi(argv[2]);
>>	
>>	srand(getpid());
>>	pthread_cond_init(&cond, NULL);
>>	pthread_t generator[n];
>>	pthread_t printer;
>>	
>>	pthread_create(&printer, NULL, prt, NULL);
>>	for (int i = 0; i < n; i++)
>>		pthread_create(generator + i, NULL, gen, NULL);
>>
>>	pthread_join(printer, NULL);
>>	for (int i = 0; i < n; i++)
>>		pthread_join(generator[i], NULL);
>>
>>	pthread_cond_destroy(&cond);
>>	return 0;
>>}
>>
>>```

>[!done]- 28. Write a C program that reads a number n from standard input and generates an array s of n random integers between 0 and 1000. After the array is created, the main process creates n + 1 threads. Each of the first n threads repeats the following steps until the array is sorted in ascending order:  
>- generates 2 random integers between 0 and n-1, called i and j  
>- if i < j and s[i] > s[j], exchanges the values of s[i] and s[j]  
>- if i > j and s[i] < s[j], exchanges the values of s[i] and s[j]  
The n+1th thread waits until the array is sorted, after which it prints it to the console. Use appropriate synchronization mechanisms.
>
>>[!code]
>>```c
>>#include <pthread.h>
>>#include <stdio.h>
>>#include <stdlib.h>
>>#include <unistd.h>
>>
>>int n, arr[100], sorted;
>>pthread_mutex_t mtx;
>>pthread_barrier_t b;
>>
>>void* func(){
>>	//first check if the array is already sorted on the first call 
>>	int sortedLocal = 1;
>>	pthread_mutex_lock(&mtx);
>>	for (int i = 0; i < n - 1; i++)
>>		if (arr[i] > arr[i+1]){
>>			sortedLocal = 0;
>>			break;
>>		}
>>	pthread_mutex_unlock(&mtx);
>>	if (sortedLocal){
>>		pthread_barrier_wait(&b);
>>		return NULL;
>>	}
>>	while (1){
>>		int i = abs((int)random()) % n;
>>    int j = abs((int)random()) % n;
>>		while (i == j)
>>			j = abs((int)random()) % n;
>>		if (i > j){
>>			int aux = i;
>>			i = j;
>>			j = aux;
>>		}
>>		
>>		pthread_mutex_lock(&mtx);
>>		if (sorted){
>>			pthread_mutex_unlock(&mtx);
>>			break;
>>		}
>>		if (arr[i] > arr[j]){
>>			//swap
>>			int aux = arr[i];
>>			arr[i] = arr[j];
>>			arr[j] = aux;
>>			//check if sorted
>>			sortedLocal = 1;
>>			for (i = 0; i < n - 1; i++)
>>				if (arr[i] > arr[i+1]){
>>					sortedLocal = 0;
>>					break;
>>				}
>>			if (sortedLocal){
>>				pthread_mutex_unlock(&mtx);
>>				break;
>>			}
>>		}
>>		pthread_mutex_unlock(&mtx);
>>	}
>>	pthread_barrier_wait(&b);
>>	return NULL;
>>}
>>void* prt(){ 
>>	pthread_barrier_wait(&b);
>>	for (int i = 0; i < n; i++)
>>		printf("%d ", arr[i]);
>>	printf("\n");
>>
>>	return NULL;
>>}
>>
>>int main(){
>>	srand(getpid());
>>	printf("Enter n: ");
>>	scanf("%d", &n);
>>	printf("Enter the values in the array: ");
>>	for (int i = 0; i < n; i++)
>>		scanf("%d", arr + i);
>>	
>>	pthread_barrier_init(&b, 0, n + 1);
>>
>>	pthread_t thr[n+1];
>>	for (int i = 0; i < n; i++)
>>		pthread_create(&thr[i], NULL, func, NULL);
>>	pthread_create(&thr[n], NULL, prt, NULL);
>>
>>	for (int i = 0; i < n; i++)
>>		pthread_join(thr[i], NULL);
>>	pthread_join(thr[n], NULL);
>>
>>	pthread_barrier_destroy(&b);
>>	return 0;
>>}
>>
>>```

>[!done]- 29. Write a C program that reads a number n from standard input and creates n threads, numbered from 0 to n - 1. Each thread places a random number between 10 and 20 on the position indicated by its id in an array of integers. After all threads have placed their number in the array, each thread repeats the following:  
>- Checks if the number on its own position is greater than 0.  
>- If yes, it substracts 1 from all numbers of the array, except the one on its own position.  
>- If not, the thread terminates.  
>- If there are no numbers in the array that are greater than 0, except the number on the thread's index position, the thread terminates.  
>After all threads terminate, the main process prints the array of integers. Use appropriate synchronization mechanisms.
>
>>[!code]
>>```c
>>#include <stdio.h>
>>#include <stdlib.h>
>>#include <unistd.h>
>>#include <pthread.h>
>>
>>struct data{
>>	int n, id, *arr;
>>	pthread_mutex_t* m;
>>	pthread_barrier_t* b;
>>};
>>
>>void* func(void*arg){
>>	struct data* d = (struct data*) arg;
>>	int v = 10 + abs((int)random()) % 11;
>>	d->arr[d->id] = v;
>>	pthread_barrier_wait(d->b);
>>	while(1){
>>		pthread_mutex_lock(d->m);
>>		if (d->arr[d->id] <= 0){
>>			pthread_mutex_unlock(d->m);
>>			break;
>>		}
>>		int greaterFound = 0;
>>		for (int i = 0; i < d->n; i++){
>>			if (i == d->id) continue;
>>			d->arr[i]--;
>>			if (d->arr[i] > 0)
>>				greaterFound = 1;
>>		}
>>		pthread_mutex_unlock(d->m);
>>		if (!greaterFound)
>>			break;
>>	}
>>
>>	free(d);
>>	return NULL;
>>}
>>
>>int main()
>>{
>>	srand(getpid());
>>	int n; 
>>	printf("Enter n: ");
>>	scanf("%d", &n);
>>
>>	pthread_barrier_t* b = malloc(sizeof(pthread_barrier_t));
>>	pthread_mutex_t* m = malloc(sizeof(pthread_mutex_t));
>>
>>	pthread_t* thr = malloc(sizeof(pthread_t) * n);
>>	int* arr = malloc(sizeof(int) * n);
>>	
>>	pthread_barrier_init(b, 0, n);
>>
>>	for (int i = 0; i < n; i++){
>>		struct data* d = malloc(sizeof(struct data));
>>		d->n = n; d->id = i; d->arr = arr; 
>>		d->b = b; d->m = m;
>>		pthread_create(&thr[i], NULL, func, (void*) d);
>>	}
>>	for (int i = 0; i < n; i++)
>>		pthread_join(thr[i], NULL);
>>	
>>	free(thr);
>>	free(m);
>>	pthread_barrier_destroy(b);
>>	free(b);
>>	for (int i = 0; i < n; i++)
>>		printf("%d ", arr[i]);
>>	printf("\n");
>>	free(arr);
>>	return 0;
>>}
>>
>>```

>[!todo]- 30. Relay: Create a C program that reads a number n from the standard input and created 4 * n threads. The threads will be split into teams of 4. In each team the threads will be numbered from 0 and will run according to the relay rules:  
>- Thread 0 from each team starts, waits (usleep) between 100 and 200 milliseconds, then passes the control to thread 1  
>- Thread 1 waits between 100 and 200 milliseconds then passes the control to thread 2  
>- Thread 2 waits between 100 and 200 milliseconds then passes the control to thread 3  
>- Thread 3 waits between 100 and 200 milliseconds, then prints a message indicating that the team has finished, then terminates  
>The team from which thread 3 terminates first is considered the winning team. Use appropriate synchronization mechanisms.
>
>>[!code]
>>```c
>>```

>[!done]- 31. Write a C program that receives a number N as a command-line argument. The program creates N threads that will generate random numbers between 0 and 111111 (inclusive) until one thread generates a number divisible by 1001. The threads will display the generated numbers, but the final number that is displayed must be the one that is divisible by 1001. No thread will start generating random numbers until all threads have been created. Do not use global variables.
>
>>[!code]
>>```c
>>#include <stdio.h>
>>#include <unistd.h>
>>#include <pthread.h>
>>#include <stdlib.h>
>>
>>
>>struct data{
>>	int* found;
>>	pthread_barrier_t* b;
>>	pthread_mutex_t* m;
>>};
>>
>>void* func(void* arg){
>>	struct data* d = (struct data*)arg;
>>	pthread_barrier_wait(d->b);
>>	while(1){
>>		int num = abs((int)random()) % 11112;
>>		pthread_mutex_lock(d->m);
>>		if (*(d->found)){
>>			pthread_mutex_unlock(d->m);
>>			break;
>>		}
>>		printf("%d\n", num);
>>		if (num % 1001==0){
>>			*(d->found) = 1;
>>			pthread_mutex_unlock(d->m);
>>			break;
>>		}
>>		pthread_mutex_unlock(d->m);
>>	}
>>
>>	free(d);
>>	return NULL;
>>}
>>
>>int main(int argc, char* argv[]){
>>	if (argc != 2){
>>		perror("Please enter one argument only\n");
>>		return 1;
>>	}
>>
>>	srand(getpid());
>>
>>	pthread_mutex_t* m = malloc(sizeof(pthread_mutex_t));
>>	pthread_barrier_t* b = malloc(sizeof(pthread_barrier_t));
>>	int* flag = malloc(sizeof(int)); *flag = 0;
>>
>>	int n = atoi(argv[1]);
>>
>>	pthread_barrier_init(b, 0, n);
>>	pthread_mutex_init(m, 0);
>>	pthread_t* thr = malloc(sizeof(pthread_t) * n);
>>	for (int i = 0; i < n; i++){
>>		struct data* d = malloc(sizeof(struct data));
>>		d->found = flag; d->m = m; d->b = b;
>>		pthread_create(thr + i, NULL, func, (void*)d);
>>	}
>>
>>	for (int i = 0; i < n; i++)
>>		pthread_join(thr[i], NULL);
>>
>>	free(thr);
>>	pthread_barrier_destroy(b);
>>	pthread_mutex_destroy(m);
>>	free(m); free(b); free(flag);
>>
>>	return 0;
>>}
>>
>>```

>[!todo]- 32. Write a C program that creates N threads (N given as a command line argument). The main process opens a file F, provided as a command line argument (the file's contents are words of a maximum of 20 characters each separated by spaces). Each thread will take turns reading between 1 and 3 words from the file and concatenating them to a thread-local buffer until all the content of the file is read. Once the whole file is completely read, the threads return their local buffer and the main process will print the result from each thread. After it does one reading pass, ensure that each thread waits for the other threads to complete their reading attempt before starting a new reading pass.
>
>>[!code]
>>```c
>>```

>[!done]- Barrier - Create N threads. Each thread generates some treasure (number) on start up. After all threads have generated their treasure, each thread randomly selects another thread's treasure and steals 10% from it.
>[solution](https://www.cs.ubbcluj.ro/~horea.muresan/os/sem6/bar.c)
>>[!code]
>>```c
>>#include <stdio.h>
>>#include <pthread.h>
>>#include <semaphore.h>
>>#include <stdlib.h>
>>#include <unistd.h>
>>
>>#define N 10
>>
>>pthread_t thr[N];
>>pthread_barrier_t b, printB;
>>sem_t mtx;
>>int treasure[N];
>>
>>void* func(void* arg){
>>	int id = *(int*)arg;
>>	treasure[id] = abs((int)random()) % 10000;
>>	pthread_barrier_wait(&b);
>>	pthread_barrier_wait(&printB);
>>	int other = abs((int)random())%N + 1;
>>	while (other == id)
>>		other = abs((int)random())%N + 1;
>>	sem_wait(&mtx);
>>	printf("Thread %d steals from %d: %d -> ", id, other, treasure[other]);
>>	treasure[other] -= treasure[other] * 10 / 100;
>>	printf("%d\n", treasure[other]);
>>	sem_post(&mtx);
>>	return NULL;
>>}
>>
>>int main(){
>>	srand(getpid());
>>	int id[N];
>>	pthread_barrier_init(&b, 0, N+1);
>>	pthread_barrier_init(&printB, 0, N+1);
>>	sem_init(&mtx, 0, 1);
>>	for (int i = 0; i < N; i++){
>>		id[i] = i+1;
>>		pthread_create(&thr[i], NULL, func, (void*)&id[i]);
>>	}
>>	pthread_barrier_wait(&b);
>>	printf("The generated treasures are:\n");
>>	for (int i = 0; i < N; i++)
>>		printf("%d ", treasure[i+1]);
>>	printf("\n");
>>	pthread_barrier_wait(&printB);
>>	for (int i = 0; i < N; i++)
>>		pthread_join(thr[i], NULL);
>>	sem_destroy(&mtx);
>>	pthread_barrier_destroy(&b);
>>	pthread_barrier_destroy(&printB);
>>	return 0;
>>}
>>
>>
>>```

>[!todo]- RWLock - Create multiple reader and writer threads. Reader threads will print the value of n and Writer threads will increment it.
>[solution](https://www.cs.ubbcluj.ro/~horea.muresan/os/sem5/rw.c)
>>[!code]
>>```c
>>```

>[!done]- Hot Potato: Write a C program that receives a number N as a command-line argument. The main process generates a random integer between 1000 and 10000 (we'll call this variable POTATO) and creates N threads and assigns them a unique identifier starting at 1. The N threads will execute an infinite loop in which they try to subtract a random amount of time between 100 and 200 milliseconds. The first thread that causes the POTATO to have a negative value prints a message that announces this alongside its given identifier, breaks the loop, and terminates. Any thread that observes that the value of the POTATO is negative will also break the loop and terminate, but without printing a message.
>
>>[!code]
>>```c
>>#include <stdio.h>
>>#include <pthread.h>
>>#include <stdlib.h>
>>#include <unistd.h>
>>
>>int POTATO = 0;
>>pthread_mutex_t mtx;
>>pthread_barrier_t b;
>>
>>void* func(void* arg){
>>	int id = *(int*)arg;
>>	pthread_barrier_wait(&b);
>>	while (1){
>>		pthread_mutex_lock(&mtx);
>>		if (POTATO < 0){
>>			pthread_mutex_unlock(&mtx);
>>			break;
>>		}
>>		POTATO -= abs((int)random()) % 101 + 100;
>>		printf("%d - %d\n", id, POTATO);
>>		if (POTATO < 0){
>>			printf("%d ended the game\n", id);
>>			pthread_mutex_unlock(&mtx);
>>			break;
>>		}
>>		pthread_mutex_unlock(&mtx);
>>	}
>>
>>	return NULL;
>>}
>>
>>int main(int argc, char* argv[]){
>>	if (argc != 2){
>>		perror("Please enter one integer only");
>>		return 0;
>>	}
>>
>>	srand(getpid());
>>	int n = atoi(argv[1]);
>>
>>	pthread_barrier_init(&b, 0, n);
>>
>>	POTATO = 1000 + abs((int)random()) % 9001;
>>	pthread_t thr[n+2], id[n+2];
>>	for (int i = 0; i < n; i++){
>>		id[i] = i;
>>		pthread_create(&thr[i], NULL, func, (void*)&id[i]);
>>	}
>>	for (int i = 0; i < n; i++)
>>		pthread_join(thr[i], NULL);
>>	pthread_barrier_destroy(&b);
>>
>>	return 0;
>>}
>>
>>
>>```

>[!done]- Hot Potato 2 - Electric Boogaloo: Instead of ending the game when the POTATO is negative, simply eliminate each loser one by one. Have a monitor thread that resets the POTATO as long as there are still players in the game, joins the eliminated player threads and announces the winner.
>
>>[!code]
>>```c
>>>>#include <stdio.h>
>>#include <pthread.h>
>>#include <stdlib.h>
>>#include <unistd.h>
>>
>>int POTATO = 0, loser;
>>pthread_mutex_t mtx;
>>pthread_barrier_t b;
>>pthread_cond_t cond;
>>pthread_t thr[100];
>>
>>//FIXME the winner will keep playing by itself - i m way too tired to fix it rn
>>
>>void* func(void* arg){
>>	int id = *(int*)arg;
>>	pthread_barrier_wait(&b);
>>	while (1){
>>		pthread_mutex_lock(&mtx);
>>		if (POTATO < 0){
>>			pthread_mutex_unlock(&mtx);
>>			continue;
>>		}
>>		POTATO -= abs((int)random()) % 101 + 100;
>>		printf("%d - %d\n", id, POTATO);
>>		if (POTATO < 0){
>>			loser = id;
>>			pthread_cond_signal(&cond);
>>			pthread_mutex_unlock(&mtx);
>>			break;
>>		}
>>		pthread_mutex_unlock(&mtx);
>>	}
>>
>>	return NULL;
>>}
>>
>>void* observe(void* arg){
>>	int alive = *(int*)arg;
>>	pthread_mutex_lock(&mtx);
>>	while (1){
>>		while (POTATO > 0) 
>>			pthread_cond_wait(&cond, &mtx);
>>		alive--;
>>		pthread_join(thr[loser], NULL);
>>		if (alive){		
>>			printf("Player %d was eliminated.\n", loser);
>>			POTATO = abs((int)random()) % 9001 + 1000;
>>		}
>>		else{
>>			printf("Player %d is the winner!!\n", loser); //ironic
>>			pthread_mutex_unlock(&mtx);
>>			break;	
>>		}
>>	}
>>	return NULL;
>>}
>>
>>int main(int argc, char* argv[]){
>>	if (argc != 2){
>>		perror("Please enter one integer only");
>>		return 0;
>>	}
>>
>>	srand(getpid());
>>	int n = atoi(argv[1]);
>>
>>	pthread_barrier_init(&b, 0, n);
>>	pthread_cond_init(&cond, NULL);
>>
>>	POTATO = 1000 + abs((int)random()) % 9001;
>>	int id[n+2];
>>	pthread_t observer;
>>	pthread_create(&observer, NULL, observe, (void*)&n);
>>	for (int i = 0; i < n; i++){
>>		id[i] = i;
>>		pthread_create(&thr[i], NULL, func, (void*)&id[i]);
>>	}
>>	pthread_join(observer, NULL);
>>	pthread_barrier_destroy(&b);
>>	pthread_cond_destroy(&cond);
>>	return 0;
>>}
>>
>>
>>
>>```

>[!todo]- Write a C program that receives 2 command-line arguments: Src, Dest and N. Src and Dest are filenames, and Src must already exist. The program will copy file Src into file Dest using N threads, where each thread will repeatedly read chunks of 20 bytes from Src and write them to Dest. Ensure that the Dest file is a correct copy of the Src file.
>
>>[!code]
>>```c
>>```

### Misc

>[!done]- Write a C program that creates two threads. The first thread generates an array of 5 integers between 0 and 1000 and prints them. After generating the array, the first thread signals the second thread, which checks if the elements of the array are in ascending order. If yes, it prints the array, signals the first thread to terminate, then terminates itself. If not, it signals the first thread to generate a new array of 5 integers. This repeats until the first thread generates an array of 5 integers in ascending order.
>
>>[!code]
>>```c
>>#include <pthread.h>
>>#include <stdio.h>
>>#include <stdlib.h>
>>#include <unistd.h>
>>
>>//flag 0 - generator's turn, 1 - checker's turn, 2 - sorted
>>
>>int flag = 0, arr[5];
>>pthread_cond_t c;
>>pthread_mutex_t mtx;
>>
>>void* generate(){
>>	while(1){
>>		pthread_mutex_lock(&mtx);
>>		//generate
>>		for (int i = 0; i < 5; i++)
>>			arr[i] = abs((int)random())%1000;
>>		//send signal
>>		flag = 1;
>>		pthread_cond_signal(&c);
>>		//wait for signal
>>		while (flag == 1)
>>			pthread_cond_wait(&c, &mtx);
>>		if (flag == 2){
>>			pthread_mutex_unlock(&mtx);
>>			break;
>>		}
>>		printf("Failed array: ");
>>		for (int i = 0; i < 5; i++)
>>			printf("%d ", arr[i]);
>>		printf("\n");
>>		pthread_mutex_unlock(&mtx);
>>	}
>>
>>	return NULL;
>>}
>>void* check(){
>>	while (1){
>>		pthread_mutex_lock(&mtx);
>>		//wait for signal
>>		while (flag != 1)
>>			pthread_cond_wait(&c, &mtx);
>>		//check
>>		flag = 2;
>>		for (int i = 0; i < 4; i++)
>>			if (arr[i] > arr[i+1])
>>				flag = 0;
>>		if (flag == 2){
>>			printf("Success!\n");
>>			for (int i = 0; i < 5; i++)
>>				printf("%d ", arr[i]);
>>			printf("\n");
>>		}
>>		//send signal
>>		pthread_cond_signal(&c);
>>		if (flag == 2){
>>			pthread_mutex_unlock(&mtx);
>>			break;
>>		}
>>		pthread_mutex_unlock(&mtx);
>>	}
>>	return NULL;
>>}
>>
>>
>>int main(){
>>	pthread_t generator, checker;
>>
>>	pthread_cond_init(&c, NULL);
>>
>>	srand(getpid());
>>	pthread_create(&generator, NULL, generate, NULL);
>>	pthread_create(&checker, NULL, check, NULL);
>>
>>	pthread_join(checker, NULL);
>>	pthread_join(generator, NULL);
>>
>>	pthread_cond_destroy(&c);
>>
>>	return 0;
>>}
>>
>>
>>```

>[!done]- N persoane trebuie sa treaca un rau. O barca poate duce M pasageri in acelasi timp (presupunem si ca N % M = 0). Se doreste efectuarea a cat mai putine calatorii. Fiecare persoana are un factor de greutate. Durata de calatorie este egata cu greutatea totala + durata unei calatorii cand barca este goala (D). Sa se afiseze durata totala a calatoriei.
>
>>[!code]
>>```c
>>#include <stdio.h>
>>#include <pthread.h>
>>#include <semaphore.h>
>>#include <unistd.h> 
>>#include <stdlib.h>
>>
>>
>>const int N = 20; // pasageri
>>const int M = 5; 
>>const int D = 3; // durata unei calatorii
>>
>>int greutate = 0;
>>int timp = 0;
>>int nrPasageri=0;
>>pthread_cond_t c;
>>
>>pthread_mutex_t m; //mutex pe greutatea totala si totalul de pasageri
>>
>>sem_t s;
>>
>>void* pasager(void* wp){
>>    int *w = (int*)wp;
>>    printf("Un pasager cu greutatea %d asteapta\n", *w);
>>    sem_wait(&s); //asteapta sa urce in barca
>>    //poate urca in barca
>>    printf("Un pasager cu greutatea %d urca in barca\n", *w);
>>    pthread_mutex_lock(&m);
>>    nrPasageri++;
>>    greutate += *w;
>>    if (nrPasageri == M)
>>        pthread_cond_signal(&c);
>>    pthread_mutex_unlock(&m);
>>
>>    return NULL;
>>}
>>
>>void* barcagiu(){
>>    while(1){
>>        pthread_mutex_lock(&m);
>>        while (nrPasageri < M)
>>            pthread_cond_wait(&c,&m);
>>        printf("Barca duce pasagerii - greutatea totala este %d\n", greutate);
>>        timp += greutate + 2 * D; //dus-intors
>>        printf("Momentul intoarcerii - %d\n", timp);
>>        nrPasageri -= M;
>>        for (int i = 0; i < M; i++)
>>            sem_post(&s);
>>        pthread_mutex_unlock(&m);
>>    }
>>
>>    return NULL;
>>}
>>
>>
>>int main(){
>>    pthread_t pasageri[N+5];
>>    int w[N+5];
>>
>>    pthread_t capitan;
>>    sem_init(&s,0,M);
>>    
>>    srandom(getpid());
>>    pthread_create(&capitan, NULL, barcagiu, NULL);
>>    for (int i = 0; i < N; i++){
>>        //factor de greutate
>>        w[i] = (random() % 10 + 10) % 10;
>>        pthread_create(&pasageri[i], NULL, pasager, &w[i]);
>>    }
>>    for (int i = 0; i < N; i++)
>>        pthread_join(pasageri[i], NULL);
>>    pthread_join(capitan, NULL);
>>    pthread_mutex_destroy(&m);
>>    pthread_cond_destroy(&c);
>>    sem_destroy(&s);
>>   
>>    return 0;
>>}
>>```
