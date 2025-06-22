# Observer
___
Class: [[OOP]]
Tags: #designPatterns 
Date: June 4th, 2025
___

Defines a one-to-many dependency between objects so that when one object changes state, all its dependents are notified and updated automatically

There are 2 key objects: **subject** and **observer**
- A subject may have many observers
- All observers are *notified* when a subject is changed
- Each observer will query the subject to synchronise its state with the subject's state

![[Screenshot 2025-06-22 at 17.52.38.png]]


So, in short:
- Subject has a list of observers and the following methods:
	- attach - add an observer
	- detach - remove an observer
	- notify - notify ALL observers about a change
- Observers have an update function