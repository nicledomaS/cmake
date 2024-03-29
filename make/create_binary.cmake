if (create_binary)
    return()
endif()

set(create_binary true)

include(CMakeParseArguments)


#TARGET - project name
#SOURCES - path to source
#THREADS - threads module to add project
#CONAN_MODULES - conan module to add project
#BOOST - list of boost modules to add project
#MODULES - list of own modules to add project
#LIBS - list of external modules to add project

function(create_binary TARGET TYPE)
    set(ARRAY THREADS)
    set(MULTI_ARRAY SOURCES MODULES BOOST LIBS CONAN_MODULES)
    cmake_parse_arguments(VALUES "${ARRAY}" "" "${MULTI_ARRAY}" ${ARGN})

    if("${TARGET}" STREQUAL "")
        message(FATAL_ERROR "Target is empty")
    endif()

    file(GLOB SOURCES "${VALUES_SOURCES}/*.*")

    if("${TYPE}" STREQUAL "executable")
        add_executable(${TARGET} ${SOURCES})
    elseif("${TYPE}" STREQUAL "shared")
        add_library(${TARGET} SHARED ${SOURCES})
    elseif("${TYPE}" STREQUAL "static")
        add_library(${TARGET} STATIC ${SOURCES})
    else()
        message(FATAL_ERROR "Binary type ${TYPE} is unknown")
    endif()

    if(VALUES_MODULES)
        message(STATUS "Link modules: ${VALUES_MODULES}")
        link_modules(${TARGET} ${VALUES_MODULES})
    endif()

    if(VALUES_BOOST)
        message(STATUS "Link boost libs: ${VALUES_BOOST}")
        link_boost(${TARGET} ${VALUES_BOOST})
    endif()

    if(VALUES_LIBS)
        message(STATUS "Link lib: ${VALUES_LIBS}")
        foreach(LIB ${VALUES_LIBS})
            link_libraries(${TARGET} LIBRARY_NAME ${LIB})
        endforeach()
    endif()

    if(VALUES_THREADS)
        link_thread(${TARGET})
    endif()

    if(VALUES_CONAN_MODULES)
        message(STATUS "Link conan libs: ${VALUES_CONAN_MODULES}")
        #target_include_directories(${TARGET} PRIVATE ${CONAN_INCLUDE_DIRS}})
        #target_link_libraries(${TARGET} ${CONAN_LIBS})
        foreach(CONAN_LIB ${VALUES_CONAN_MODULES})
            link_conan_module(${TARGET} LIBRARY_NAME ${CONAN_LIB})
        endforeach()
    endif()

    clang_tidy_analysis(${TARGET})

endfunction(create_binary)