# Read Write Lock
___
Class: [[OS]]
Type: Lecture + Seminar
Tags: #process_syncronization
Date: May 7th, 2025
___

A different type of [[Mutex|mutex]] generalisation. It works as an optimisation.

rdlock - allows multiple readers, but no writers
wrlock - allows one writer only (so basically a [[mutex]])

>[!Info]
*Starvation* occurs when the number of readers and writers is disproportionate; for instance, if there are many writers but few readers, it becomes really difficult for a reader to set a read lock.
