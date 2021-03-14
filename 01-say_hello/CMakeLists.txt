cmake_minimum_required(VERSION 2.8)

find_package(CUDA REQUIRED)
if(CUDA_FOUND)
    message("Cuda version: " ${CUDA_VERSION})
    CUDA_ADD_LIBRARY(01-CUDA_LIB STATIC
        hello.cu
        hello.h
    )
endif()

add_executable(01-say_hello
    main.cpp
    hello.h
)

target_link_libraries(01-say_hello 01-CUDA_LIB)
