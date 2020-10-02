if (create_binary)
    return()
endif()

set(create_binary true)

include(CMakeParseArguments)

function(create_binary TARGET TYPE)
    set(ARRAY SOURCES MODULES BOOST LIBS)
    cmake_parse_arguments(VALUES "" "" "${ARRAY}" ${ARGN})

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
        message(FATAL_ERROR "Binary type is unknown")
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

    clang_tidy_analysis(${TARGET})

endfunction(create_binary)