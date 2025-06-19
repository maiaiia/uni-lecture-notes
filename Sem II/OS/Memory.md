# Memory
___
Class: [[OS]]
Type: Lecture
Tags: # 
Date: May 22nd, 2025
___
## In-Process memory management - malloc implementation
### How is the free and occupied space stored?
Approach 1: Table
Approach 2: 2 embedded linked lists - one for the free space and one for the allocated space
![[Memory 2025-05-29 08.13.23.excalidraw]]
### How is fragmentation dealt with?

#### Allocation policies
- **First Fit**
	- allocates memory in the *first available block* that is large enough to satisfy the request
- **Next Fit**
	- similar to First Fit, but instead of starting from the beginning each time, the *search begins from the last allocated position*
- **Best Fit**
	- allocates memory in the *smallest available block* that can accommodate the request, minimising wasted space but potentially increasing fragmentation
- **Worst fit**
	- allocates memory in the *largest available block*, leaving behind larger remaining chunks toreduce fragmentation for future allocations
- **Segregated Lists / Slab Allocator** 
	- uses multiple free lists, each dedicated to a specific size class
	- optimised for common allocation sizes (e.g. frequently requested structures like 64-bit objects)
	- it's important to select the chunks according to the most common sizes of memory (...)
- **Buddy Allocation**
	- free memory is thought of as a big space of size $2^N$
	- when a request for memory is made, the search for free space recursively divides free space by two as much as possible in order to accommodate the request
	- the 2 halves created in each step are "buddies"
	- when 2 buddies are free, they are coalesced (this is done recursively)

|          Allocation Policy           | Speed  |           Fragmentation            |
| :----------------------------------: | :----: | :--------------------------------: |
|              First fit               |  high  |                 ?                  |
|               Next Fit               |  high  |                 ?                  |
|               Best Fit               |  low   |    makes very small free slices    |
|              Worst Fit               |  low   | also causes a lot of fragmentation |
| Segregated Lists /<br>Slab Allocator |  high  |               lower                |
|           Buddy Allocation           | medium |                low                 |

>[!info]
>Mozilla Firefox dealt with fragmentation in a cool way, look it up 
>The memory is always allocated in chunks of length $2^n$ $\rightarrow$ less fragmentation (but this is different to buddy and slab allocation, since the memory isn't actually partitioned from the get go)

## Memory management from an OS's perspective
### Real (Physical) Allocation
#### 1. Single tasking systems 
Single tasking systems may only run one program at a time

![[SingleTaskingSystemsMemory]]

-  Memory address translation
![[sourceFileToExecutable]]
Compiler sets (in binary) *physical* RAM addresses

#### 2. Fixed absolute partitions
![[Memory 2025-05-29 08.52.41.excalidraw]]
Compiler compiles for a certain position and hardcodes physical addresses in binary
#### 3. Fixed relocatable partitions
Now, a program may be run into any available partition, but the disadvantage is that the compiler cannot hardcode any physical address
Thus, binary addresses are now **[[Addresses#^1f8d63|offsets]]** from the base address of the partition
- this means that every memory access goes along with a translation (an addition) $\Rightarrow$ slower access (here we rely on hardware support for speed)
#### 4. Variable Partitions
Same mechanism as for fixed relocatable partitions, but now the address of a partition is decided at program start
This is equivalent to the initial malloc situation (so we have to deal with fragmentation)
### Virtual Allocation
#### 1. Paging

^b0f470

![[Memory 2025-05-29 09.04.33.excalidraw]]
- There is very little space wasted
- Binary addresses are now offsets within the virtual page
- The process has a page table, in order to manage where the virtual pages go in the physical memory
- Virtual addresses are now a *pair* - \<Virtual Page, Offset\>
- Address computation is now a translation + multiplication + addition
#### 2. [[Addresses#^5e4129|Segments]]
- sorta like paging, but with bigger chunks that are specialised (data, code, stack, ...)
- the main point of segments is extending the memory 
- they allow some protection, by providing different types of the segments
- segments aren't really a thing anymore, because we now work on 64 bytes (no need to extend memory)
#### 3. Paged-Segmentation
- Each segment is made out of several pages
- Virtual address: segment, page, offset

### Replacement policies
(This discussion is within the bounds of paging)
When physical memory is full, the OS swaps (sends and stores) pages to disk. 

>[!Question]
> Which pages should be evicted?

#### Approaches 
- **FIFO** 
	- Evicts the oldest page
- **NRU** (not recently used)
	- The OS must now keep track of how frequently a page is used. This is done via the *hardware*. 
	- Every page has a 2 bit marker (bit 0 - read access, bit 1 - write access). Whenever data is read from / written to a file, its marker is updated
	- This now provides the order of loading pages into swap files (literally increasing order of markers)
	- The markers must be periodically reset (since, after a certain point, most pages will end up having a `11` marker)
- **LRU** (least recently used)
	- A bit matrix of size N x N is kept, where N is the number of physical pages 
	- When a page is accessed, its row is filled with 1's and its column with 0s
	- The page chosen as 'victim' is the one with the lowest row sum
![[LRU]]

## [[Caches]]

## Deadlocks