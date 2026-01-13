---
Class: "[[ComputerNetworks]]"
date:
type: CheatSheet
---
## Subnetting 
loopback addresses are NOT private
an IP class must begin with a multiple of the class' size

RFC 1918 specifies the following IPv4 address ranges as private:
- `10.0.0.0/8` $\rightarrow$ Class A
- `172.16.0.0/12` (`172.16.0.0` - `172.31.255.255`) $\rightarrow$ Class B
- `192.168.0.0/16` $\rightarrow$ Class C
## Protocols

| PROTOCOL | LAYER       | Layer 4 Protocol | PORT NUMBER |
| -------- | ----------- | ---------------- | ----------- |
| HTTP     | Application | TCP              | 80          |
| HTTPS    | Application | TCP              | 443         |
| ICMP     | Network     | -                | -           |
| ARP      |             |                  |             |
| FTP      | Application |                  |             |
| TCP      | Transport   | -                |             |
| UDP      | Transport   | -                |             |
| SMTP     | Application | TCP              |             |
| DNS      |             | UDP              | 53          |
| SSH      | Application |                  |             |
| IP       |             |                  |             |
## Socket Programming
connect() can be used by TCP CLIENTS. it CANNOT be used by UDP clients
recvfrom() receives data from UDP clients
listen() is for servers, not clients
bind() can be used by both TCP and UDP clients
connect() is NOT required in any TCP server

TCP sockets are initialised with AF_INET and SOCK_STREAM
UDP sockets are initialised with AF_INET and SOCK_DGRAM

- TCP and UDP are not the only types of sockets

## TCP vs UDP
TCP header: 20 bytes 
UDP header: 8 bytes 
## Misc
hubs don't understand mac addresses 
2 computers can never have the same IP address
telefoanele mobile nu se pot conecta la Internet fara placa de retea 
CLI stands for command line interface 
TCP is sometimes faster than UDP
a hub is less performant than a switch
There's no such thing as a broadcast MAC address
a web server can host multiple websites
un calculator poate avea mai multe placi de retea
o placa de retea poate avea mai multe adrese IP 
ADRESA MAC POATE FI SCHIMBATA?!??!?! aparent da
the default gateway must be in the same network as the computer (obviously)
MAC address - 48 bits
default route: 0.0.0.0 0.0.0.0

the checksum is computed on the source and destination hosts and on each router

when the congestion window is below the threshold, it grows EXPONENTIALLY
## Topics to add
- public and private IP addresses 
- IPv4 header 
- TCP  
	- header
	- 3 and 4 way handshake
- UDP header
- what is a datagram? what is a stream?
- traceroute
- bus, ring, star (network topologies)
- ADRESA MAC POATE FI SCHIMBATA?!??!?! aparent da. research that
- ti se da o retea cu routere si subretele si trebuie sa alegi ordinea ip-urilor vizitate daca executi comanda track ip route
- duplicate acknowledgement => ??
## TIPS 

vezi sa nu gresesti la chestii de genul "pot exista calculatoare cu adresa 192.168.1.0". doar pt ca vezi 0 la final, nu inseamna ca aia-i adresa de retea (daca masca e /8 de ex)

when asked which ip addresses are assignable to a computer, be mindful of the following:
- the private ip ranges 
- the multicast range (224.0.0.0 - 239.255.255.255)