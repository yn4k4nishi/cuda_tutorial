#include <iostream>
#include "add_array.h"

int main(){
    // prepare array
    int array_len = 1000;
    int a[array_len], b[array_len], c[array_len];

    // initialize
    for (int i = 0; i < array_len; i++){
        a[i] = i;
        b[i] = array_len - i; 
        c[i] = 0;
    }
    
    // add array
    add_array(array_len, a, b, c);

    // print result
    for (int i = 0; i < array_len; i++){
        std::cout << a[i] << " + " << b[i] << " = " << c[i] << std::endl;
    }

    return 0;
}
