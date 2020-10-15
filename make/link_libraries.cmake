if (link_libraries)
    return()
endif()

set(link_libraries true)

include(CMakeParseArguments)

function(link_modules TARGET)
    if("${TARGET}" STREQUAL "")
        set(TARGET ${PROJECT_NAME})
    endif()

    if (ARGN)
        list(REMOVE_DUPLICATES ARGN)

        foreach(ARG ${ARGN})
            target_include_directories(${TARGET} PUBLIC ${${ARG}_SOURCE_DIR}/include)
        endforeach()

        target_link_libraries(${TARGET} ${ARGN})
    endif()
endfunction(link_modules)

function(link_libraries TARGET)
    set(PARAMS TARGET LIBRARY_NAME)
    cmake_parse_arguments(VALUE "" "${PARAMS}" "" ${ARGN})

    if("${VALUE_TARGET}" STREQUAL "")
        set(VALUE_TARGET ${PROJECT_NAME})
    endif()

    if(VALUE_UNPARSED_ARGUMENTS)
        list(REMOVE_DUPLICATES VALUE_UNPARSED_ARGUMENTS)
        find_package(${VALUE_LIBRARY_NAME} COMPONENTS ${VALUE_UNPARSED_ARGUMENTS} REQUIRED)
    else()
        find_package(${VALUE_LIBRARY_NAME} REQUIRED)
    endif()

    message(STATUS "${VALUE_LIBRARY_NAME} ${${VALUE_LIBRARY_NAME}_LIBRARIES}")

    target_include_directories(${VALUE_TARGET} PRIVATE ${${VALUE_LIBRARY_NAME}_INCLUDE_DIRS})
    target_link_libraries(${VALUE_TARGET} ${${VALUE_LIBRARY_NAME}_LIBRARIES})
endfunction(link_libraries)

function(link_boost TARGET)
    link_libraries(TARGET LIBRARY_NAME Boost ${ARGN})
endfunction(link_boost)

function(link_thread TARGET)
    if("${TARGET}" STREQUAL "")
        set(TARGET ${PROJECT_NAME})
    endif()

    find_package(Threads REQUIRED)

    message(STATUS "Link threads") 
    target_link_libraries(${TARGET} ${CMAKE_THREAD_LIBS_INIT})
endfunction(link_thread)