cmake_minimum_required(VERSION 3.24)

set(CMAKE_MODULE_PATH "${CMAKE_MODULE_PATH};${CMAKE_SOURCE_DIR}/cmake")

project(PDE-Solver LANGUAGES CXX)

add_library(PDES INTERFACE)
target_include_directories(PDES INTERFACE ${CMAKE_SOURCE_DIR}/include)
target_compile_features(PDES INTERFACE cxx_std_20)

# ------------------------------------------------------------------------- Optionals --------------------------------------------------------------------------

option(PDES_BUILD_TESTS "Build tests with the application" OFF)

if(PDES_BUILD_TESTS)
    enable_testing()
    add_subdirectory(test)
endif()