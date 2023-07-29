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

- At any time in SISD, only one instruction is executed, while most computer now are SIMD architecture
- SIMD uses one control unit to control multiple processing units, and each processing unit executes the same instruction
- MMX instruction set is a SIMD instruction set
- SSE/SSE2/SSE3/SSE4 are SIMD instruction sets, SSE is mainly used for floating point operations, and SSE2 is mainly used for integer operations, and SSE3 is mainly used for string operations
- AVX is a SIMD instruction set, and it is an extension of SSE, it adds prefix VEX to SSE instructions, and it adds 256-bit registers
- AVX2 is a SIMD instruction set, and it is an extension of AVX, it adds 256-bit integer operations
- AVX512 is a SIMD instruction set, and it is an extension of AVX2, it adds 512-bit registers
  In SPMD, each thread executes the same code but operates on a different piece of data
  In MPMD, each thread executes a different code with different data
  ![SISD](https://i.imgur.com/sRCmhUw.png)

### 向量寄存器

- SSE 和 AVX 各自有 16 个寄存器，SSE 的 16 个寄存器为 XMM0 - XMM15，XMM 是 128 位寄存器，而 YMM 是 256 位寄存器。XMM 寄存器也可以用于使用类似 x86-SSE 的单精度值或者双精度值执行标量浮点运算。

- 支持 AVX 的 x86-64 处理器包含 16 个 256 位大小的寄存器，名为 YMM0 ~ YMM15。每个 YMM 寄存器的低阶 128 位的别名是相对应的 XMM 寄存器。大多数 AVX 指令可以使用任何一个 XMM 或者 YMM 寄存器作为 SIMD 操作数。
- AVX512 将每个 AVX SIMD 寄存器的大小从 256 位扩展到 512 位，称为 ZMM 寄存器；符合 AVX512 标准的处理器包含 32 个 ZMM 寄存器，名为 ZMM0 ~ ZMM31。YMM 和 XMM 寄存器分别对应于每个 ZMM 寄存器的低阶 256 位和 128 位别名。AVX512 处理器还包括八个名为 K0~K7 的新的操作掩码寄存器；

### Intrinsic functions

- return type - m128 for 128bits vector, m256 for 256bits vector, m512 for 512bits vector
- vector_size - mm for 64bits, m128 for 128bits, m256 for 256bits, m512 for 512bits
- intrin_op - add, sub, mul, div, max, min, sqrt, etc.
- suffix - ps for single precision, pd for double precision, epi for integer, epi8 for 8bits integer, epi16 for 16bits integer, epi32 for 32bits integer, epi64 for 64bits integer, etc.

### Data type

- SSE 有三种类型定义 **m128, **m128d 和 \*\*m128i，分别用以表示单精度浮点型、双精度浮点型和整型。
- AVX/AVX2 有三种类型定义 **m256, **m256d 和 \*\*m256i，分别用以表示单精度浮点型、双精度浮点型和整型。
- AVX512 有三种类型定义 \*\*m512, \*\*m512d 和 \_\_512i，分别用以表示单精度浮点型、双精度浮点型和整型。

### CUDA

![CUDA](https://i.imgur.com/yxlNKaF.png)

- CUDA provides an extension to C/C++, python, fortran to program GPUs
- suitable for DNN, BLAS, FFT, etc.

##### NSYS

- nsys is a profiling tool for CUDA
- use nvcc -lineinfo to enable lineinfo
- nsys profile will generate a report file(in qdrep format)
- CUDA API 统计信息
- CUDA 核函数的统计信息
- CUDA 内存操作统计信息（时间和大小）

##### Boosting system

- Boosting system is also known as the master-slave system, consisting of CPU and GPU.

##### Example

```c
void CPUFunction()
{
  printf("This function is defined to run on the CPU.\n");
}

__global__ void GPUFunction()
{
  printf("This function is defined to run on the GPU.\n");
}

int main()
{
  CPUFunction();

  GPUFunction<<<1, 1>>>();
  cudaDeviceSynchronize();
}
```

- global indicates that the function runs on the GPU, and can be called globally(meaning it can be called from the CPU or the GPU)
- Usually, we will call the code execute on the GPU as kernel, and the code execute on the CPU as host code.
- GPUFunction<<<1, 1>>>(); means that we want to launch 1 block of 1 thread.
- cudaDeviceSynchronize(); is used to synchronize the CPU and GPU, which means that the CPU will wait for the GPU to finish its job.x
- <<< NUMBER_OF_BLOCKS, NUMBER_OF_THREADS_PER_BLOCK>>>

##### Compiling

- nvcc -arch=sm_70 -o out some-CUDA.cu -run
  - nvcc is the compiler
  - arch is the architecture of the GPU, sm_70 is the architecture of the GPU I am using
  - run is used to run the program after compiling

##### Adjusting thread

![threads](https://i.imgur.com/zWxgLgn.png)

##### Malloc

- CudaMallocManaged is used to allocate memory on the GPU
- cudaFree is used to free memory on the GPU
- cudaError_t is used to check if the memory allocation is successful
- cudaMemPrefetchAsync is used to prefetch the memory from the CPU to the GPU

##### SM and Warp

- SM is the streaming multiprocessor, which is the core of the GPU
- SM will create a warp, which is a group of 32 threads

```c
cudaDeviceProp prop;
cudaGetDeviceProperties(&prop, 0);//0 is the device number``, prop now has many useful properties


```

##### Asynchronous memory copy

- effectively reduce page fault and improve performance

##### CUDA stream

- CUDA stream is a queue of tasks that are executed in order
- default stream is stream 0, which is synchronous, meaning that the CPU will wait for the GPU to finish its job
- user can create their own stream, which is asynchronous, meaning that the CPU will not wait for the GPU to finish its job
- different streams can run concurrently
  ````c
  cudaStream_t stream;
  cudaStreamCreate(&stream);
  cudaMemcpyAsync(d_a, h_a, size, cudaMemcpyHostToDevice, stream);//copy from host to device asynchronously
  someKernel<<<1, 1, 0, stream>>>();//launch kernel asynchronously```
  阅读并应用 CUDA C 最佳实践指南介绍的技术
  虽然您已能够提高原本仅在 CPU 上运行的应用程序的性能，但您可以把加速计算再提高一步。
  ````

CUDA C 最佳实践指南是一个有效的 CUDA 编程的基本资源。在以您已学过的方式加速自己的应用程序之后，可以开始研究一下本文档，并应用其描述的技术以进一步提高应用程序的性能。

GPU 加速的实践应用
到目前为止，最佳做法是加速您自己的应用程序，但对于那些可能还没有真实用例的人，请尝试加速以下 Mandelbrot Set 模拟器。按照惯例，请采用迭代和性能分析驱动的方法。

Mandelbrot Set Simulator：这个 C ++模拟器包含一个指向应用程序详细说明的链接，可以让您直观地看到 GPU 加速的影响。
有用的资源
许多非常有才华的程序员使用 CUDA 创建高度优化的库，用于加速计算。在您自己的应用程序中有许多场景需要编写自己的 CUDA 代码，不过在编程中，通常还有许多场景其他人已经为您编写好代码了。

请仔细阅读 GPU 加速计算库，了解在何处可以使用高度优化的 CUDA 库执行诸如基本的线性代数求解器（BLAS）、图形分析、快速傅里叶变换（FFT）、随机数生成（RNG）以及图像和信号处理等任务。
