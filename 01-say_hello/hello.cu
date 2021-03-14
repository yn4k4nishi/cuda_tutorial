#include <stdio.h>
#include "hello.h"

__global__ void cuda_hello(){
    printf("Hello World from GPU!\n");
}

void hello(){
    cuda_hello<<<2,4>>>();
    cudaDeviceSynchronize();
}
