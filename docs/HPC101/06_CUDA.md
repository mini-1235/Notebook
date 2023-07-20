### GPU

##### Von-Neumann-Architecture

- two key properties:
  - Stored Program
    - Instructions stored in a linear memory array
    - Memory is unified between instructions and data
  - Sequential Execution
    - One instruction processed at a time
    - program counter identifies the current instruction
    - Program counter is advanced sequentially except for control transfer instructions

##### Single cycle machine

- combinational logic -> sequential logic

##### Multi cycle machine

- Goal: let each instruction take the minimum amount of time required to execute
- Idea:
  - Decrease clock cycle time
  - each instruction takes as many clock cycles as it need to take
- multiple state transitions per instruction
- states followed by each instruction is different

##### Idle hardware to improve concurrency

- Goal: more concurrency -> higher instruction throughput
- Key idea: when an instruction is using some resources in its processing phase, process other instructions on idle resources not needed by that instruction
- Divide the instruction processing cycle into distinct stages of processing
- process a different instruction in each stage

##### CPU vs GPU

- CPU
  - few complex cores
  - larger cache for low memory latency
  - large and slow memory
    GPU
  - lots of simple cores
  - small cache for low memory latency
  - small and fast memory
    ![CPU vs GPU](https://i.imgur.com/XKo4KVp.png)

##### GPU computing

Key idea: use the GPU for general purpose computing
Steps:

1. CPU GPU data transfer
2. kernel execution
3. GPI CPU data transfer
   A GPU is a SIMD(SIMT) machine
   except it is not programmed using SIMD instructions

- it is programmed using threads(SPMD model)
  - each thread executes te same code but operates a different piece of data
  - each thread has its own context meaning that it can be treated/restarted/executed independently

###### SISD vs SIMD vs SPMD

In SPMD, each thread executes the same code but operates on a different piece of data
In MPMD, each thread executes a different code with different data

##### CUDA

![CUDA](https://i.imgur.com/yxlNKaF.png)
