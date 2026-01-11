# Python Stuff
___
Class: [[ComputerNetworks]]
Type: Self Study
Tags: # 
Date: October 28th, 2025
___

## Sockets

```python
######## create socket ######## --> server side
rs = socket.socket(socket.AF_INET, socket.SOCK_STREAM) # rendez vous socket
rs.bind('0.0.0.0', 1234) # who can connect? + port numer
##OR
rs = socket.create_server(('0.0.0.0', 1234)) # this does both socket and bind
rs.listen(5) # wait for connections (at most 5)

client_socket, addr_client = rs.accept() # accept incoming connection
######## connect socket ######### --> client side
try:
	s = socket.create_connection('localhost', 1234) #host, port number
except socket.error as msg:
	print("Error: ", msg.strerror)
	exit(-1)

######### terminate connection ########
s.close()

```

```python
###### read stuff ######
data = s.recv(1024) # argument is number of bytes to receive
print(data.decode('ascii')) # specify how the data should be interpreted

answer = s.recv(1)
if answer == b'H': # just to highlight that the data is in binary format
	# bla bla bla
	
number = s.recv(4)
number = struct.unpack('!I', number)[0] # convert from binary to desired format
```

>[!Important] Format Characters
>
>| Format |     C Type     | Python type | Standard Size |
>| ------ | :------------: | :---------: | :-----------: |
>| `x`    |    pad byte    |  no value   |               |
>| `c`    |      char      |    bytes    |       1       |
>| `b`    |  signed char   |   integer   |       1       |
>| `h`    |     short      |   integer   |       2       |
>| `i`    |      int       |   integer   |       4       |
>| `l`    |      long      |   integer   |       4       |
>| `q`    |   long long    |   integer   |       8       |
>| `f`    |     float      |    float    |       4       |
>| `d`    |     double     |    float    |       8       |
>| `F`    | float complex  |   complex   |       8       |
>| `D`    | double complex |   complex   |      16       |
>| `s`    |    char\[]     |    bytes    |               |
>
>>[!Tip] 
>> The unsigned representation can be specified by capitalising the letter corresponding to the desired type

>[!Important]- Format Strings
>
>| Character | Byte Order    | Size     | Alignment |
>| --------- | ------------- | -------- | --------- |
>| `@`       | native        | native   | native    |
>| `=`       | native        | standard | none      |
>| `<`       | little-endian | standard | none      |
>| `>`       | big-endian    | standard | none      |
>| `!`       | network       | standard | none      |

```python
######## send stuff #######
s.sendall(b'A') # send data directly in binary format
 
s.sendall(struct.pack('!I', my_num)) # specify format and where the data is stored

message= 'this is a cool message'
s.sendall(bytes(message, 'ascii')) # to send a string of unknown length
```

```python 
###### misc #####
s.getpeername() #find who's connected on the other end

```

## Threads 

```python
##### mutexes #####
mylock = threading.lock()
# ....
mylock.acquire()
# .... atomic op
mylock.release()
```

```python
####### threads #######
t = threading.Thread(target = target_function, daemon = true)
t = threading/Thread(target = worker, args = (arg1, arg2,)) # make args into tupples

```

>[!Tip]
>setting the daemon to true when creating a thread means that the threads will automatically be cleaned up without explicit joining

