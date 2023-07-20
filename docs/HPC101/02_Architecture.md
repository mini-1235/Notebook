### Instructions and Architecture

#### Registers

- X86-64 has 16 general purpose registers
- SIMD registers
  - 16 128-bit registers(XMM0-XMM15) - SSE Streaming SIMD Extensions
  - 16 256-bit registers(YMM0-YMM15) - AVX Advanced Vector Extensions
  - 32 512-bit registers(ZMM0-ZMM31) - AVX-512

#### Hand coded assembly

- Extended asm

  ```
  int src=1,dst;
  asm("movl %1, %%eax; movl %%eax, %0;" : "=r" (dst) : "r" (src));
  printf("dst=%d\n",dst);
  ```

- this code copies the value of src to dst

### Processor Architecture

#### what does a core do?

- OS assign a thread to it
- execute the instruction of the thread

!!! note Improvement

    Pipelining
    <br>
    Usually 10+-stage pipelined, out-of-order, multicore, hardware multithreaded, superscalar processors
    Branch Prediction
    <br>
    Fully utilizing the pipeline if guess is correct
    <br>
    In case of a wrong guess, the pipeline must be flushed and restarted(costly)
    <br>
    Out-of-order execution
    <br>
    Execute instructions in parallel if possible
    <br>
    Instrcutions that do not have dependency are still serialized to follow the program order

### Memory Hierarchy

#### Locality

- Temporal Locality

  - If a data is accessed, it is likely to be accessed again in the near future

- Spatial Locality
  - Items with nearby addresses tend to be referenced close together in time

![Memory Hierarchy](https://i.imgur.com/7Hd6s16.png)

### Concurrency Basics

- Threads in one process share all code and data, while processes have separate address spaces
- Critical Section

![Critical Section](https://i.imgur.com/yp17Fym.png)

- We are expecting 20000, however, we might get a random result
- recall that `count++` is represented as

```
mov [address of count], %eax
add $1, %eax
mov %eax, [address of count]
```

in assembly

- In the minimum count case, we could get a result of 2

![Minimum count case](https://i.imgur.com/N4RvA5K.png)

- As a review, a critical section means a block of code that only one thread of execution can enter at a time
  - Usually because it is updating a shared resource that can only be updated by one thread at a time
  - So we must guarantee mutually exclusive access to the critical section
- Solution: thread synchronization

### Advanced

##### Front End

- To reduce the complexity, x86 instructions are commonly decomposed into RISC like micro operations
- Front end also contains branch prediction unit and instruction fetch unit

##### Back End

- Processor back end that executes the micro ops
- Allocation
  - register renaming
  - re order buffer to track attributes of in flight instructions
  - Reserving resources(for load and store)
- Dynamic Scheduling
  - Micro ops are queued until ready
- In order commit

  - Leverage the order in reorder buffer

![Architecture](https://i.imgur.com/t753wVR.png)
![Architecture](https://i.imgur.com/x5r5Q69.png)

### SIMD

- Paralleize the execution in data level

##### Control Flow

- Control Divergence: control flow becomes a problem when we want to execute completely different code paths for different data elements
- Speculative execution: do computation, and void the unwanted results afterwards
  - Could go wrong if condition is some kind of boundary check
- Use SIMD only to accelerate calculating conditions
- Control signal can be either immediate or from register
- Conditional SIMD execution is supported through masking
- Dedicated opmask registers
  - one bit for each SIMD element
  - 1: corresponding element should contain new value

**Issues**

- Every new access indicates a cache miss
  - Prefetch next cacheline while processing this one
  - SIMD operations usually have large latency, so memory accesses can be hidden in the pipeline

### Multicore caching

- Different cores may want to update the same memory location or different memory locations in the same cacheline
- Cache coherence: ensure that all cores see the same value for a memory location at all times
- Two dominant types of architectures
  - Shared memory(MP)
  - Distributed memory(MPI)
- But often hierarchical of both(hybrid) in practice
  ![Hybrid](https://i.imgur.com/AVASYhG.png)

  !!! Warning

shared memory and distributed memory will be covered in later lecture
![MSI protocol](https://i.imgur.com/iKGyPVF.png)

### NUMA

![NUMA](https://i.imgur.com/LgxcoEv.png)
