# Python Stuff
___
Class: [[Networking]]
Type: Self Study
Tags: # 
Date: October 28th, 2025
___

## Sockets

```python
######## create socket ######## --> server side
rs = socket.socket(socket.AF_INET, socket.SOCK_STREAM) # rendez vous socket
rs.bind('0.0.0.0', 1234) # who can connect? + port numer
rs.listen(5) # wait for connections (at most 5)

client_socket, addrc = rs.accept() # accept incoming connection
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