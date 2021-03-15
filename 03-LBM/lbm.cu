#include "lbm.h"

__global__ void kernel_func() {
    
}

void lbm_d2q9(){
    float cabinet_size = 1.0; // 正方キャビネットの辺の長さ[m]

    int lattice_num = 100; // 1辺の格子点の数

    float delta_r = cabinet_size / (float)lattice_num; // 離散化間隔[m]
    float delta_t = 0.1;                               // 離散化間隔[sec]

    dim3 block(9, 1, 1);
    dim3 grid()

}

