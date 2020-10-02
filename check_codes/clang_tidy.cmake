if (clang_tidy)
    return()
endif()

set(clang_tidy true)

find_program(CLANG_TIDY clang-tidy)

option(ENABLE_TIDY "Enable clang-tidy" OFF)

function(clang_tidy_analysis TARGET)
    if(ENABLE_TIDY AND CLANG_TIDY)
        message(STATUS "clang-tidy is found")
        set_target_properties(${TARGET}
                PROPERTIES CXX_CLANG_TIDY
                "${CLANG_TIDY};-checks=${OPTIONS_CHECKS};-warnings-as-errors=*;-p=${CMAKE_BINARY_DIR};-header-filter='${CMAKE_CURRENT_SOURCE_DIR}/*'")
    else()
        message(STATUS "clang-tidy is not found or not enable")
    endif()


endfunction(clang_tidy_analysis)