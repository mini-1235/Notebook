### What is vectorization programming?

- Array Programming, do calculation directly on arrays
- Automatic/Manual Vectorization (Compiler Optimization/Manual Optimization)

### Array Programming

#### With C?

- low efficiency
- need function to do calculation on each element

#### Solution?

- Use third-party library
  - [NumPy](https://numpy.org/)
  - [Eigen](http://eigen.tuxfamily.org/index.php?title=Main_Page)
  - [Armadillo](http://arma.sourceforge.net/)
  - [Blaze](https://bitbucket.org/blaze-lib/blaze/src/master/)
  <!-- - [xtensor]( -->
- Use third party library **abstractly**
  - TVM (Tensor Virtual Machine)
  - triton
  - High level language to high level language

##### Benefits

- High efficiency
- Easy to move to another program

### Numpy

- Parallel: using multiple cores
- SIMD: using SIMD processor to speed up
- No for loop: using vectorization to speed up
- Loop unrolling: avoid branch prediction https://zhuanlan.zhihu.com/p/37582101
- Vectorization: multiple values are being calculated in once instead of one by one
- 分块矩阵乘法
- 数组封装

#### Numpy api

- Create a matrix

```python
np.array([1,2,3],[4,5,6])
np.dtype==np.int32
np.shape==2,3
np.zeros((2,3))#create a matrix with all 0 2 rows 3 columns
np.ones((2,3))#create a matrix with all 1 2 rows 3 columns
np.full((2,3),7)#create a matrix with all 7 2 rows 3 columns
np.eye(3)#create a identity matrix 3 rows 3 columns
np.empty((3,2))#create a matrix with random value 3 rows 2 columns
```

- Create arange array
  np.arange(start,end,step)

```python
np.arange(10)#create a array with 0 to 9
np.arange(2,10)#create a array with 2 to 9
np.arange(2,10,2)#create a array with 2 to 9 step 2
```

np.linspace(start,end,num)\
rand randint uniform randn normal....
**better method**

```python
rng = np.random.default_rng()
rng.integers(0, 10, size=(2, 5))#create a array with 0 to 9 2 rows 5 columns
rng.random((2, 3))#create a array with random value 2 rows 3 columns
```

```python
np.linspace(0,10,5)#create a array with 0 to 10 5 elements
```

- reshape() to adjust the shape of array
- shape() to get the shape of array
- ndim() to get the dimension of array
- when creating an array, it actually creates a type of ndarray(n-dimension array)

##### List

- python list is implemented by pointers
- append at O(1)
- while numpy array append needs O(n)

![list](https://i.imgur.com/NeysKDE.png)

- python list can store different types of data because it uses pointers
- But this is bad for scientific computing because it needs to search for the address of the data
- one time for finding the pointer address, after finding the pointer, it needs to find the real value
- If the data is stored in a continuous memory, it will be much faster, then cache can get continuous data at once, instead of getting data one by one
- converting can be done using astype()

##### Copy and View

- copy() will create a new array

```python
#list
a = [1,2,3]
b = a #no copy
c = a[:] #copy
d = a.copy() #copy
#numpy
a = np.array([1,2,3])
b = a #no copy
c = a[:] #no copy
d = a.copy() #copy
```

##### Boolean indexing

- any()
- all()

##### Flattening to 1D

- flatten()
- reshape(-1)
- ravel(r)

##### Merge

- vstack()
- hstack()
- concatenate()
- tile()
- repeat()

##### Arithmetic

- np.dot()
- np.cross()
- np.sin()
- np.hypot()
- np.floor()
- np.ceil()
- np.round()
- axis=0 row
- axis=1 column

##### Tradeoff

- python list is more flexible
- numpy array is more efficient
- tradeoff between flexibility and efficiency!

##### Computation graph

50~100ns for one visit to RAM
0.5 ns for a 2GHz cycle

Automatic/Manual Vectorization

##### 数据个数=加速倍数？

- 很自然的会认为，SIMD 指令同时操作 2 个数据，那加速比就该是 2
- 事实上很复杂：内存带宽使用，解码消耗减小等等，你很难说清楚，具体问题具体分析，但可以使用倍数估算
- 当作为整体代码一部分时，情况就更加复杂了
- 甚至可能提供的 AVX2 指令实际上是由 2 条 AVX 指令模拟出来的

**More importantly, instructions is not the longer the better, for example, AVX512 might not be better than AV2!**

##### Documentation

https://www.intel.com/content/www/us/en/docs/intrinsics-guide/index.html#

- even branch can be vectorized, but will reduce readability
- data alignment
- number of registers
- Usually automatic vectorization like -O3 -mavx2 is enough
- But if code is complicated, and hard to decide branch, then it is better to do manual vectorization
