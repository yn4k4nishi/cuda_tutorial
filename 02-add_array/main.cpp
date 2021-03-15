#include <iostream>
#include <chrono>
#include "add_array.h"

int main(){
    // prepare array
    int array_len = 100000;
    int a[array_len], b[array_len], c[array_len], d[array_len];

    // initialize
    for (int i = 0; i < array_len; i++){
        a[i] = i;
        b[i] = array_len - i; 
        c[i] = 0;
    }

    /***** calc cpu *****/
    std::chrono::system_clock::time_point  start, end;
    start = std::chrono::system_clock::now();
    
    for (int i = 0; i < array_len; i++){
        d[i] = a[i] + b[i];
    }

    end = std::chrono::system_clock::now();
    double elapsed_cpu_ms = std::chrono::duration_cast<std::chrono::microseconds>(end-start).count();
    
    /***** calc gpu *****/
    start = std::chrono::system_clock::now();
    
    // add array
    add_array(array_len, a, b, c);
    
    end = std::chrono::system_clock::now();
    double elapsed_gpu_ms = std::chrono::duration_cast<std::chrono::microseconds>(end-start).count();

    // print result
    // for (int i = 0; i < array_len; i++){
    //     std::cout << a[i] << " + " << b[i] << " = " << c[i] << std::endl;
    // }

    // print time
    std::cout << "CPU Time : " << elapsed_cpu_ms << " us." << std::endl;
    std::cout << "GPU Time : " << elapsed_gpu_ms << " us." << std::endl;

    return 0;
}
