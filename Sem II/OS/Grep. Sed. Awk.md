# Grep. Sed. Awk
___
Class: [[OS]]
Type: Seminar
Tags: # 
Date: March 5th, 2025
___

grep - filtering 
sed - filtering & transformations 
awk - has its own programming language and is weird?

## Grep

## Sed 
- use '&' to refer to the whole match
- use '\\n' to refer to the nth group matched
- use 'g' as a parameter after the last separator to replace all occurrences instead of just the first
- use an 'i' as a parameter in the last field to make the matching string insensitive
- use the pipe character if you need to match multiple characters

## Awk
-  use '$' to reference fields
- use -F to change separator

## Problems 
### Practice problems - Calin
#### Lab 3
>[!question]- 1. Display the lines in /etc/passwd that belong to users having three parent initials in their name, even if the initials do not have a dot after them.
>```regex
>cat pass | grep -E " [A-Z].? [A-Z].? [A-Z].? " --color
>```

>[!question]- 2. Display the lines in /etc/passwd that belong to users having names of 11 characters or longer
> Last name:
> ```regex
> cat pass | grep -E " - ([A-Z]){12,} " --color
>```
>Any name:
>```regex
>cat pass | grep -E '([A-Z]){12,}:|([A-Z]){12,}-|- ([A-Z]){12,} ' --color
>```
> The solutions above are kinda bad cause they don't take into account special characters, so it's better to also use the username
> ```regex
> cat pass | grep -E '([A-Z]){12,}:|([A-Z]){12,}-|- ([A-Z]){12,} |:([a-z]){12,}.|.([a-z]){12,} ' --color
>```
>(the first 3 matches are kinda redundant now but oh well)

>[!Question]- 3. Convert the content of /etc/passwd using a sort of  Leet/Calculator spelling (eg Bogdan -> B09d4n)

>[!Question]- 4. Convert the content of /etc/passwd surrounding with parentheses and sequence of 3 or more vowels

>[!Question]- 5. Display the full names (but only the full names) of the students belonging to group 211

>[!Question]- 6. Count the numbers of male and female users in /etc/passwd, accepting as true the following incorrect assumptions: All users have their last name as the first name in the user-info filed (5th field) All women have one of their first or middle names ending in the letter “a”

#### Lab 4.
>[!Question]- 1. Use file /etc/passwd and print out how many groups contain students named Dan with an even student ID number (numar matricol).

>[!Question]- 2. Print the 3rd column for lines that do not start with a digit.


>[!Question]- 3. Create a file with the content of manual for the command man. Use grep/sed/awk to select the lines that start with "MAN" or with spaces followed by "MAN" and replace all occurrences of "MAN" with "\*star\*". Print the first and second column of these lines,separated by dash "-", but only the lines that do not contain "WILL" or "Will" or "will" in the first two columns.


>[!Question]- 4. Write a shell command that prints out a statistic of the number of processes per user, using commands ps, awk/cut, sort and uniq.


>[!Question]- 5. Display only the last name of each user in /etc/passwd, considering the last name to be the first word in the 5th field, and accepting it only if it starts with a capital letter


>[!Question]- 6. Extent the solution above to only show the top 10 most frequent last names, ordered descending by their popularity


>[!Question]- 7. Display all the directories under /etc that contain files with the extension .sh. Each directory should be displayed only once. Hide the permission denied errors given by find.


>[!Question]- 8. Display in the pager, the number of processes of each username, sorting their usernames descending by their process count.


>[!Question]- 9. Display the processes that involve editing a C file


>[!Question]- 10. Display in the pager, the usernames with the most logins in the system.


>[!Question]- 11. Display in the pager the top of usernames by their time spent logged on in the system.



### Practice problems - Boian
>[!Question]-  Find all the usernames that logged in from "economica" on a Sunday 
>```regex
cat last.fake | grep economica | grep Sun | awk '{print $1}' | sort | uniq
>```

>[!Question]- Find all the users that logged into the system after 11PM
>```regex
cat last.fake | awk '{print $7,$1}' | sed -E s/":[0-9][0-9]"// | sort -n -r | head -n 6 | awk '{print $2}' | sort | uniq
>```

>[!Question]- Display the full names of the users having a username that starts with "m" and with a user ID divisible by 7.
>```regex
cat passwd.fake | grep -E "^m" --colour | awk -F: '{print $1, $5}' | sed -E "s/([0-9]){4}/ &/" | awk '$2 % 7==0'  | awk '{print $3,$4}'
>```

>[!Question]- Display all the distinct TTYs used by user root.
>```regex
cat ps.fake | grep root | awk '{print $6}' | sort | uniq
>```

>[!Question]- Find the full names of all the users whose username ends in 88
>```regex
cat passwd.fake | awk -F: '{print $1,$5}' | grep -E "88 " | awk '{print $2,$3}'
>```

>[!Question]- Find all users whose user ID has three digits and starts with 23
>```regex
cat passwd.fake | awk -F: '{print $1 ":" $5}' | grep --color -E "^([a-z]+023[0-9])" | awk -F: '{print $2}'
>```

>[!Question]- Find all usersnames starting with "t" that logged on "pts/9"
>```regex
cat last.fake | grep "pts/9" | grep "^t" | awk '{print $1}'
>```

>[!Question]- Find all the distinct usernames starting with "r" that are currently running programs, and display them duplicating every vowel
>```regex
cat ps.fake | awk '{print $1}' | grep --color -E "^r" | sort | uniq | sed -E "s/a|e|i|o|u/&&/gi"
>```

>[!Question]- Display all the distinct lines left in /etc/passwd after deleting all letter and digits and spaces.
>```regex
cat ps.fake | sed -E "s/[a-z]| |[0-9]//gi"
>```

>[!Question]- Display all the distinct lines left in /etc/passwd after deleting all characters except "r".
>```regex
cat ps.fake | sed -E "s/[^r]//gi"
>```

>[!Question]- Calculate the average of the PIDs of the processes currently running in the system.
>```regex
cat ps.fake | awk '{print $2}'| awk '{sum+=$1; total += 1}END{print sum,total, sum/total}'
>```
