function(add_pdes_executable NAME)
    add_executable(${NAME} ${ARGN})
    target_link_libraries(${NAME} PDES)
endfunction()
