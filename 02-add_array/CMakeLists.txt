cmake_minimum_required(VERSION 2.8)

find_package(CUDA REQUIRED)
if(CUDA_FOUND)
    CUDA_ADD_LIBRARY(02-CUDA_LIB STATIC
        add_array.cu
        add_array.h
    )
endif()

add_executable(02-add_array
    main.cpp
    add_array.h
)

target_link_libraries(02-add_array 02-CUDA_LIB)
