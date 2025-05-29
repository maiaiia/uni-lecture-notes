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
Approach 2: Embed 2 linked lists - one for the free space and one for the allocated space
![[Memory 2025-05-29 08.13.23.excalidraw]]
### How is fragmentation dealt with?

#### Allocation policies
- First fit 
	- allocate on the first position available
- Next fit 
	- allocate on the first position that is available, starting from the last position of a previous allocation
- Best fit 
	- allocate on the smallest chunk of memory that's big enough
- Worst fit 
	- choose the largest piece available $\rightarrow$ leave behind larger portions for allocations
- Segregated Lists / Slab Allocator 
	- this has several lists of different sizes
	- for instance, since many data structures require 64bites (say), then there may be a list of chunks of 32 bits
	- it's important to select the chunks according to the most common sizes of memory (...)
- Buddy Allocation
	- have the memory from  a buffer be a power of 2
	- allocate the smallest chunk of a size equal to a power of 2
	- not specialised, generic (compared to segregated lists)
	- when 2 chunks of the same length are free, they can be coalesced and promoted to a list of chunks of size $2^k+1$(this is recursive)

|          Allocation Policy           | Speed |           Fragmentation            |
| :----------------------------------: | :---: | :--------------------------------: |
|              First fit               | high  |                 ?                  |
|               Next Fit               | high  |                 ?                  |
|               Best Fit               |  low  |    makes very small free slices    |
|              Worst Fit               |  low  | also causes a lot of fragmentation |
| Segregated Lists /<br>Slab Allocator | high  |               lower                |
|           Buddy Allocation           |       |                                    |

>[!info]
>Mozilla Firefox deals with fragmentation in a cool way, look it up 
>The memory is always allocated in chunks of length $2^n$ $\rightarrow$ less fragmentation
>

## Memory management from an OS's perspective
### Real Allocation
#### Single tasking systems (may only run one program at a time)

![[SingleTaskingSystemsMemory]]

-  Memory address translation
![[Memory 2025-05-29 08.43.06.excalidraw]]
Compiler sets in binary *physical* RAM addresses

#### Fixed absolute partitions
![[Memory 2025-05-29 08.52.41.excalidraw]]
Compiler compiles for a certain position and hardcodes physical addresses in binary

#### Fixed relocatable partitions
Now, a program may be run in any position, but the disadvantage is that the compiler cannot hardcode any physical address
Thus, binary addresses are now **[[Addresses|offsets]] from the starting address of the partition**
- this means that every memory access goes along with an addition, so the memory can be computed
- but there comes in hardware support for the runtime address translation

#### Variable Partitions
Same mechanism as for fixed relocatable partitions, but now partition address is decided at program start
This is equivalent to the initial malloc situation (so we have to deal with fragmentation)

>[!important]
>All the Models above under real allocation

### Virtual Allocation
#### Paging
![[Memory 2025-05-29 09.04.33.excalidraw]]
- There is very little space wasted
- Binary addresses are now offsets within the virtual page
- The process has a page table, in order to manage where the virtual pages go in the physical memory
- Virtual addresses are now a *pair* - \<Virtual Page, Offset\>
- 