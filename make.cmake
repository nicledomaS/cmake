if(make_initialize)
    return()
endif()

make_initialize = true

if(NOT MODULES)
    set(MODULES ${CMAKE_SOURCE_DIR}/modules)
endif()

set(SCRIPTS_PATH ${CMAKE_CURRENT_LIST_DIR})

include(${SCRIPTS_PATH}/make/executable.cmake)

