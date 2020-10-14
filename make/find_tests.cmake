if (find_tests)
    return()
endif()

set(find_tests true)

if(NOT TESTS_DIR)
    set(TESTS_DIR ${CMAKE_SOURCE_DIR}/tests)
endif()

option(FIND_TESTS "Enable find tests" OFF)

function(find_tests)
    add_subdirs(test ${TESTS_DIR})
endfunction(find_tests)