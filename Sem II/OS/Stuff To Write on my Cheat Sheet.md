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

## File systems
### Disk organization
0. Boot block
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
		- number of links
	- about 10-12 direct nodes that store addresses of data blocks (direct access)
	- simple indirect node storing addresses of direct nodes
	- double indirect node storing addresses of simple indirect nodes
	- triple indirect node storing addresses of double indirect nodes
3. Data

### Types of file systems
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

### File types
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

#### 1. Regular files
- store arrays of bytes 
#### 2. Directories
- store a list of (file name, I-node) pairs
- a reference to itself - '.'
- a reference to its parent directory - '..'
- all directories form a directory tree / hierarchy
#### 3. Links 
##### Hard Links
- When a hard link is created, what actually happens is that a new (file name, I-node) link is created. (so they work like an alias to a specific I-node)
- When unlink is called, the link between the file name and the I-node is deleted. A reference count within the i-node is checked and modified accordingly. When it reaches zero, the file is truly deleted
- for hard links, files appear duplicated (but no data is actually copied!!!)
##### Symbolic Links
- these are files pointing to a file / directory (they simply store pathnames)
##### Differences

| Characteristic                        | Hard Links                                                               | Symbolic Links                                                   |
| ------------------------------------- | ------------------------------------------------------------------------ | ---------------------------------------------------------------- |
| Can link to directories?              | No                                                                       | Yes                                                              |
| Can link to files in other partitions | No (I-node number is particular to file system)                          | Yes                                                              |
| Creation                              | ln                                                                       | ln -s                                                            |
| Original file removal                 | nothing happens                                                          | dangling reference                                               |
| Linked file removal                   | may delete the original file too (if no other files are linked to it)    | the original file is not affected after deleting a symlink to it |
| who can create them?                  | only the system administrator (although this information seems outdated) | anybody                                                          |

### Mounting
The process of connecting a file system, on a certain disk, to an existing directory in the implicit file system (so like simply taking an existing directory as a target mount point and essentially pasting a new file system onto the directory tree at that point)

## Processes
### States of a process
![[Process Theory 2025-05-15 09.32.49.excalidraw]]
1. Load
	- getting the important program bits from disk into memory
2. Ready
	- when a process is ready to run but for some reason the OS has chosen not to run it at this given moment
3. Running
	- in the running state, a process is running on a processor (i.e. executing instructions)
4. Wait / Blocked
	- when a process has performed some kind of operation that makes it not ready to run until some other event takes place (for instance, when a process initiates an I/O request to a disk, it becomes blocked - because I/O takes so damn long - and thus some other process can use the processor)
5. Swap
6. Finish
	- execution done
	  
  >[!warning] not done

  ![[Screenshot 2025-06-09 at 16.24.54.png]]
## Memory
### In-Process memory management
#### Allocation policies
- **First Fit** - allocate memory in the first available block
- **Next Fit** - allocate memory in the first available block after the last allocation
- **Best Fit** - smallest available block that can accommodate the request
- **Worst Fit** - largest available block 
- **Segregated List / Slab Allocator** - multiple lists of pre-defined size classes
- **Buddy Allocation** - memory is split into blocks having size equal to a power of 2
	- supports coalescing (2 adjacent free blocks of the same size are merged recursively into larger blocks)
### Memory management from an OS's perspective
#### Real (Physical) Allocation
1. **Single tasking systems** 
	 - only one process may run at any given time
	 - addresses are actual physical RAM addresses
2. **Fixed absolute partitions** 
	- each process is compiled at a certain partition
	- compiler hardcodes physical addresses
3. **Fixed relocatable partitions**
	- processes can be run in any partition
	- addresses are now offsets from the base address of a partition 
4. **Variable Partitions** (like malloc)
	- partitions have variable size
	- fragmentation :( 
#### Virtual Allocation
1. **Paging**
	- RAM memory is split into pages of a specific size
	- the pages corresponding to a certain process can be randomly spread in the RAM memory
	- addresses are now \<page, offset\> pairs
2. **Segments**
	- segments are larger than pages and have different permissions (allowing some protection)
	- their main purpose is extending the memory
3. **Paged-Segmentation**
	- addresses are now \<segment, page, offset\> tuples
### Swapping
- the process of temporarily transferring inactive memory pages to disk to free up RAM for active processes
#### Replacement policies
- **FIFO** - evicts the oldest page
- **NRU** (not recently used) 
	- every page has a 2 bit marker for the way the file was accessed (0-read, 1-write)
	- whenever data is read from / written to a file, its marker is updated
	- files are swapped in increasing order of their markers
	- markers must pe updated periodically
- **LRU** (least recently used)
	- if there are N pages, an NxN matrix is stored
	- when a page is accessed, its row is filled with 1's, then its column with 0s
	- files are swapped in increasing order of the number of 1s in their row

### Caches
- used for increasing speed of accessing data
- when a certain page is requested, the CPU checks if it has been loaded in the cache memory. if not, it loads it there, alongside neighbouring pages
>[!Tip] Principle of locality
> When a specific page is requested, the likelihood of a neighbouring page to be requested afterwards is really high. (so load it in the cache memory in advance)
## Organization
- Associative - list of pages and their locations
- Direct Map (like a hash map)
	- cache location is page number % cache size
	- advantage: fast
	- disadvantages
		- [[collision|collisions]]
		- threshing (when 2 caches have the same hash and are accessed alternatively)
- Set-Allocative
	- A combination of both
	- Use a modulo to find a set of caches and within that set, have an associative organisation

| Organization Type | Advantages                         | Disadvantages                          |
| ----------------- | ---------------------------------- | -------------------------------------- |
| Associative       | No Collisio                        | Slow                                   |
| Direct Map        | F                                  | [[collision\|collisions]]<br>Threshing |
| Set-Allocative    | Decent speed<br>No collisions ions |                                        |
## Scheduling Mechanisms
- time for turnaround: completion_time - arrival_time
- time of response: first_run_time - arrival_time
### Policies
1. FCFS (FIFO)
	- SJF (shortest jump first)
	- STCF (shortest termination comes first)
2. RR (Round Robin) - allocate a certain amount of time for each process and execute processes in a circular order
	- MLFQ (multi level feedback queue) - priority queues
	- RULES
		1. if priority(A) > priority(B), A runs 
		2. if priority(A) = priority(B), RR A and B
		3. when A enters system, A goes to top Queue (this is especially useful for interactive OSs)
		4. once A exhausted its quota on a priority queue, move it down (i.e. the priority of a process that has been executed decreases)
		5. periodically bring all to top queue (so that the ones at the bottom don't starve)
		6. When using MLFQs, if two threads of different priorities use the same mutex, elevate the low priority process to the priority of the high priority process