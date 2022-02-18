macro(find_conan)
    find_program(CONAN conan)

    if(NOT CONAN)
        message(FATAL_ERROR "conan not found!")
    endif()

    message(STATUS "Install conan packages")
    execute_process(
        COMMAND ${CONAN} install . -if ${CMAKE_BINARY_DIR} --build missing
        WORKING_DIRECTORY ${CMAKE_SOURCE_DIR})

    include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
    conan_basic_setup()
endmacro()

