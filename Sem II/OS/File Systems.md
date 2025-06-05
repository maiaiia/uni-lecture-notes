# File Systems
___
Class: [[OS]]
Type: Lecture
Tags: # 
Date: June 5th, 2025
___
## Types

- Windows
	- **FAT** - 12, 16, 32 
		- FAT 32 is a pretty basic file system supported by pretty much every OS 
	- **NTFS** 
		- supports big data
	- **ReFS** (?) 
- Unix
	- **ext** - 2, 3, 4
	- **xfs** 
	- **hfs** (donated to open source)
	- **ufs** (Solaris)
	- **zfs** (modern replacement of ufs, but not fully open source)
	-  **btrfs** (open source version of zfs)
	- **ReiserFs** 3, 4 

>[!tip]
>on Unix systems, you can find the file system under `/etc/fstab`


## Disk Organisation
![[File Systems 2025-06-05 08.53.46.excalidraw]]
### Superblock
### I-nodes
- I-nodes store file owner, group, access mode, file type, link count (how many links are pointing to it)
- Each I-node has a number (around 10 - 12ish) of fields that store addresses of data blocks (direct access)
- Past the direct nodes, there are indirect nodes (at most three, so far). An indirect node of order 'k' points to a block of indirect nodes of order 'k-1'

|                                                                                           |                                                            | Indirect node                         | Indirect node to Indirect node |
| ----------------------------------------------------------------------------------------- | ---------------------------------------------------------- | ------------------------------------- | ------------------------------ |
| file owner, group, access mode, file type, link count (how many links are pointing to it) | fields that store addresses of data blocks (direct access) | node pointing to a block of addresses |                                |
![[File Systems 2025-06-05 09.31.28.excalidraw]]
#### Data Corruption Prevention
- journaling
- CoW (copy on write)
- RAID (redundant array of inexpensive disks)

## Types of Files
- file (regular)
- directory
	- file storing a list of files
	- a \<fileName, I-node\> pair
	- ![[Directory]]
- FIFO
- links
	- Symbolic (Soft) Links
		- a file pointing to another path
		- created with `lm -s`
		- used in order to work easier with files that have a long path
		- in other words, symlinks store paths to files
	- Hard Links
		- another name for an I-node (sorta works like a reference in C)
		- good for saving space (if files are identical)

>[!tip]
> This is why the C command for deleting files is called `unlink` (cause you literally unlink hard links to a certain file)

>[!Warning]
> Hard Links cannot point to directories or stuff in a different partition

>[!Warning]
>Only root users can create hard links


## Mounting
- mapping a new partition to a directory