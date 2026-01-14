---
Class: "[[Databases]]"
date:
type: Lecture
---
# The Physical Structure of Databases

![[dbms-architecture]]
## Memory Hierarchy
1. Primary Storage
	- cache, main memory
	- very fast access to data 
	- volatile
	- currently used data
2. Secondary Storage
	- e.g. magnetic disks
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
		- good for archives, backups
		- unsuitable for data that is frequently accessed

>[!Important]
>As we go higher up in the memory hierarchy, both the speed and the cost go up

The use of DBMSs is to bring data from disks into the main memory for processing

### Magnetic disks
![[magnetic-disk.png]]

- secondary storage
- extremely used in database applications 
- DBMS applications don't kneed to know whether the data is on disk or in the main memory
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
- *sector size*
	- characteristic of the disk, cannot be modified
- *block size*
	- multiple of the sector size