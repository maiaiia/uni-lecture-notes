---
Class: "[[ComputerNetworks]]"
date: 2026-01-11
type:
---
# Exam Questions

## Subnetting

>[!Question] Write the network mask of the minimum sized network that contains both 80.81.82.83 and 80.83.84.85
>>[!Check]
>>255.252.0.0

>[!Question]- T/F A network with the netmask 255.255.255.0 has 2^8 = 256 ips

>[!Question]- T/F A network with the netmask 255.255.255.255 can have a maximum of 256 hosts

>[!Question] What is the range of network IPs in which the following given IP resides: 194.168.19.69/28?
> a. 194.167.19.68 - 194.167.19.83
> b. 194.168.19.64 - 194.168.19.79
> c. 194.168.19.64 - 194.168.19.87
> d. 194.167.19.0 - 194.167.19.15

>[!Question] How many bits of zero does the following netmask have? 255.255.255.248
> a. 4 bits 
> b. 8 bits 
> c. 3 bits 
> d. 2 bits

>[!Question] What will you get if you 'or' together the netmask of a network with one IP in that network?
> Select one or more:
>a. Nothing significant 
>b. The first IP address in the class of the given IP 
>c. The class of the IP 
>d. The last IP in the class of the given IP

>[!Question]- What is the netmask of the minimum sized network that has as broadcast 70.71.79.255 and also contains the host IP address 70.71.79.240?

>[!Question]- What is the correct binary representation of the following netmask? 255.255.255.128

>[!Question] Which of the following IP sets belong to 209.220.186.12/255.255.255.252 IP class 
> a. 209.220.186.10, 209.220.186.11, 209.220.186.12, ..., .17
> b. 209.220.186.12, ..., .18
> c. 209.220.186.13, ..., .16 
> d. 209.220.186.12, ..., .15

>[!Question]- What is the netmask of the largest network with the address 84.176.0.0? (as x.y.z.t)

>[!Question]- T/F 255.255.255.128 ends with 7 zeroes 
>TRUE

>[!Question] Which of the following addresses can be a valid host IP that can be allocated to a host:
>a. 223.245.256.17
>b. 18.19.20.255
>c. 193.231.21.0

>[!Question]- Which of the following addresses can be valid network addresses (depending on the network masks)
>a. 193.231.20.1
>b. 193.231.20.0
>c. 193.231.20.4
>d. 193.231.20.3
>193.231.20.2

>[!Question] A company has three departments: Offices (123 computers), Public (29 computers) and Managers (5 computers). The company wants you to design a network topology such that  (1) Every computer has access to the internet (2) Costs are minimised (3) It must be known with certainty from which department some webpages are accessed from the HQ in another city. Provide a good configuration for these requirements:
> a. 1 subnet for the whole company, 192.168.0.0/24. Connect computers to the internet through a router which translates every address IP to a public IP address with different class depending on the department 
> b. 3 subnets, 192.168.0.0/24, 192.168.1.0/24, 192.168.2.0/24 for every department and connect every subnet directly to the Internet, using NAT, through a different provider 
> c. 3 subnets, 192.168.0.0/25, 192.168.0.128/27, 192.168.0.160/29 and connect them to a central router which translates all the IPs on 192.168.0.0/24 with the IP 30.0.0.5
> d. 3 subnets (same as point c), one router which translates the first network to 30.0.0.1, the second to 30.0.0.2 and the third to 30.0.0.3

>[!Question]- The netmask /10 corresponds to ...

>[!Question]- which of the following are valid subnet addresses?
> a. 177.91.107.0/30
> b. 177.91.107.1/25
> c. 177.91.154.2/30
> d. 177.91.107.144/29

>[!Question] How many address / mask pairs are needed to write the range 193.226.17.224 - 193.226.23.23 in the most compact way?

>[!Question] Which of the following are valid netmasks for the IP 209.220.186.8
> a. None of the combinations are correct 
> b. 255.255.255.252
> c. 255.255.255.240
> d. 255.255.255.248

>[!Question] The natural mask for a class A address is:
> a. 256.0.0.0
> b. 255.0.0.0
> c. 255.255.255.0
> d. 255.255.0.0

>[!Question]- What is the netmask of the following IP class? 10.10.0.0/17

>[!Question]- T/F The netmask can't be calculated using the broadcast address and the network address
>

>[!Question]- What is the 4 byte netmask for the following IP network? 10.10.0.0/17

>[!Question]- Write the network mask of the minimum sized network that contains both 80.81.82.83 and 80.83.84.85

>[!Question] Which of the following addresses is a public IP address assignable to a computer?
> a. 10.5.125.4
> b. 172.16.23.201
> c. 1.0.0.1 
> d. 225.46.130.1

>[!Question] Write as \[network address]/\[xx] - in the most compact and ordered way - the address space 62.255.254.224 - 63.64.0.31
>>[!Check]-
>>62.255.254.224/27
>>62.255.255.0/8
>>63.0.0.0/10
>>63.64.0.0/27
>>


>[!Question] 255.192.0.0 is a valid netmask for the network
>Select one or more:
>a. 192.193.1.0
>b. 192.128.0.0
>c. 132.128.0.0
>d. None of the above

>[!Question]- T/F 192.168.0.255 cannot be a network address

>[!Question] How many hosts can be addressed on 10.0.0.0/16 (meaning can receive addresses i think?)

>[!Question]- T/F The netmask cannot contain 0s and 1s intercalated 
>TRUE

>[!Question] Consider the following netmask: 255.255.0.0. The network part is formed by a number of \[?] bits:
> a. Impossible to determine 
> b. 16 
> c. 24 
> d. 8

>[!Question] T/F 127.0.0.1 cannot be a broadcast address

>[!Question]- What is the broadcast address for 132.45.99.0/19?

>[!Question]- You have an interface on a router with the IP address of 192.168.192.10/29. Including the router's interface, how many hosts can have IP addresses on the LAN attached to the router interface?

>[!Question]- T/F 87.35.15.7 can be a broadcast address 

>[!Question] T/F The network address can be calculated using the broadcast address and the netmask

>[!Question] Which of the following is a private IP address?
>a. 12.0.0.2
>b. 168.172.19.40
>c. 172.15.14.36
>d. 192.168.24.43

>[!Question]- The maximum number of hosts for a class C network is ...

>[!Question] How do you find the network address if you have the network mask and one random IP address in the network?
Select one or more:
>a. You OR the netmask and the random IP
>b. You AND the netmask and the negated random IP
> c. You ADD the netmask and the random IP
> d. You AND the netmask and the random IP

>[!Question] Which of the following is the correct host range for the subnet in which we can find the IP address 192.168.168.188/255.255.255.192
>Select one or more
> a. 192.168.168.128-190
> ﻿﻿b. 192.168.168.128-192
> ﻿﻿c. 192.168.168.129-190
> d. 192.168.168.129-191

>[!Question] Which IP address is reserved for software loop-back?
> a. 255.255.255.255
> b. 127.x.y.z
> c. 224.x.y.z
> d. 0.0.0.0

>[!Question]- The netmask /30 corresponds to \[...]
>255.255.255.252

>[!Question] T/F address 192.168.1.0 can be assigned to a computer 

>[!Question] What is  the closest number to the largest routing table in the case of classful IP Addressing?
>a. 2^16
>b. 2^7 + 2^14 + 2^21
>c. 2^32
>d. 2^8 + 2^16
>>[!Check]-
>>b
## OSI Model and TCP/IP stuff

>[!Question] What is a datagram?
>a. A structure used to get data from the user in order to synchronise the server 
>b. Millions of bytes configured in a big cluster which can be easily transferred 
>c. Information that can harm your computer if you're not careful with it 
>d. A basic transfer unit used in packet-switched networks, providing a connectionless communication service

>[!Question] In TCP, bytes not read from the stream:
>a. Are lost - but their count is reported as an error to the user 
>b. Stay available for the next read 
>c. A stream does not contain bytes  
>d. Are lost

>[!Question] A switch can transport 
> a. IP packets
> b. TCP packets
> c. UDP packets

>[!Question]- T/F HTTP is a Transport layer protocol
>FALSE

>[!Question]- What does ARP stand for?
>Address Resolution Protocol

>[!Question]
> Which protocol(s) are used in the transport of PING packets (technically ICMP but whatever)
> a. UDP
> b. IP 
> c. TCP 
> d. ARP 
> e. ICMP

>[!Question]- T/F HTTP is not located in the Transport Layer

>[!Question] Which of the following cannot be a broadcast address?
> a. 21.20.19.18
> b. 10.20.30.255
> c. 192.168.1.255
> d. 20.19.18.17
> e. 22.21.20.19

>[!Question] Broadcasting is
> a. A mechanism which is used when the transmission of a packet fails
> b. When a transmitted packet is received by every machine on the network but processed by only one of them 
> c. When a transmitted packet is received and processed by every machine on the network 
> d. When a transmitted packet is received by every machine on the network but processed by none of them
>
>>[!Check]-
>>c

>[!Question] Which of the following is a correct MAC address?
> a. 12-34-56-78-90-AB-CD
> b. G2-H3-24-13-12-3E-CD
> c. G2-H3-24-13-12-3E
> d. 12-34-56-78-90-AB

>[!Question]- T/F A hub understands a MAC Address 
>FALSE

>[!Question] Which of the following is NOT a characteristic of the IP protocol?
>Select one or more:
> a. It is a connection-oriented protocol
> b. It affects packet routing 
> c. It defines the Internet addressing system 
> d. It is considered an unreliable protocol
>>[!Check]-
>>a

>[!Question] TCP and UDP are part of 
> a. Internet Layer 
> b. Link Layer 
> c. Transport Layer 
> d. Application Layer

>[!Question] What is true about ICMP packets?
> a. They are encapsulated within IP datagrams 
> b. They do not provide hosts with information about network problems 
> c. ICMP is encapsulated within UDP datagrams 
> d. They guarantee datagram delivery
>>[!Check]
>>a

>[!Question] TCP Header contains the following entries:
> a. Source Port, Destination Port, Sequence Number, Acknowledgement Number, Flags, Data Offset, Checksum, Urgent Pointer
> b. Source IP, Destination IP, Pointer to MAC address, Connection unique identifier, Router IP, NAT tables 
> c. Source Port, Destination Port, Route ID, Checksum 
> d. Source MAC, Destination MAC, Connection object, Checksum, Data hash

>[!Question] T/F bind() is required in any TCP client

>[!Question] T/F A web server can run on ports different than 80.

>[!Question] T/F A collection of computers (PCs, Workstations) and other devices interconnected represent a computer network.

>[!Question] How many different network layers are there (according to the OSI Reference Model)

>[!Question] The TTL of a packet is expressed in:
> a. milliseconds
> b. the number of routers the packet has already passed through (incremented by 1 for each router)
> c. routers / second 
> d. the number of routers the packet is allowed to pass 
> e. seconds

>[!Question] What is the difference between a switch and a hub?
>Select one or more:
>a. There is no difference 
>b. The hub sends a packet specifically to an end point or more, while the switch broadcasts the message to the entire network
>c. The switch sends a packet specifically to an end point or more, while the hub broadcasts the message to the entire network
>d. The hub can send packets on large distances, but the switch is generally for home usage

>[!Question]- T/F The MAC address has 32 bits

>[!Question] Consider a hub and 10 PCs connected to it. When PC1 sends a message to PC5, the message will be received by \[...] 
>Select one or more:
>a. all the PCs, but only PC5 will process it. The answer is sent back and received only by PC1
>b. PC5 only, and only PC5 will process it. The answer will be received and processed just by PC1
>c. all the PCs, each of them sending an answer back 
>d. all the PCs, but only PC5 will process it. The answer will also be received by all the PCs, but only PC1 will process it.

>[!Question] The ARP protocol helps with:
>a. Determining the IP address when the DNS server is known
>b. Determining the IP address when the MAC address is known 
>c. Determining the MAC address when the IP address is known 

>[!Question] A TCP connection is terminated through
>a. a 4-way handshake
>b. a 3-way handshake
>c. a 2-way handshake
>d. none of the answers are correct 
>>[!Check]-
>>a

>[!Question] Which is the correct expression for the length of UDP datagram payload?
>a. UDP length + UDP header length
>b. UDP length - UDP header length
>c. IP length + IP header length 
>d. IP length - IP header length - UDP header length
>>[!Check]-
>>d
