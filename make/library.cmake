if (libraries)
    return()
endif()

set(libraries true)

function(StaticLibrary)
    create_binary(${TARGET} "static" ${ARGN})
endfunction(StaticLibrary)

function(SharedLibrary)
    create_binary(${TARGET} "shared" ${ARGN})
endfunction(SharedLibrary)