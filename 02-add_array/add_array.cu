#include <stdio.h>
#include "add_array.h"

__global__ void add_cuda(int *a, int *b, int *c){
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    c[i] = a[i] + b[i];

    printf("%d\n",i);
}

void add_array(int n, int *a, int *b, int *c){
    int *d_a, *d_b, *d_c; // pointer for GPU

    // assign GPU memory
    cudaMalloc(&d_a, n*sizeof(int));
    cudaMalloc(&d_b, n*sizeof(int));
    cudaMalloc(&d_c, n*sizeof(int));

    // memory copy from CPU to GPU
    cudaMemcpy(d_a, a, n*sizeof(int), cudaMemcpyHostToDevice);
    cudaMemcpy(d_b, b, n*sizeof(int), cudaMemcpyHostToDevice);
    cudaMemcpy(d_c, c, n*sizeof(int), cudaMemcpyHostToDevice);

    // call kernel function
    int block_size = 512;
    dim3 block(block_size,1,1);
    dim3 grid(n/block_size,1,1);

    add_cuda<<<grid, block>>>(d_a, d_b, d_c);
    cudaDeviceSynchronize();

    // memory copy from GPU to CPU
    cudaMemcpy(c, d_c, n*sizeof(int), cudaMemcpyDeviceToHost);

    // free memory
    cudaFree(d_a);
    cudaFree(d_b);
    cudaFree(d_c);
}
