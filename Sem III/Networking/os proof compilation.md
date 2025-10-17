and headers needed of socket programming 


```c
#define _WINSOCK_DEPRECATED_NO_WARNINGS 1
// exists on all platforms
#include <stdio.h>
 
// this section will only be compiled on NON Windows platforms
#ifndef _WIN32
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netinet/ip.h>
#include <string.h>
#include <arpa/inet.h>
 
 
#include <unistd.h>
#include <errno.h>
 
#define closesocket close
typedef int SOCKET;
#else
// on Windows include and link these things
#include<WinSock2.h>
// for uint16_t an so
#include<cstdint>
 
// this is how we can link a library directly from the source code with the VC++ compiler – otherwise got o project settings and link to it explicitly
//#pragma comment(lib,"Ws2_32.lib")
#endif
```

```c
// initialize the Windows Sockets LIbrary only when compiled on Windows
#ifdef _WIN32
       WSADATA wsaData;
       if (WSAStartup(MAKEWORD(2, 2), &wsaData) < 0) {
              printf("Error initializing the Windows Sockets LIbrary");
              return -1;
       }
#endif
```

```c
#ifdef _WIN32
              err = WSAGetLastError();
#endif
```

```c
       // Release the Windows Sockets Library
#ifdef _WIN32
       WSACleanup();
#endif
```