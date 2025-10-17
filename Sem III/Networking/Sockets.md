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

### Data Formats

Different machines may store numbers internally in either [[Little Endian ]] or Big Endian. This can be an issue when sending data through sockets, which is why the convention is that regardless of the **Host Byte Order**, *the **Network Byte Order** is in Big-Endian*.

Thus, whenever data (longer than than one byte)[^2] is sent to / read from a socket, it must be [[#converting byte orders|converted accordingly]].

>[!Info]
>The `sin_addr` and `sin_port` of a `struct sockaddr_in` need to be in Network Byte Order, because they *get encapsulated in a packet and sent over the network*. However, the `sin_family` field is *only used by the kernel* (i.e. not sent out on the network) to identify the type of addresses that the structure contains, so it must!! be in Host Byte Order!!!!!!

[^2]: converting to / from network order is not necessary when sending a char, for instance, since both its little and big endian representations coincide

### System Routines in C

#### initialisation

- `socket(int domain, int type, int protocol)`: returns the file descriptor of a socket (socket descriptor%%duh%%) or -1 on error
	- *domain*: `AF_INET` (address family internet) or others
	- *type*: `SOCK_STREAM`, `SOCK_DIAGRAM` etc.
	- *protocol*: set to `0` in order to have the function choose the correct protocol based on the *type*
- `bind(int sockfd, struct sockaddr *my_addr, int addrlen)`: associate a socket with a port on the local machine
	- *sockfd*: socket (file) descriptor
	- *my_addr*: pointer to a `struct sockaddr` with all relevant info
	- *addrlen*: set to `sizeof(struct sockaddr)`
- `connect(int sockfd, struct sockaddr *serv_addr, int addrlen)`: connect to a remote host
- `listen(int sockfd, int backlog)`: wait for 
	- *backlog*: number of connections allowed on the incoming queue
- `accept(int sockfd, void *addr, int *addrlen)`
	- *sockfd* is the listening socket descriptor
	- *addr* is usually a pointer to a local `struct sockaddr_in`, and it's where the info about the incoming connection will go
	- *addrlen*: should be `sizeof(sockaddr_in)`
	- **returns a socket descriptor** that can be used for reading and writing
#### reading / writing
- `send()` & `recv` : send / receive data to / from connected datagram socket[^1]
	- `send(int sockfd, const void *msg, int len, int flags)`
	- `recv(int sockfd, void *buf, int len, unsigned int flags)`

>[!Tip]
>just set flags to 0

- `sendto()` & `recvfrom()`: send to / receive data from unconnected datagram socket
	- `sendto(int sockfd, const void *msg, int len, unsigned int flats, const struct sockaddr *to, int tolen)`
		- *to*: pointer to a `struct sockaddr` with the destination IP address and port 
		- *tolen*: set to `sizeof(struct sockaddr)`
	- `recvfrom(int sockfd, void *bug, int len, unsigned int flags, struct sockaddr *from, int *fromlen)`


[^1]: the standard `read` and `write` methods can also be used with sockets, but `send` and `recv` are preferred, because they offer much greater control over data transmission
#### converting byte orders 
- `htons()` / `htonl()`: convert a short / long from host to network byte order
- `ntohs()` / `htonl()`: convert a short / long from network to host byte order
#### IP address handling

- `inet_addr(IP_ADDRESS)`: 
	- converts an IP address into an unsigned long
	- returns $-1$ (translated to $255.255.255.255$, i.e. the broadcast address) on error
- `inet_aton(const char *cp, struct in_addr *inp)`: 
	- directly loads the ip address
	- returns zero on failure
- `inet_ntoa(IP_ADDR)`: convers an IP address from binary network byte order to ascii representation

>[!Info]
> `inet_addr` automatically converts the provided IP address to its corresponding Network Byte Order
### Program Flow

1. create a `struct sockaddr_in` object and set its fields accordingly
2. get the socket descriptor via the `socket` command
3. `bind` the socket with the `struct sockaddr_in` object (in fact, it binds the socket with the port number stored in the sockaddr_in object)
4. 

