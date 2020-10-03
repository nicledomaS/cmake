[![License][license-image]][license-url]
# cmake
Cmake scripts for build c++ projects

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
```cmake
project(...)
include(cmake/make.cmake)

#TARGET - project name
#SOURCES - path to source
#THREADS - threads module to add project
#BOOST - list of boost modules to add project
#MODULES - list of own modules to add project
#LIBS - list of external modules to add project
static_library(TestLib1 SOURCES "" THREADS BOOST ... ... MODULES ... ... LIBS ... ...)
shared_library(TestLib2 SOURCES "" THREADS BOOST ... ... MODULES ... ... LIBS ... ...)

executable(TestName SOURCES "" THREADS BOOST system MODULES TestLib1 TestLib2 LIBS ... ...)

```

[license-image]: https://img.shields.io/badge/License-Apache%202.0-blue.svg
[license-url]: LICENSE
