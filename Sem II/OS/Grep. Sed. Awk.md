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
- -E: match extended REGEX (add to every grep basically)
- -o: only return matches (not the entire line)
- -w: check for whole words, not just substrings
- - use '|' to have multiple possible matches 
- -i: make the match case insensitive
- -v: invert the match 
- -e: match multiple patterns
## Sed 
- -E: same as GREP!! make sure to include it!!
- use 's' in the first field to replace and 'y' to translate
	- translation example: `cat pass | sed "y/elaoszbgELAOSZBG/3140528931405289/"`
- use '&' to refer to the whole match
- use '\\n' to refer to the nth group matched
- use 'g' as a parameter after the last separator to replace all occurrences instead of just the first one
- use 'p' as a parameter after the last separator (combined with -n) in order to print matched lines only
- use an 'i' as a parameter in the last field to make the string matching insensitive (do not use -i!!! it will change the original contents of the file!!!)
- use the pipe character if you need to match multiple characters
- use `sed -n "kp"` to print the kth line in a file
## Awk
-  use '$' to reference fields
- use -F to change separator
- basic syntax: `awk -F sep BEGIN{init_vars}{do_stuff}END{do_stuff}`
	- example: ` awk -F: '{if ($3 % 2 == 0) print $0}'`

## [[Practice Problems#^4f4c2e|Practice Problems]]
