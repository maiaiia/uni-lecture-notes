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

## Problems 
>[!question]- Display the lines in /etc/passwd that belong to users having three parent initials in their name, even if the initials do not have a dot after them.

>[!question]- Display the lines in /etc/passwd that belong to users having names of 11 characters or longer
>`grep -E -i "^([a-z0-9]+:){4}[a-z]{11,}"  passwd.fake`


