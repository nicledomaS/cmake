if(make_initialize)
    return()
endif()

set(make_initialize true)

include(${CMAKE_CURRENT_LIST_DIR}/check_codes/clang_tidy.cmake)

include(${CMAKE_CURRENT_LIST_DIR}/make/link_libraries.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/make/create_binary.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/make/executable.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/make/library.cmake)

include(${CMAKE_CURRENT_LIST_DIR}/make/utils.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/make/find_modules.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/make/find_tests.cmake)

if(FIND_MODULES)
    find_modules()
endif()

if(FIND_TESTS)
    enable_testing()
    find_tests()
endif()