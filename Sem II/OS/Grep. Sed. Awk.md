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
- use `sed -n "kp"` to print the kth line in a file

## Awk
-  use '$' to reference fields
- use -F to change separator

## [[Practice Problems#^4f4c2e|Practice Problems]]
