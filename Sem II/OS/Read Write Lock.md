# Read Write Lock
___
Class: [[OS]]
Type: Seminar
Tags: #process_syncronization
Date: May 7th, 2025
___

rdlock - allows multiple readers, but no writers
wrlock - allows one writer only (so basically a [[mutex]])

*Starvation* occurs when the number of readers and writers is disproportionate; for instance, if there are many writers but few readers, it becomes really difficult for a reader to set a read lock.