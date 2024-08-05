# GLOBAL PART

# minimal version of cmake
cmake_minimum_required(VERSION 3.12 FATAL_ERROR)
# project name, language
project(demo-project LANGUAGES CXX)
# standard: C++20
set(CMAKE_CXX_STANDARD 20)
# no compiler dependent extensions
set(CMAKE_CXX_EXTENSIONS OFF)
# check the compiler support the specified standard
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Build type, default: Debug
if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE
      Debug
      CACHE STRING "Build type" FORCE)
endif()
# customized debug flags: default one only includes -g
set(CMAKE_CXX_FLAGS_DEBUG "-g -Wall -Wextra -Wpedantic -Werror -fPIC")
# print fundamental flags: -g, -O, and whether -DNDEBUG
message(STATUS "C++ flags, Debug configuration: ${CMAKE_CXX_FLAGS_DEBUG}")
message(STATUS "C++ flags, Release configuration: ${CMAKE_CXX_FLAGS_RELEASE}")
message(
  STATUS
    "C++ flags, Release configuration with Debug info: ${CMAKE_CXX_FLAGS_RELWITHDEBINFO}"
)
message(
  STATUS
    "C++ flags, minimal Release configuration: ${CMAKE_CXX_FLAGS_MINSIZEREL}")

# Targets
add_executable(hello src/main.cpp)

# Unit tests
# C++ programes
enable_testing()
add_executable(test_hello ./validation/test_hello.cpp)
add_test(NAME test_hello COMMAND $<TARGET_FILE:test_hello>)
# python scripts
find_package (Python COMPONENTS Interpreter Development)
message(
  STATUS
    "Find python interpreter: ${Python_EXECUTABLE}")
add_test(
  NAME python_test
  COMMAND ${Python_EXECUTABLE} ../validation/test_hello.py
  )


#[[
Others
1. Run shell commands: see the blogs at
https://blog.csdn.net/guotianqing/article/details/121661067

2. MPI programe
find_package(MPI REQUIRED) # first: find the package
add_executable(hello-mpi hello-mpi.cpp)
target_link_libraries(hello-mpi
  PUBLIC
 	  MPI::MPI_CXX
  )

3. Find all files (non-recursive) under a directory:
file(GLOB SOURCE_FILES ./src/*.cpp)
message(
  STATUS
    "All files under src: ${SOURCE_FILES}")

4. Unit test with python script:
find_package (Python COMPONENTS Interpreter Development)
message(
  STATUS
    "Find python3 interpreter: ${Python_EXECUTABLE}")
add_test(
  NAME python_test
  COMMAND ${Python_EXECUTABLE} ../validation/test_hello.py
  )
]]
