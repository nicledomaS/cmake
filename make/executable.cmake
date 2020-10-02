if (executable)
    return()
endif()

set(executable true)

function(executable TARGET)
    create_binary(${TARGET} "executable" ${ARGN})
endfunction(executable)