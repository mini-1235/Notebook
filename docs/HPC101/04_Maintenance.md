### Choosing linux distribution

- 该发行版能够在今后 5 年内继续存在吗?
- 该发行版会持续有更新的安全补丁吗?
- 该发行版是否有活跃的社区和足够的文档?
- 该发行版需要基本的还是高级的 知识?

### Managing file

- /etc/passwd
  every line is a user, which is separated by `:`, and the order is: username, password, user id, group id, user description, home directory, shell
- /etc/group
  every line is a group, which is separated by `:`, and the order is: group name, password, group id, group member
- /etc/shadow
  every line is a user, which is separated by `:`, and the order is: username, password, last password change(time), minimum password age, maximum password age, password warning period, password inactivity period, account expiration date, reserved field

#### Command

- passwd [username]\
  change password
- su [username]\
  switch user(default root)
- sudo [command]\
  run command as root
- chown [parameter][username] [file]\
  change file owner
- chgrp [parameter][groupname] [file]\
  change file group

#### File system

- ext2
  - no journaling
  - no access control list
  - no extended attributes
- ext3
  - journaling
- ext4
  - journaling
  - access control list
  - extended attributes

#### File system installing and mounting

**Mount**
All files accessible in a Unix system are arranged in one big tree, the file hierarchy, rooted at /. These files can be spread out over several devices. The mount command serves to attach the file system found on some device to the big file tree.

- mount [device] [mount point]\
  mount device to mount point
- umount [mount point]\
  unmount device from mount point

```
sudo umount /mnt/mydrive
sudo umount -l /mnt/mydrive #lazy unmount
sudo umount -f /mnt/mydrive #force unmount
```

**lsblk**

```

```

1. NAME
   device name
2. MAJ:MIN
   major and minor device number
3. RM
   removable device
4. SIZE
   device size
5. RO
   read only
6. TYPE
   device type
7. MOUNTPOINT
   mount point

**df**\
df displays the amount of disk space available on the file system containing each file name argument. If no file name is given, the space available on all currently mounted file systems is shown.

```
df [parameter] [file]
```

```

```

### Linux Process Lifecycle

![Lifecycle](https://i.imgur.com/3QCS3BS.png)

- fork: create a new process with copy of parent process
- exec: read executable file and execute it in the process

#### Process management

- ps [parameter]\
  show process status, PID, UID, and so on
- top
- htop
- kill [parameter] [PID]\
  kill process

### Network

- netstat [parameter]\
  show network status
- netstat -a | grep ssh\
  show all ssh connection
- netstat -pt\
  show all tcp connection
- iptables -L -n\
  show all firewall rules

#### SSH

add following in ~/.ssh/config

```
Host host
    HostName remote
    User user
    Port port
    IdentityFile ~/.ssh/id_rsa
```

run `ssh host` to connect

### HPC cluster

##### Node

1. Entry and Management Node
2. CPU Node
3. GPU Node\

nodes are connected by network, and they share a file system

##### Network

1. IPMI management network
2. Compute network
3. Storage network

##### Storage

1. local file system
2. network file system
3. parallel file system

##### Software

1. OS
2. Intel Parallel Studio XE
3. Driver
4. Parallel file system

##### Flops

floating point operations per one second
Gflops = (boost clock)\*(core number)

##### Latency

ns,us,ms,s

##### Bandwidth

throughput = bandwidth \* latency

##### PCIe

PCIe is a high-speed serial computer expansion bus standard for attaching hardware devices to a computer. The PCIe standard is the successor to PCI and PCI-X.

###### IPMI

- ipmitool -I lanplus -H
  shows the status of the node

###### BMC

uses network to manage the node

1. watch server's temperature, fan speed, and so on
2. power on/off the server
3. log
4. remote control

##### Spack

https://spack.readthedocs.io/en/latest/getting_started.html
![](https://i.imgur.com/X0kQZDF.png)

##### Environment module

```
apt install environment-modules
module use /path/to/modulefiles #add modulefiles path to module search path
module avail #show all available modules
module load [module] #load module
module unload [module] #unload module
```

###### Slurm

- sinfo
  show node status
- sbatch
  submit a job
- srun [parameter] [command]
  run command on node
- squeue
  show job status
- scancel [job id]
  cancel job
- sinfo
  show node status
- salloc
  allocate resource
  ![](https://i.imgur.com/Osm9Lzf.png)
- qstat -f
  show job status
- sbatch -n vs sbatch -N
  -n: number of tasks
  -N: number of nodes

### HPL benchmark

##### Linpack

- measuring the floating point computing power of a computer

###### HPL algorithm

- LU decomposition
