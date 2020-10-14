if (executable)
    return()
endif()

set(executable true)

function(executable TARGET)
    create_binary(${TARGET} "executable" ${ARGN})
endfunction(executable)

function(executable_test TARGET)
    create_binary(${TARGET} "executable" ${ARGN})
    add_test(${TARGET} ${TARGET})
endfunction(executable_test)