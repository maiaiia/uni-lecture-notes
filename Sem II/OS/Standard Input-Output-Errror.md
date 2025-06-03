# Standard Input-Output-Error
___
Class: [[OS]]
Type: Lecture
Tags: # 
Date: March 6th, 2025
___
Standard 
- Input: 0
- Output: 1 
- Error: 2

Each of these are files that one can write to by specifying the file (in - stdin, out - stdout, error-stderr). 
Redirect errors to a file using '2>' 
> note that '>' is actually implicitly '1>'

Redirect errors to the same place as stdout: '2>&1'
The location where unnecessary stuff can be hidden / redirected to on linux is `/dev/null`
