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
### Quotes are Confusing

| Feature                  | `"` Double Quotes | `'` Simple Quotes | Backticks |
| ------------------------ | ----------------- | ----------------- | --------- |
| **Variable Expansion**   | Yes               | No                | No        |
| **Command Substitution** | `$(...)` works    | No                | Yes       |
| **Escape Sequences**     | Yes               | No                | No        |
>[!tip]
>Backticks are outdated. When working with BASH, `$(...)` is preferred. However, `$(...)` does not work with all shells

### Misc
>[!tip]
>add a -x after `#!/bin/bash` for a step by step explanation of what's going on in the code
- $(command) - this captures the output of `command`
- for iterating through files: `for f in `find` ` (or `for f in $(find)`)
## [[Practice Problems#^03fc49|Practice problems]]



