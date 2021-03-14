## 01 say hello to CUDA

`cudaDeviceSynchronize()`がないとhello.cu内のカーネル関数`cuda_hello`が終わる前に終了してしまうため、何も表示されない。

`cuda_hello<<<2,4>>>();`は ブロック数 x スレッド数 = 2 x 4 = 8回実行される。

```
$ ./01-say_hello/01-say_hello 
Hello World from GPU!
Hello World from GPU!
Hello World from GPU!
Hello World from GPU!
Hello World from GPU!
Hello World from GPU!
Hello World from GPU!
Hello World from GPU!
```

## 参考
- [Tutorial 01: Say Hello to CUDA](https://cuda-tutorial.readthedocs.io/en/latest/tutorials/tutorial01/)
- [並列"Hello World"から始めるCUDA入門](https://qiita.com/JmpM/items/ada670ec80be9566269e)

