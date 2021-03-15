cmake_minimum_required(VERSION 2.8)

find_package(CUDA REQUIRED)
if(CUDA_FOUND)
    CUDA_ADD_LIBRARY(03-CUDA_LIB STATIC
        lbm.h
        lbm.cu
    )
endif()

add_executable(03-navier_stokes
    main.cpp
    lbm.h
)

target_link_libraries(03-navier_stokes 02-CUDA_LIB)
