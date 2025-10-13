# Downcasting
___
Class: [[MAP]]
Type: 
Tags: # 
Date: October 13th, 2025
___

![[Downcasting 2025-10-13 08.44.02.excalidraw]]
```java
Base objB = new Base();
SubBase objSB1 = new SubBase;
SubBase objSB2;
objB = objSB1;
// objSB2 = objB; - compiler rejects it
objSB2 = (SubBase) objB; //downcast
```