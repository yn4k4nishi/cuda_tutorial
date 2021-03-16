#include "lbm.h"
#include "calc.h"

__global__ void kernel_func() {
    static f[9] = {
        
    };
}

// 局所平衡分布関数を計算
float* calc_f_eq(float* v, float rho){
    e[9][2] = {{0,0},{1,0},{0,1},{-1,0},{0,-1},{1,1},{-1,1},{-1,-1},{1,-1}};
    
    float f_eq[9];
    f_eq[0] = 4.0/ 9.0 * rho * (1.0 - 3.0/2.0*(dot(2,v,v)) + 3.0*dot(2,e[0],v) + 9.0/2.0*(dot(2,e[0],v))*(dot(2,e[0],v)) );
    f_eq[1] = 1.0/ 9.0 * rho * (1.0 - 3.0/2.0*(dot(2,v,v)) + 3.0*dot(2,e[1],v) + 9.0/2.0*(dot(2,e[1],v))*(dot(2,e[1],v)) );
    f_eq[2] = 1.0/ 9.0 * rho * (1.0 - 3.0/2.0*(dot(2,v,v)) + 3.0*dot(2,e[2],v) + 9.0/2.0*(dot(2,e[2],v))*(dot(2,e[2],v)) );
    f_eq[3] = 1.0/ 9.0 * rho * (1.0 - 3.0/2.0*(dot(2,v,v)) + 3.0*dot(2,e[3],v) + 9.0/2.0*(dot(2,e[3],v))*(dot(2,e[3],v)) );
    f_eq[4] = 1.0/ 9.0 * rho * (1.0 - 3.0/2.0*(dot(2,v,v)) + 3.0*dot(2,e[4],v) + 9.0/2.0*(dot(2,e[4],v))*(dot(2,e[4],v)) );
    f_eq[5] = 1.0/36.0 * rho * (1.0 - 3.0/2.0*(dot(2,v,v)) + 3.0*dot(2,e[5],v) + 9.0/2.0*(dot(2,e[5],v))*(dot(2,e[5],v)) );
    f_eq[6] = 1.0/36.0 * rho * (1.0 - 3.0/2.0*(dot(2,v,v)) + 3.0*dot(2,e[6],v) + 9.0/2.0*(dot(2,e[6],v))*(dot(2,e[6],v)) );
    f_eq[7] = 1.0/36.0 * rho * (1.0 - 3.0/2.0*(dot(2,v,v)) + 3.0*dot(2,e[7],v) + 9.0/2.0*(dot(2,e[7],v))*(dot(2,e[7],v)) );
    f_eq[7] = 1.0/36.0 * rho * (1.0 - 3.0/2.0*(dot(2,v,v)) + 3.0*dot(2,e[8],v) + 9.0/2.0*(dot(2,e[8],v))*(dot(2,e[8],v)) );

    return f_eq;
}

// 密度rhoの計算
float calc_rho(float* f){
    float rho = 0.0;
    for(int i=0; i<9; i++){
        rho += f[i];
    }
    return rho;
}

// 流速vの計算
float* calc_v(float delta_r, float delta_time, float rho, float* f){
    float v[2] = {0.0, 0.0};
    float c = delta_r / delta_time;
    e[9][2] = {{0,0},{1,0},{0,1},{-1,0},{0,-1},{1,1},{-1,1},{-1,-1},{1,-1}};

    for(int i=0; i<9; i++){
        v[0] += c / rho * f[i] * e[i][0];
        v[1] += c / rho * f[i] * e[i][1];
    }

    return v;
}

void streaming(){

}

void apply_boundary_conditions(){

}

void collision(){

}

void lbm_d2q9(){
    float cabinet_size = 1.0; // 正方キャビネットの辺の長さ[m]

    int lattice_num = 1000; // 1辺の格子点の数

    float delta_r = cabinet_size / (float)(lattice_num - 1 ); // 離散化間隔[m]
    float delta_time = 0.1;                                      // 離散化間隔[sec]

    dim3 block(10, 1, 1);
    dim3 grid(lattice_num*lattice_num/block.x)

    streaming();
    apply_boundary_conditions();
    collision();

}

