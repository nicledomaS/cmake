[![License][license-image]][license-url]
# cmake
Cmake scripts for build c++ projects

## Flags

### `FIND_CONAN`
Find conanfile in project

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
 |--conanfile.txt
 |--modules
 |         \ 
 |          |--Modules1--CMakeLists.txt
 |          |--Modules2--CMakeLists.txt
 |
 |--include
 |--src
 |--tests
         \
          |--googletests
          |--test1--CMakeLists.txt
```

## Examples:
conanfile.txt
```
[requires]
toml11/3.7.0

[generators]
cmake_paths
cmake_find_package

[options]
```
Conan documentatio:
https://docs.conan.io/en/1.46/reference/generators.html
https://docs.conan.io/en/1.46/integrations/build_system/cmake.html


Executable
```cmake
project(TestApp)
include(cmake/make.cmake)

#TARGET - project name
#SOURCES - path to source
#THREADS - threads module to add project
#CONAN_MODULES - list of conan modules to add project
#BOOST - list of boost modules to add project
#MODULES - list of own modules to add project
#LIBS - list of external modules to add project

executable(${PROJECT_NAME}
            SOURCES ""
            THREADS
            CONAN_MODULES toml11
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
                CONAN_MODULES ... ...
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
                CONAN_MODULES ... ...
                BOOST ... ...
                MODULES ... ...
                LIBS ... ...)
```

[license-image]: https://img.shields.io/badge/License-Apache%202.0-blue.svg
[license-url]: LICENSE
