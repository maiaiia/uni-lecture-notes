translation program that has the role of 
- checking the syntactic correctness of the code
- generating bytes


- generating an obj file
- implicitly prefixing all the offsets with one of the 3 segment registers:
	- **[[Registers#^c6b8ef|CS]]** - (ex: when using jumps, call, ret)
	- **[[Registers|SS]]** - when using EBP or ESP as a base (no matter of index or scale)
	- **[[Registers|DS]]** - for the rest of data accesses
- it basically translates everything into bytes (data segment, code segment, everything)

at assembly time, only the offsets (not the far addresses) can be computed

[ASC]