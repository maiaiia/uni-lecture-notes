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

## Awk
-  use '$' to reference fields
- use -F to change separator

## Problems 
>[!question]- Display the lines in /etc/passwd that belong to users having three parent initials in their name, even if the initials do not have a dot after them.

>[!question]- Display the lines in /etc/passwd that belong to users having names of 11 characters or longer
>`grep -E -i "^([a-z0-9]+:){4}[a-z]{11,}"  passwd.fake`

