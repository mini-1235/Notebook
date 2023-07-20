### Position of HPC in today's world

- Neural Science
- Data Science
- Machine Learning
- HPC is based on computing resources that enable the efficient use of parallel computing techniques through specific support with hardware such as high performance **cpu/core interconnections**
- High Throughtput Computing is based on commonly available computing resources such as commodity PCs and small clusters that enable the execution of farming hobs **without** providing a high performance interconnection network

### FLOPS (floating point operations per one second)

- 1 GigaFlop = $10^9$ FLOPS
- 1 TeraFlop = $10^{12}$ FLOPS
- 1 PetaFlop = $10^{15}$ FLOPS
- 1 ExaFlop = $10^{18}$ FLOPS

### What is HPC

- HPC includes work on **four basic building blocks**
  - theory
  - technology
  - architecture
  - software

### GPU acceleration

- GPUs can have 128 cores on one single GPU chip
- GPU are designed to compute large number of floating point operation

### Scheduling Principles

- HPC systems are usually not used in an interactive way
  - Program applications start processes
  - Users of HPC systems send job scripts
  - Scheduling enable the sharing of the HPC system with other users
- First come First serve
  - queues processes in the order they arrive
- Backfilling
  - Scheduler searches for jobs that can be run in the time before the next job in the queue
  - Enable to maximize cluster utilization
  - job should not be delayed b/c of backfilling
