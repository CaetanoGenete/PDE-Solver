﻿include(FetchContent)
include(GoogleTest)
include(PDESCommon)

# ------------------------------------------------------------------------ Fetch gtest -------------------------------------------------------------------------

FetchContent_Declare(googletest
    GIT_REPOSITORY https://github.com/google/googletest.git
    GIT_TAG v1.14.0)

# For Windows: Prevent overriding the parent project's compiler/linker settings
if(WIN32)
    message(VERBOSE "Windows platform detected, forcing shared CRT")
    set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)
endif()
FetchContent_MakeAvailable(googletest)

# --------------------------------------------------------------------------- Tests ----------------------------------------------------------------------------

set(pdes_test_dir ${CMAKE_SOURCE_DIR}/test/)

function(add_pdes_test NAME)
    list(TRANSFORM ARGN PREPEND ${pdes_test_dir})
    add_pdes_executable(${NAME} ${ARGN})
    target_link_libraries(${NAME} GTest::gtest_main)
    gtest_discover_tests(${NAME})
endfunction()

add_pdes_test(hello "hello.cpp")

