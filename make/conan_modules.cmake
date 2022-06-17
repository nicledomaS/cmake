macro(find_conan)
    find_program(CONAN conan)

    if(NOT CONAN)
        message(FATAL_ERROR "conan not found!")
    endif()

    message(STATUS "Install conan packages")

    # add for install system requires "-e CONAN_SYSREQUIRES_MODE=enabled" 
    execute_process(
        COMMAND ${CONAN} install . -if ${CMAKE_BINARY_DIR} --update --build missing
        WORKING_DIRECTORY ${CMAKE_SOURCE_DIR})

    include(${CMAKE_BINARY_DIR}/conan_paths.cmake)
endmacro()

