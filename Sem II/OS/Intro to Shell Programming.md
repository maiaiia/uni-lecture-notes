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

>[!Question]- 9. Write a script that finds in a given directory hierarchy, all duplicate files and displays their paths. Hint: use checksums to detect whether two files are identical.
>```bash
>
>```

>[!Question]- 10. Display the session count and full names of all the users who logged into the system this month, sorting the output by the session count in descending order. Use the -s and/or -t options of command last to get this month's sessions, and the command date to generate the required timestamp in the expected format.
>```bash
>
>```

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



## 211