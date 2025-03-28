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
>[!question]- Display the lines in /etc/passwd that belong to users having three parent initials in their name, even if the initials do not have a dot after them.

>[!question]- Display the lines in /etc/passwd that belong to users having names of 11 characters or longer
>`grep -E -i "^([a-z0-9]+:){4}[a-z]{11,}"  passwd.fake`


1.
2.
```regex
cat last.fake | awk '{print $7,$1}' | sed -E s/":[0-9][0-9]"// | sort -n -r | head -n 6 | awk '{print $2}' | sort | uniq
```
3.
```regex
cat passwd.fake | grep -E "^m" --colour | awk -F: '{print $1, $5}' | sed -E "s/([0-9]){4}/ &/" | awk '$2 % 7==0'  | awk '{print $3,$4}'
```
4.
```regex
cat ps.fake | grep root | awk '{print $6}' | sort | uniq
```
5.
```regex
cat passwd.fake | awk -F: '{print $1,$5}' | grep -E "88 " | awk '{print $2,$3}'
```
6.
```regex
cat passwd.fake | awk -F: '{print $1 ":" $5}' | grep --color -E "^([a-z]+023[0-9])" | awk -F: '{print $2}'
```
7.
```regex
cat last.fake | grep "pts/9" | grep "^t" | awk '{print $1}'
```
8.
```regex
cat ps.fake | awk '{print $1}' | grep --color -E "^r" | sort | uniq | sed -E "s/a|e|i|o|u/&&/gi"
```
9.
```regex
cat ps.fake | sed -E "s/[a-z]| |[0-9]//gi"
```
10.
```regex
cat ps.fake | sed -E "s/[^r]//gi"
```
11.
```regex
cat ps.fake | awk '{print $2}'| awk '{sum+=$1; total += 1}END{print sum,total, sum/total}'
```
