---
Class: "[[Databases]]"
date:
type: Lecture
---
# Memory. Magnetic Disks
## Memory Hierarchy
1. Primary Storage
	- cache, **main memory**
	- very fast access to data 
	- volatile
	- currently used data
2. Secondary Storage
	- e.g. *magnetic disks*
	- slower storage devices 
	- non-volatile
	- disks-sequential, direct access
	- main database 
3. Tertiary storage 
	- e.g. optical disks, tapes 
	- slowest storage devices 
	- non-volatile
	- tapes
		- only sequential access
		- good for *archives, backups*
		- unsuitable for data that is frequently accessed

>[!Important]
>As we go higher up in the memory hierarchy, both the speed and the cost go up

DBMSs to bring data from disks into the main memory for processing.

## Magnetic disks
- secondary storage
- extremely used in database applications 
- DBMS *applications* don't kneed to know whether the data is on disk or in the main memory
### components
![[magnetic-disk.png]]
- *disk block*
	- sequence of contiguous bytes 
	- unit for data storage
	- unit for data transfer (reading data from disk / writing data to disk)
	- reading / writing a block - an input / output (I/O) operation
- *tracks*
	- concentric rings containing blocks, recorded on one or more platters
- *sectors*
	- arcs on tracks
- *platters*
	- single-sided or double-sided
- *cylinder*
	- set of all tracks with the same diameter
- *disk heads*
	- one per recorded surface
	- to read / write a block, a head must be on top of the block 
	- all disk heads are moved as a unit
	- systems with one active head
So, 
- a hard disk drive is composed of a stack of *magnetic disks* / *platters*, mounted on a *rotating spindle*
- each *platter* has a corresponding *read/write head*
- *read/write heads* are mounted on an arm assembly
- data is written on each disk in the form of concentric circles called *tracks*
- the *tracks* with the same distance from the center on all platters create a *cylinder*
- each *track* is divided into *sectors*
- a collection of *consecutive sectors* (meaning on consecutive tracks) is called a *block*

>[!Important]
> Read-write heads don't rotate, disks do. 
> Disks cannot rotate independently.
> Thus, data may be written (/ read) to (/ from) one disk at a time.

### characteristics

- *sector size*
	- characteristic of the disk, cannot be modified
- *block size*
	- multiple of the sector size
- *storage capacity*
- number of platters, platter type (single-sided or double-sided)
- avg / max seek time 
- avg. rotational delay
- number of rotations / min 
- data transfer rate
### DBMS management of disks

The unit for data transfer between disk and main memory is called a **block**.
While differences of data access from different parts in the main memory are insignificant, when it comes to magnetic disks, the location of the data is important. 

>[!Important] Disk Access Time
>$$\text{seek time + rotational delay + transfer time}$$ 
>where
>- *seek time*: time to move the disk head to the desired track
>- *rotational delay*: time for the block to get under the head 
>- *transfer time*: time to read / write the block, once the disk head is positioned over it

Since the time required for DB operations is insignificant compared to the time taken to transfer data from disk to main memory, DBMSs focus on *minimising access time*. The seek time and the relational delay can be improved by *placing records that are often used together close to each other* (same block / track / cylinder or adjacent cylinder)

## Solid-State Disks (SSD)
- NAND *flash* components 
- faster random access (read accesses on SSDs are equally fast everywhere)
- higher data transfer rates 
- no moving parts
- higher cost per GB
- limited write cycles



