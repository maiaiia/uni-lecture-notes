---
Class: "[[Databases]]"
date:
type: Lecture
---
# The Physical Structure of Databases

![[dbms-architecture]]
## Disk Space Manager
A [[Memory#1. Paging|page]] is one unit of data, having the size of a disk block. A r/w operation of a page is considered as one i/o operation.

Upper layers in the DBMS can treat the data as a collection of pages.

The DSM
- uses commands to allocate / deallocate / read / write a page 
- keeps track of which pages are on which disk blocks 
- monitors disk usage, keeping track of available disk blocks

Free blocks can be identified:
- by maintaining a linked list of free blocks 
- by maintaining a bitmap with one bit / block, indicating whether the corresponding block is used or not (this method allows for fast identification of contiguous available areas on disk)

## Buffer Manager 
- brings new data pages from disk to the main memory as they are required 
- decides what main memory pages can be replaced 
- manages the available main memory in a collection of pages called *buffer pool* (BP)
- the buffer pool is composed of *frames*, which are pages in the BP / slots that can hold a page
- the BM has a *replacement policy* that dictates the choice of replacement frames in the BP

The BM maintains 2 variables for each frame F: *pin count* and *dirty*
- *pin_count*
	- number of current users (i.e. requests of the page in F that have not been released yet)
	- only frames with pin_count 0 can be chosen as replacement frames 
- *dirty*
	- boolean value indicating whether the page in F has been changed since being brought into F
 
Workflow:
- a higher level L in the DBMS asks the BM for page P 
- the BM checks whether P is in the BP
	- if it is (P stored in F), it increments F's pin count
	- otherwise, the BM chooses a frame FR for replacement
		- if the BP contains multiple frames with pin_count = 0, one is chosen according to the BM's replacement policy and its pin_count is set to 1
			- if dirty(FR) = on, BM writes the page in FR to disk
		- finally, BM reads page P in frame FR
- then, the BM returns the address of the BP frame that contains P to L
- when P is no longer needed, L notifies the BM (it releases P), so F can be reused 
- if P has been modified, L notifies the BM, which propagates the changes in F to the disk
### replacement policies 

(revisit [[Memory#Replacement policies]])

- *Least Recently Used (LRU)*
	- queue of pointers to frames with pin_count = 0 
	- a frame is added to the end of the queue when its pin_count becomes 0 
	- the frame at the head of the queue is chosen for replacement 
- *Most Recently Used (MRU)*
	- stack of pointers...
- *random*
- *Clock Replacement*
	- a variant of LRU
	- Iterate through the frames in the BP. Keep track of the current index. 
	- Skip frames that are currently in use
	- If a frame has just been emptied, mark it as a candidate for the next iteration
	- If a frame is neither currently in use nor has been freed in the current iteration, it may be chosen for replacement

### prefetching 
DBMSs can anticipate the next several page requests for operations with a known page access pattern, like sequential scans. The BM will bring said pages in the BP before they are requested. This is called *prefetching*.

Contiguous prefetched pages lead to faster reading (than reading the same pages at different times).
Non-contiguous pages determine an access order that minimises seek times and rotational delays.

### WAL 
The **WAL Protocol** - first write log records describing page changes, then write the modified page

## Files of Records

Higher level layers in the DBMS treat *pages as collections of records* (or files of records). A file or records may contain one or more pages.
Every record has an identifier (rid). Given the rid of a record, one can identify the page that contains it.
### File formats
Some examples of file formats are: **heap files**, **sorted files**, **hashed files**
#### heap files 
- the simplest file structure
- records are not ordered
- supported operations:
	- create file
	- destroy file
	- insert a record
	- retrieve a record given its rid
	- delete a record given its rid 
	- scan all records

Heap files can be implemented in multiple ways: *linked lists*, *directory of pages*
##### linked list 
- a DLL of pages is used
- the DBMS stores the address of the first page (header page) of each file (a table holding pairs of the form \<heap_file_name, page1_address\>)
- 2 lists are used: one with pages with free space and one with full pages

the drawback to the linked list is that most of the pages will be in the list of pages with free space. thus, when adding a record, multiple pages will have to be checked until one is found that has enough free space 

##### directory of pages
DBMS stores the location of the header page for each heap file . 

A *directory* is a collection of pages (can be a linked list, for instance). 
Each directory entry identifies a page in the file. 

The directory entry size is much smaller than the size of that file.

Free space management:
- each directory entry has a bit that indicates whether the corresponding page has free space
- there's also a counter for the available space on the corresponding page, thus making the search of pages more efficient

#### Sorted files 
Suitable when data must be sorted, when doing range selections 

#### Hashed files 
Files that are hashed on some fields (records are stored according to a hash function); good for equality selections.

### Record formats 
Examples: **fixed-length records**, **variable-length records**

#### fixed-length records
- each field has a fixed length
- the number of fields is also fixed
- fields are stored consecutively
- a field's address is thus easy to compute: record address + length of preceding fields

#### variable-length records
- fields have variable length (obv)
- two versions:
	- fields are stored consecutively, *separated by delimiters*; finding a field requires a record scan
	- some space at the beginning of the record is reserved for an *array of field offsets*; there is some array overhead, but it comes with the advantage of having direct access to every field

### Page Formats
A page is a collection of slots; each slot may contain one record.
The rid (record id) is a \<page id, slot number\> pair. 
## [[Indexes]]