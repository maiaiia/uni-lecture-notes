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

### structs and data handling

```c
struct sockaddr {
	unsigned short    sa_family;    //address family, usually AF_INET
	char              sa_data[14];  //14 bytes of protocol address
};
```

>[!Info]
>`sa_data` contains a destination address and port number for the socket

```c
struct sockaddr_in {
	int16_t           sin_family;   // address family
	uint16            sin_port;     // port number
	struct in_addr    sin_addr;     // internet address
	unsigned char     sin_zero[8];  // padding --> same size as struct sockaddr
};
```

>[!Important]
>The `sin_zero[8]` field is used to pad the structure to the length of a `struct sockaddr`. It should be set to all zeros!!!

In C, a pointer to a `struct sockaddr_in` can be cast to a pointer to a `struct sockaddr` and vice-versa.

## Sending Data Through Sockets

Different machines may store numbers internally in either [[Little Endian ]] or Big Endian. This can be an issue when sending data through sockets, which is why the convention is that regardless of the **Host Byte Order**, *the **Network Byte Order** is in Big-Endian*.

Thus, whenever data (longer than than one byte)[^2] is sent to / read from a socket, it must be [[#converting byte orders|converted accordingly]].

>[!Info]
>The `sin_addr` and `sin_port` of a `struct sockaddr_in` need to be in Network Byte Order, because they get encapsulated in a packet and sent over the network. However, the `sin_family` field is *only used by the kernel* (i.e. not sent out on the network) to identify the type of addresses that the structure contains, so it must!! be in Host Byte Order!!!!!!

[^2]: converting to / from network order is not necessary when sending a char, for instance, since both its little and big endian representations coincide
## System Routines

### reading / writing
- `socket()`: returns the file descriptor of a socket (socket descriptor%%duh%%)
- `send()` & `recv` : send / receive data to / from socket[^1]

[^1]: the standard `read` and `write` methods can also be used with sockets, but `send` and `recv` are preferred, because they offer much greater control over data transmission
### converting byte orders
- `htons()` / `htonl()`: convert a short / long from host to network byte order
- `ntohs()` / `htonl()`: convert a short / long from network to host byte order


