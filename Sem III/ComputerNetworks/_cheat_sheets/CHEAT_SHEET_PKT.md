---
Class: "[[ComputerNetworks]]"
date:
type: CheatSheet
---
## RIP
```
router rip
version 2 
no auto-summary
network [network-ip] 

--
default-information originate -- to advertise the default gateway
```

### the `network` command

note that this command doesn't specify the networks that will be advertised; rather, it indicates the interfaces on which RIP should be enabled

additionally, the network command is classful.

## NAT 

```
-- define inside and outside interfaces (in interface config mode)
ip nat inside
ip nat outside 

-- define nat pool
ip nat pool [pool-name] [lower-address] [upper-address] netmask [netmask]

-- apply nat
ip nat inside source list [acl-name] interface [interface-name] overload --pat
ip nat inside source list [acl-name] pool [nat pool] (overload) -- dynamic nat / pat

```

## DHCP 

```
ip dhcp pool [pool-name]
dns-server [dns-server-ip]
network [ip-address] [subnet-mask]
default-router [router-ip]
--
ip dhcp excluded-address [range-start] [range-end] -- or just one address 

```

## ACL
```
ip access-list {standard [number] | extended [name]}

-- extended
permit ip [src] [wildcard] [dest] [wildcard]

-- standard
access-list [number] permit [ip] [wildcard]


```
