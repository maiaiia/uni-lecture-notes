# File Permissions
___
Class: [[OS]]
Type: Lecture
Tags: # 
Date: March 6th, 2025
___

Entities: user, group, other
Each entity can have the following permissions: *r*(ead), *w*(rite), (e)*x*(ecute)
For each entity, the permissions can be specified in octal 

Example: `chmod 701 file.txt` changes the permissions of `file.txt` to:
user: rwx
group: ---
other: --x
