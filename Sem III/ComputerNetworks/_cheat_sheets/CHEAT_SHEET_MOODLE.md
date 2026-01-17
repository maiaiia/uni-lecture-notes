---
Class: "[[ComputerNetworks]]"
date:
type: CheatSheet
---
## Subnetting 
loopback addresses are NOT private
an IP class must begin with a multiple of the class' size

Address Classes:
- A: `1.0.0.0 - 126.255.255.255`
- B: `128.0.0.0 - 191.255.255.255`
- C: `192.0.0.0 - 223.255.255.255`
- D: `224.0.0.0 - 239.255.255.255` - MULTICAST
- E: `240.0.0.0 - 255.255.255.255`

RFC 1918 specifies the following IPv4 address ranges as private:
- `10.0.0.0/8` $\rightarrow$ Class A
- `172.16.0.0/12` (`172.16.0.0` - `172.31.255.255`) $\rightarrow$ Class B
- `192.168.0.0/16` $\rightarrow$ Class C

Loopback addresses: `127.x.x.x`
When you want to check the OSI stack, ping `127.0.0.1`

### IPv4 Header
Version, Internet Header Length, DSCP, ECN, Total Length, Identification, Flags (ZF, DF, MF), Offset, Time To Live, Protocol, Checksum, Source IP, Destination IP (, Options - not mentioned in the course)

SIZE: 20 bytes (without Options. Can be at most 40 bytes )

## OSI Model

| Layer        | PDU     | Tasks                                                                                                                                                                                        |
| ------------ | ------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Application  |         | defines:<br>- the types of messages exchanged<br>- the syntax of the various message types<br>- the semantics of the fields<br>- rules for determining when and how a process sends messages |
| Presentation |         | syntax and semantics of data                                                                                                                                                                 |
| Session      |         | allows for establishing sessions (dialog control, token management, synchronisation)                                                                                                         |
| Transport    | segment | accept data from upper layers and split it into packets, ensure that packets arrive correctly to the other end<br>true end-to-end layer                                                      |
| Network      | packet  | controls the operation of a subnet, routing, congestion control, fragmentation and inter-network problems                                                                                    |
| Data-Link    | frame   | traffic regulation, error correction, access to the medium in broadcast shared communication lines                                                                                           |
| Physical     | bit     | sending raw bits over a communication channel                                                                                                                                                |

### Principles of the OSI model
1. A layer should be created where a different abstraction is needed.
2. Each layer should perform a well-defined function.
3. The function of each layer should be chosen with an eye toward defining internationally standardised protocols.
4. The layer boundaries should be chosen to minimise the information flow across the interfaces.
5. The number of layers should be large enough that distinct functions need not be thrown together in the same layer out of necessity and small enough that the architecture does not become unwieldy.

### TCP/IP Model

Layers: Application (OSI's Application, Presentation, Session), Transport, Internet (OSI's Network), Host to Network (OSI's Data-Link and Physical)

## Protocols

| PROTOCOL | LAYER       | Layer 4 Protocol | PORT NUMBER                                      |
| -------- | ----------- | ---------------- | ------------------------------------------------ |
| FTP      | Application | TCP              | 20 / 21                                          |
| SSH      | Application | TCP              | 22                                               |
| TELNET   | Application | TCP              | 23                                               |
| SMTP     | Application | TCP              | 25, 465, 587                                     |
| DNS      | Application | Mostly UDP       | 53                                               |
| DHCP     | Application | UDP              | 67 / 68                                          |
| HTTP     | Application | TCP              | 80                                               |
| POP3     | Application | TCP              | 110                                              |
| HTTPS    | Application | TCP              | 443                                              |
| IMAP     | Application | TCP              | 143 (unencrypted)<br>993 (secure over ssl / tls) |
| TCP      | Transport   | -                | -                                                |
| UDP      | Transport   | -                | -                                                |
| IP       | Network     | -                | -                                                |
| ICMP     | Network     | -                | -                                                |
| ARP      | Data-Link   | -                | -                                                |
Port Ranges:
- registered: 0 - 1023
- well-known: 1024 - 49151
- private: 49152 - 65535

### DNS (Domain Name System) - UDP 53
- Uses a tree-like structure to translate domain names (human readable) to their corresponding IP address
- Host Name + Domain Name = Fully Qualified Domain Name (FQDN)
- 
### FTP (File Transfer Protocol) - TCP 20/21
- text protocol which allows exchanging files between two machines
- uses two communication channels (hence the two ports):
	- control channel (port 21):
		- used by the client to obtain authorisation
	- data channel (port 20): 
		- used by the server to transfer a file
- has two modes:
	- active
	- passive
- it's NOT encrypted
- works with different machine architectures

>[!TODO]
>understand passive connections
### SMTP (Simple Mail Transfer Protocol) - TCP 25
- text protocol that allows for offline message exchanging
- while SMTP does the exchanging part, POP3 and IMAP perform mail reading

### HTTP (Hypertext Transfer Protocol) - TCP 80
- Allows exchange of HTML and Web data
- *stateless* (server maintains no information about past client requests)
>[!Info]
>- HTTP/1.0 is *non-persistent*: at most one object is sent over a TCP connection
>- HTTP/1.1 is *persistent*: multiple objects can be sent over a single TCP connection between client and server.

- **RTT** is a network client hint which provides the approximate round trip time on the application layer
- for non-persistent HTTP, the total response time is 2RTT + transmit time
	- one RTT to initiate TCP connection
	- one RTT for HTTP request and first few bytes of HTTP response to return
	- transmit time: file transmission time
- for persistent HTTP, the server leaves the connection open after sending a response, thus reducing the total response time to RTT + transmit time for each referenced object

>[!Info]
>Persistent servers can also work with or without pipelining. 
>- without pipelining, the client issues a new request only when the previous response has been received $\Rightarrow$ one RTT for *each referenced object*
>- with pipelining, a client sends requests as soon as it encounters a referenced object $\Rightarrow$ as little as one RTT for *all referenced objects*

- HTTP uses 2 types of messages: *request* and *response*
	- the *request* is in ASCII text (human readable) and can be a GET, POST, HEAD (HTTP/1.0), PUT or DELETE (HTTP/1.1)
	- the *response* contains a status line (protocol, status code, status phrase), the header lines and the data 

| Request | Meaning                                                      |
| ------- | ------------------------------------------------------------ |
| GET     | input is uploaded in URL field of request line               |
| POST    | input is uploaded in a form input in the web page            |
| HEAD    | asks the server to leave requested object out of response    |
| PUT     | uploads a file in entity body to path specified in URL field |
| DELETE  | deletes the file specified in the URL field                  |

| Response | Meaning                    |
| -------- | -------------------------- |
| 200      | OK                         |
| 301      | Moved Permanently          |
| 400      | Bad Request                |
| 404      | Not Found                  |
| 505      | HTTP Version Not Supported |
## TCP vs UDP

>[!TODO]
>- TCP  
>	- header
>	- 3 and 4 way handshake
>	- duplicate acknowledgement
>- UDP header
>- what is a datagram? what is a stream?

### TCP 
Uses *streams of packets*. A stream is 

### UDP

UDP writes packets of bytes.

Data size must fit into transmission unit (datagram)
### Comparison

| Characteristic          | TCP                                                                                                                                                                | UDP                                                                                      |
| ----------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ---------------------------------------------------------------------------------------- |
| header size             | 20 bytes                                                                                                                                                           | 8 bytes                                                                                  |
| header fields           | - source and dest port<br>- sequence number<br>- acknowledgement number<br>- fin, syn, ack flags<br>- window size<br>(and more...)                                 | - source and destination port<br>- length<br>- checksum<br>(these are the only 4 fields) |
| writes..                | *stream* of bytes                                                                                                                                                  | *packets* of bytes                                                                       |
| reads..                 | from the stream                                                                                                                                                    | from ONE packet                                                                          |
| bytes that are not read | stay available for the next read                                                                                                                                   | are LOST                                                                                 |
| flow                    | no overflow; traffic controlled by the OS                                                                                                                          | one party can overflow the other                                                         |
| fragmentation           | if the size of the packet is greater than the MTU (maximum transmission unit), the packet will be fragmented into multiple packets (given that DF bit is set to 0) | no fragmentation; data size must fit into transmission unit (datagram, < 64kb)           |


## Socket Programming

>[!Definition] Definition (from the lecture)
>A **socket** is a *host-local, application-created, OS-controlled* interface (a "door") into which an application process can both send and receive messages to / from another application process

| Call                | TCP Client | TCP Server | UDP Client | UDP Server |
| ------------------- | :--------: | :--------: | :--------: | :--------: |
| `socket`            |     M      |     M      |     M      |     M      |
| `bind`              |     O      |     M      |     O      |     M      |
| `listen`            |     X      |     M      |     X      |     X      |
| `connect`           |     M      |     X      |     O      |     X      |
| `accept`            |     X      |     M      |     X      |     X      |
| `send/recv`         |     O      |     O      |     X      |     X      |
| `sendto / recvfrom` |     X      |     X      |     O      |     O      |
>[!Warning] 
>Check if connect can be used in udp clients

>[!Info]
> TCP sockets are initialised with AF_INET and SOCK_STREAM
> UDP sockets are initialised with AF_INET and SOCK_DGRAM

- TCP and UDP are not the only types of sockets

|              | char | short | int | float | long long | double |
| ------------ | ---- | ----- | --- | ----- | --------- | ------ |
| Size (bytes) | 1    | 2     | 4   | 4     | 8         | 8      |

## Traceroute

>[!TODO]
>
- ti se da o retea cu routere si subretele si trebuie sa alegi ordinea ip-urilor vizitate daca executi comanda track ip route

## Network Boards
>[!TODO]

## Network Topologies 
![[CHEAT_SHEET_MOODLE 2026-01-15 16.47.19.excalidraw]]
![[star_topology]]
![[ring-topology]]
![[bus-topology]]
![[CHEAT_SHEET_MOODLE 2026-01-15 16.48.17.excalidraw]]
## Misc
hubs don't understand mac addresses 
2 computers can never have the same IP address
telefoanele mobile nu se pot conecta la Internet fara placa de retea 
CLI stands for command line interface 
TCP is sometimes faster than UDP
a hub is less performant than a switch
a web server can host multiple websites
un calculator poate avea mai multe placi de retea
o placa de retea poate avea mai multe adrese IP 
ADRESA MAC POATE FI SCHIMBATA?!??!?! aparent da
the default gateway must be in the same network as the computer (obviously)
MAC address - 48 bits
default route: 0.0.0.0 0.0.0.0

the checksum is computed on the source and destination hosts and on each router

when the congestion window is below the threshold, it grows EXPONENTIALLY

network order is big endian

## Topics to add

- bandwidth versus throughput
- SELECT 
  
## TIPS 

vezi sa nu gresesti la chestii de genul "pot exista calculatoare cu adresa 192.168.1.0". doar pt ca vezi 0 la final, nu inseamna ca aia-i adresa de retea (daca masca e /8 de ex)

when asked which ip addresses are assignable to a computer, be mindful of the following:
- the private ip ranges 
- the multicast range (224.0.0.0 - 239.255.255.255)