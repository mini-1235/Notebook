**The most important thing is that you learn something in the long run**

### Factors Affecting Performance

![factors](https://i.imgur.com/EJeJNeS.png)

##### Models

- Compute
  - Architecture, language
  - computation graph, parallel programming
  - flynn models(SISD, SIMD, MISD, MIMD), SIMT
- Storage
  - file system, database
  - memory hierarchy
  - cache, memory, disk, network
- Networking
  - Pattern/Model: client-server, p2p

##### Software(Implementation of models)

- Host OS
- Compute library
  - Blas, FFT
  - OpenMP, pthreads, TBB, Intel MKL
- Storage software
  - File system: local, remote, distributed
  - Database: Relational, KV, Graph
- Communication library
  - MPI, OpenMP, Pthreads, TBB, Intel MKL

##### Hardware(Operated by software)

- Server
- Processing Units
  - CPU, GPU, FPGA, TPU
  - Related: Cache, Memory, Disk, Network
- Storage Hardware
  - HDD, SSD, NVMe, Tape
  - RAID
- Networking

  - Ethernet,IB
  - DPU,IPU

    !!! Example Matrix Multiplication

        Algorithm?
        <br>
        1. A = B * C(regular matrix multiplication)
        <br>
        Models?
        <br>
        1. We decide to run it in parallel
        <br>
           1. Divide into 3 small matrix multiplication
           2. Compute on 3 separate machines
           3. distribute workload & gather results
        Software?
        <br>
        For each small matrix multiplication, we use blas for efficient computing
        <br>
        For workload distributing and result gathering, we use MPI
        <br>
        Hardware?
        <br>
        We use BLAS on CPU/GPU, and MPI on Ethernet/IB
        <br>
        Physics?
        <br>
        All these hardware are prone to physical limitations, so don't let them overheat or run out of power

### Optimization

- Maximize Performance
  - Speed
  - Throughput
  - Latency
- Under limited resources
  - Power
  - Memory
  - Storage
  - Network

##### Performance test

```c++
time_t start = get_time();
for(int i=0;i<1000000;i++){
    //do something
}
time_t end = get_time();
time_t res = (end-start)/1000000;

```

##### Roofline Model

-

##### Optimization Space analysis

- Find the bottleneck
  - CPU bound
  - Memory bound
  - IO bound
  - Network bound
    **adapt to different hardware by learning**

##### Where to optimize?

- the slowest part -> the bottleneck
- Amdahl's law
  - speedup = 1/(1-p+p/s)
  - p: parallel part
  - s: speedup of parallel part
- methods:
  - profiling
  - Hardware simulator
  - trace: collecting highly detailed data about the execution of a program
    ![optimization](https://i.imgur.com/quIBjIQ.png)

##### Optimization strategies

- Trade space for time
- Parallelization
- Prefetch & prediction
  - Prefetch: load data before it is needed
  - Instruction: predict the next instruction
- Caching
  - Stores results from previous computation
- Lock-free
  - locks are needed for synchronization, however they are slow
  - use atomic primitives instead
    - CAS(compare and swap)
    - Atmoic_add
- Load balancing
  - distribute workload evenly
- Reduce precision, redundancy, branching
- Vectorization
  - SIMD
  - AVX
- GEMM
  - blocking
  - Loop unrolling
  - array packing
- Data alignment
