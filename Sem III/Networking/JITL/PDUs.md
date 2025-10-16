# Protocol Data Units

![[pdu-diagram|pdu-diagram]]
## Ethernet Frames
![[ethernet-frame]]
>[!Warning]
>The Preamble and SFD are usually not considered part of the Ethernet header, although they are sent with every frame

The minimum size for an Ethernet Frame (Header + Payload (Packet) + Trailer) is **64 bytes** (Preamble and SFD not considered). Therefore, the minimum payload (packet) size is **46 bytes**. If the payload is less than that, **padding bytes** are added. The value of a padding byte is always 0.

>[!info] Frame Types
>**Unicast** frames are frames destined for a *single target*

### Header

| Preamble + SFD                                                                                                     | Destination                                      | Source                                           | Type / Length                                                                                                      |
| ------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------ | ------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------ |
| Used for synchronisation<br>Allow the receiving device to be prepared to receive the rest of the data in the frame | MAC address of the device *to receive* the frame | MAC address of the device which *sent* the frame | Contains the *layer 3 protocol* used in the packet (usually IPv3 or IPv4) and sometimes the *length* of the packet |
#### Preamble
- length: 7 bytes 
- each byte has the following pattern: 10101010
- allows devices to synchronise their receiver clocks
#### SFD
- Start Frame Delimiter
- length: 1 byte
- pattern: 10101011
- marks the end of the preamble and the beginning of the rest of the frame

#### Destination & Source
- indicate the MAC addresses of the devices sending and receiving the frame
#### Type / Length 
- length: 2 bytes
>[!tip]
>if the value in the last field is *1500 or less*, then it indicates the *length* of the encapsulated packet (in bytes).
>Otherwise, it indicates the *type* of the encapsulated packet (usually either IPv4 or IPv6)
>- Example: 
>	- $0x0800=0d2048 \rightarrow$ IPv6; 
>	- $0x86DD=0d34525 \rightarrow$ IPv6

### Trailer
#### FCS
- Frame Check Sequence
- length: 4 bytes
- Detects corrupted data by running a *CRC* (Cyclic Redundancy Check) *algorithm*
## Packet

### The life of a packet
![[network-topology-example]]
1. PC1 wants to send data to PC4.
2. It notices that the destination is *outside its local network*, so it sends it to its (preconfigured) default gateway - R1 in this case
3. In case PC1 has not sent anything to R1 yet, ARP / NDP is used in order to discover the gateway's MAC address. 
	1. PC1 creates an ARP Request frame, containing
		- L3: source and destination IP correspond to IP addresses of PC1 and R1 respectively
		- L2: source MAC is the MAC address of PC1; destination MAC is the *broadcast MAC address* (FFFF.FFFF.FFFF)
	2. SW1 floods the frame yada yada the MAC address of R1 is revealed to PC1 via the ARP Reply
4. Now, PC1 sends the packet to R1. Note that the packet is encapsulated and sent as a frame, which contains in its header the MAC address of PC1 and the MAC address of the *default gateway* (R1), **NOT** the MAC address of PC4
5. R1 checks its routing table in order to find the *most specific match* for the IP address of the destination. 
	1. In case there are no matches, R1 **drops** the packet.
	2. Otherwise, R1 *encapsulates* the packet with a frame having the appropriate MAC address for the IP of the *next hop* 
		- Note that in case R1 does not know the MAC address of the next hop, it uses ARP to get it
6. Similarly, R2 may use ARP to discover the MAC address of R4
7. Same goes for R4, it may use ARP to discover the MAC address of PC4
8. Finally, R4 encapsulates the packet in a frame having the source MAC address be the MAC address associated with the interface used for sending the packet (here denoted by fffe) and the destination be PC4's MAC address (4444). 

>[!Important]
>- note that throughout this whole process, the source and destination MAC addresses used in the frames that encapsulate the packet are constantly changing, according to the current sender and destination.
>- the source and destination IP addresses within the packet, however, are not tampered with at all
>- the switches don't modify the frames at any point (meaning that they don't de-encapsulate and then re-encapsulate the packet with a new ethernet header)


