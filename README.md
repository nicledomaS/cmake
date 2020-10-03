[![License][license-image]][license-url]
# cmake
Cmake scripts for build c++ projects

## lags

### `FIND_MODULES`
Find modules in folder `modules`.

Default: `OFF`
Examle: `-DFIND_MODULES=ON`

### `FIND_TESTS`
Find tests in folder `tests`.

Default: `OFF`
Examle: `-DFIND_TESTS=ON`

### `ENABLE_TIDY`
Enable clang-tidy for code analysis.

Default: `OFF`
Examle: `-DENABLE_TIDY=ON`

## Struct project
```
\
 |--CMakeList.txt
 |--cmake
 |--modules
 |         \ 
 |          |--Modules1--CMakeLists.txt
 |          |--Modules2--CMakeLists.txt
 |
 |--src
 |--tests
         \
          |--googletests
          |--test1--CMakeLists.txt
```

## Examples:
Executable
```cmake
project(TestApp)
include(cmake/make.cmake)

#TARGET - project name
#SOURCES - path to source
#THREADS - threads module to add project
#BOOST - list of boost modules to add project
#MODULES - list of own modules to add project
#LIBS - list of external modules to add project

executable(${PROJECT_NAME}
            SOURCES ""
            THREADS
            BOOST system
            MODULES Modules1 Modules2
            LIBS ... ...)
```

Modules 1
```cmake
project(Modules1)
include(cmake/make.cmake)

static_library(${PROJECT_NAME}
                SOURCES ""
                THREADS
                BOOST ... ...
                MODULES ... ...
                LIBS ... ...)
```

Modules 2
```cmake
project(Modules2)
include(cmake/make.cmake)

shared_library(${PROJECT_NAME} 
                SOURCES ""
                THREADS
                BOOST ... ...
                MODULES ... ...
                LIBS ... ...)
```

[license-image]: https://img.shields.io/badge/License-Apache%202.0-blue.svg
[license-url]: LICENSE
