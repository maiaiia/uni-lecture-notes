# The Producer / Consumer Problem
___
Class: [[OS]]
Type: Problem
___

>[!Warning] Exam material!

There are a bunch of threads and a bunch of bytes to be written to and read from a pipe.

Let the buffer size be `n`. Initialize 2 semaphores: `F(ull) = 0` and `E(mpty) = n`. Let X = 1 be the position where data is produced.

| Producer                                              | Consumer                                              |
| ----------------------------------------------------- | ----------------------------------------------------- |
| wait(E)<br>lock(X)<br>produce<br>unlock(X)<br>post(F) | wait(F)<br>lock(X)<br>consume<br>unlock(X)<br>post(E) |
