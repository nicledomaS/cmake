if (find_modules)
    return()
endif()

set(find_modules true)

if(NOT MODULES_DIR)
    set(MODULES_DIR ${CMAKE_SOURCE_DIR}/modules)
endif()

option(FIND_MODULES "Enable find modules" OFF)

function(find_modules)
    add_subdirs(module ${MODULES_DIR})
endfunction(find_modules)