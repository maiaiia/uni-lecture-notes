# Miscellaneous 
---

There are 3 basic data structures in every programming language
- stack - LIFO
- queue - FIFO
- heap - memory space, based on addresses, good for working with pointers and dynamic variables

instructions also have addresses 


there are 4 types of segments
at any moment, only one segment of every type can be active

the name of an array in C is the starting address

base 16: compressed version of base 2


$ - last address in memory


 FS, GS are 32-bit extensions


[[Addresses]]
for the purpose of backwards compatibility, we must work in a 2-step addresing 

the chief in charge on 16 bits programming is the programmer
on 32 bits, it's the operating system 

!! on real mode (16 bits), the interrupt system is not protected at all --> risk viruses

the reading and writing instructions are specific to the operating system (IO functions are never part of the standard of a language)

--
dereferencing is not an pointer arithmetic operation

--
on windows, DS, ES, CS, SS  are set to 0 by default

--
>[!important] in NASM, the segment names are FAR addresses 

-- 
before runtime, there is a step called the loading time
during this step, the os finds places in memory (not necessarily contiguous) to add the program to
the segment is not known before the loading time 

--
offsets and code labels are computable at assembly time and they remain the same throughout the whole program's runtime

-- 
any offset must reach the processor as a full FAR address

--
direct addressing - determinable at assembly time
indirect addressing - not determinable at assembly time

>[!important] offsets are not always determinable at assembly time! (ex: when computed using indirect addressing)

-- 
for the sake of backwards compatibility, one can also push 16 bits on the stack, but it is not recommended

!! YOU CAN NEVER OUSH 8 BITS on the stack!!! only 16 (backwards compatibility) or 32 bits

--
when working with offsets that can be computed at assembly time, their labels won't be shown in the debugger

-- 
even on 32 bits, an offset can have 16 bits (backwards compatibility reasons)

--
things like push \[v] and pop \[v] do work, although both operands are from memory, because the destination of the top of the stack doesn t have to be computed; esp always points to it

-- 
address relocation table - far addresses

-- 
db, dw, dd sunt doar directive de definire, insa the data labels sunt doar asta, labels, nu au dimensiuni asociate. directivele doar arata cum sa fie populata memoria

--
when performing >>, the sign is maintained
this is why mov al, -1>> (any value) will always be -1

shr, however, puts zeros in place of the replaced positions
sar puts the sign bit in place

--
mov does not change any flag

-- 
when performing divisions, the higher part of the original contains the *remainder* of the operation

-- 
Conversion instructions are *destructive* 

-- 
one cannot write loops of over 127 bytes (the content between the definition and the call of the loop)

-- 
loop does not change the flags!!!! (even when ebx becomes 0 (?) - check in the assambler)

--
when defining strings, they are fist moved to the constant table (little endian), and then in memory (little endian again), so it looks 

--
alt segment - aici -> ok!
aici - alt segment -> syntax error!

>[!important] for div and mul, the 2nd operand cannot be an immediate value

-- 

there are 2 types of conversions (with or without data-loss)

--
~: flips every bit 
!: non-zero value -> 0 and zero-value -> 1

-- 
parameters are pushed on the stack in reverse order due to the nature of C, which allows a variable number of parameters in a function (so the first parameter of the function call is always at the top of the stack)