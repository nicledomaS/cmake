if (libraries)
    return()
endif()

set(libraries true)

function(static_library TARGET)
    create_binary(${TARGET} "static" ${ARGN})
endfunction(static_library)

function(shared_library TARGET)
    create_binary(${TARGET} "shared" ${ARGN})
endfunction(shared_library)