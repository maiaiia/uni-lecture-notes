# Sockets
___
Class: [[Networking]]
Type: Self Study
Tags: # 
Date: October 16th, 2025
___
## Introduction
Sockets are Unix files which provide a way of communication between different programs, via file descriptors.

## Internet Sockets

There are multiple kinds of sockets, such as **DARPA Internet addresses** (*Internet Sockets*) and **Unix Sockets** (path names on a local node). Here, the former are of interest.

### Types

Some notable types of Internet sockets are: **Stream Sockets**, **Datagram Sockets** and **Raw Sockets**.

#### stream sockets

- use [[TCP]]  (and thus they are connection oriented, reliable, provide sequencing and flow control)

#### datagram sockets
- aka. *connectionless sockets*
- use [[UDP]] (and thus they are connectionless, unreliable, no sequencing, no flow control, etc. etc.)

## System Routines
- `socket()`: returns the file descriptor of a socket (socket descriptor%%duh%%)
- `send()` & `recv` : send / receive data to / from socket

>[!Tip]
>The standard `read` and `write` methods can also be used with sockets, but `send` and `recv` are preferred, because they offer much greater control over data transmission