cmake_minimum_required(VERSION 3.24)

project(PDE-Solver LANGUAGES CXX)

add_library(PDES INTERFACE)
target_include_directories(PDES INTERFACE ${CMAKE_SOURCE_DIR}/include)
target_compile_features(PDES INTERFACE cxx_std_20)

option(build_pdes_tests "Build tests with the application" OFF)

if(build_tests)
    enable_testing()
    add_subdirectory(test)
endif()