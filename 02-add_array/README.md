## 02 array add
`/usr/local/cuda/samples`以下の`deviceQuery`を実行するとGPUの詳細がわかる
```
$ ./deviceQuery
./deviceQuery Starting...

 CUDA Device Query (Runtime API) version (CUDART static linking)

Detected 1 CUDA Capable device(s)

Device 0: "NVIDIA GeForce GTX 1660 Ti"
  CUDA Driver Version / Runtime Version          11.3 / 11.0
  CUDA Capability Major/Minor version number:    7.5
  Total amount of global memory:                 6144 MBytes (6442450944 bytes)
  (24) Multiprocessors, ( 64) CUDA Cores/MP:     1536 CUDA Cores
  GPU Max Clock rate:                            1785 MHz (1.78 GHz)
  Memory Clock rate:                             6001 Mhz
  Memory Bus Width:                              192-bit
  L2 Cache Size:                                 1572864 bytes
  Maximum Texture Dimension Size (x,y,z)         1D=(131072), 2D=(131072, 65536), 3D=(16384, 16384, 16384)
  Maximum Layered 1D Texture Size, (num) layers  1D=(32768), 2048 layers
  Maximum Layered 2D Texture Size, (num) layers  2D=(32768, 32768), 2048 layers
  Total amount of constant memory:               65536 bytes
  Total amount of shared memory per block:       49152 bytes
  Total number of registers available per block: 65536
  Warp size:                                     32
  Maximum number of threads per multiprocessor:  1024
  Maximum number of threads per block:           1024
  Max dimension size of a thread block (x,y,z): (1024, 1024, 64)
  Max dimension size of a grid size    (x,y,z): (2147483647, 65535, 65535)
  Maximum memory pitch:                          2147483647 bytes
  Texture alignment:                             512 bytes
  Concurrent copy and kernel execution:          Yes with 2 copy engine(s)
  Run time limit on kernels:                     Yes
  Integrated GPU sharing Host Memory:            No
  Support host page-locked memory mapping:       Yes
  Alignment requirement for Surfaces:            Yes
  Device has ECC support:                        Disabled
  Device supports Unified Addressing (UVA):      Yes
  Device supports Managed Memory:                Yes
  Device supports Compute Preemption:            Yes
  Supports Cooperative Kernel Launch:            Yes
  Supports MultiDevice Co-op Kernel Launch:      Yes
  Device PCI Domain ID / Bus ID / location ID:   0 / 9 / 0
  Compute Mode:
     < Default (multiple host threads can use ::cudaSetDevice() with device simultaneously) >

deviceQuery, CUDA Driver = CUDART, CUDA Driver Version = 11.3, CUDA Runtime Version = 11.0, NumDevs = 1
Result = PASS
```

よって、GTX1660Tiの場合
- 1ブロック当たりの最大スレッド数 : 1024
- ブロックの中で扱える次元数      : 1024 x 1024 x 64
- グリッドの中で扱える次元数      : 2147483647 x 65535 x 65535

最大のスレッド数は 2147483647 x 65535 x 65535 x 1024 = 10^22 

block_sizeは200までだとうまく動くが、256とかにすると恐らくメモリやレジスタが足りなくなってカーネル関数が正常に実行されない。

実行結果より、cpuの方が早い
```
CPU Time : 184 us.
GPU Time : 534238 us.
```

## 参考サイト
- [繰り返し処理をCUDAで書く（配列同士の足し算）](https://qiita.com/wazakkyd/items/8a5694e7a001465b6025)
- [CUDAでカーネル関数がスキップされる（ように見えた）](https://in-neuro.hatenablog.com/entry/2019/03/13/114731)
