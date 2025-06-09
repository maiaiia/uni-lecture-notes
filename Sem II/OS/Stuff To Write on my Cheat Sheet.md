# Stuff To Write on my Cheat Sheet
___
Class: [[OS]]
___
## REGEX
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

## Disk organization
1. Superblock
	- contains global information about the entire file system
		- block size
		- number of I-nodes 
		- pointer to the head of a free list of blocks
2. I-Nodes
	- information about files (and directories)
		- file ownership
		- access mode
		- file type
	- about 10-12 direct nodes that store addresses of data blocks (direct access)
	- indirect node storing addresses of direct nodes
	- indirect node of order 2 storing addresses of indirect nodes of order 1 
	- indirect node of order 3 storing addresses of indirect nodes of order 2 
3. Data

## File systems
1. Windows: 
	- FAT 12 / 16 / 32 (works on basically all OSs)
	- NTFS
	- ReFS
2. Unix
	- ext 2 / 3 / 4
	- rfs 
	- hfs 
	- ufs 
	- zfs 
	- btrfs 
	- ReiserFS

## File types
1. Managed by system calls
	- regular files
	- directories
	- hard links
	- soft / symbolic links
	- sockets
	- fifos
	- block special
	- character special
2. Managed by the kernel
	- Pipes
	- Shared Memory Segments
	- Message Queues
	- Semaphores

### 1. Regular files
- store arrays of bytes 
### 2. Directories
- store a list of (file name, I-node) pairs
### 3. Links 
#### Hard Links
- When a hard link is created, what actually happens is that a new (file name, I-node) link is created. (so they work like an alias to a specific I-node). Nothing is actually copied 
- When unlink is called 
#### Symbolic Links
#### Differences

| Characteristic | Hard Links | Soft Links |
| -------------- | ---------- | ---------- |
|                |            |            |



