# REGEX
___
Class: [[OS]]
Type: Seminar
Tags: # 
Date: March 5th, 2025
___

Language used mostly for quickly filtering through output

'.' - any character 
'\\' - changes the meaning of any character (special $\leftrightarrow$ normal) %%e.g.: \n - new line%%
'\[]' - any character from list between square brackets. Dashes can be used to specify intervals (e.g. \[a-z], \[0-9], \[A-Z])
'\[^]' - exclude characters (e.g. \[^abc] means 'exclude abc')
'^' - beginning of line 
'$' - end of line 
'* ' - the previous expression repeated 0 or more times 
'+' - the previous expression repeated 1 or more times 
'?' - the previous expression is zero or once 
'{n,m}' - the previous expression is repeated at least 'n' times and at most 'm' times %%e.g. {5} - exactly 5 times; {5,} - lower bound only; {,5} - upper bound only%%
'\\<' - beginning of word 
'\\>' - end of word 
'|' - or 
'()' - make a group that can be repeated a certain number of times
	- groups can be referenced by '\\no', where 'no' is the number of the group