---
Class: "[[DBMS]]"
date: 2026-04-29
type: SelfStudy
---
# Concurrency Issues

## 1. Lost Updates 
When multiple transactions try to access and modify the same data.

## 2. Dirty Reads 
When one transaction tries to read uncommitted data

## 3. Unrepeatable Reads 
When one transaction reads some data twice, but said data is modified by a different transaction in between reads.

## 4. Phantom Reads 
Occurs when the 'where' clause of a select statement returns different results within the same transaction


