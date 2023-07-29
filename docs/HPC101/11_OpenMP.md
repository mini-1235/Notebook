!!! Note

    programs are written in a sequential programming language, but executed in parallel
    <br>
    Data exchange is the key for design of applications, sending/receiving data at specific times in the program
    <a href="https://mpi.deino.net/">https://mpi.deino.net/</a>

### OpenMP(Open Multi-Processing)

- used for shared memory parallel programming, multi-threading

##### Shared memory

**UMA**
**NUMA**

### OpenMPI(Open Message Passing Interface)

- a standardized and portable message-passing system designed to function on a wide variety of parallel computers
- standard defines the syntax and semantics of a core of library routines useful to a wide range of users writing portable message-passing programs in C, C++, and Fortran
- "Communication Library" abstracting from low level network view
- supports different ways of communication
- MPI is not designed to handle any communication in computer networks and is thus a very special kind of library for scientific computing

##### Message Passing

- Broadcast(one to many)
  - distributes the same data to many or even all other processors
- Scatter (one to many)
  - distributes different data to many or even all other processors
- Gather(many to one)
  - collects data from many or even all other processors
- Reduce(many to one)
  - collects data from many or even all other processors and combines them into one result
  - Sum, min, max

MPI_COMM_WORLD communicator constant denotes the region of communication, here all processes
https://www.codingame.com/playgrounds/349/introduction-to-mpi/introduction-to-distributed-computing

- MPI_COMM_WORLD is a communicator that contains all the processes that were initially spawned when the program started
- Create subgroups of processes
  - MPI_Comm_split
  - MPI_Comm_create
  - MPI_Comm_dup
- MPI comm rank is a unique identifier for each process
- Different MPI communicators are often used in applications

##### Point to point communication

- ping pong example

##### Collective communication
