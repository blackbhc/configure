# GLOBAL PART
# minimal version of cmake
cmake_minimum_required(VERSION 3.12 FATAL_ERROR)
# project name, language
project(demo-project LANGUAGES CXX)
# standard: C++23
set(CMAKE_CXX_STANDARD 23)
# set up the compiler
# set(CMAKE_C_COMPILER   gcc)
# set(CMAKE_CXX_COMPILER g++)
# no compiler dependent extensions
set(CMAKE_CXX_EXTENSIONS OFF)
# check the compiler support the specified standard
set(CMAKE_CXX_STANDARD_REQUIRED ON)
# Build type, default: Debug
if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Debug CACHE STRING "Build type" FORCE)
endif()
# export the compilation commands
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# COMPILATION FLAGS PART
# customized debug flags: default one only includes -g
set(CMAKE_CXX_FLAGS_DEBUG "-g -Wall -Wextra -Wpedantic -Werror -fPIC -DDEBUG")
# print fundamental flags: -g, -O, and whether -DNDEBUG
message(STATUS "C++ flags, Debug configuration: ${CMAKE_CXX_FLAGS_DEBUG}")
message(STATUS "C++ flags, Release configuration: ${CMAKE_CXX_FLAGS_RELEASE}")
message(
    STATUS
    "C++ flags, Release configuration with Debug info: ${CMAKE_CXX_FLAGS_RELWITHDEBINFO}"
)
message(
    STATUS
    "C++ flags, minimal Release configuration: ${CMAKE_CXX_FLAGS_MINSIZEREL}"
)
if(CMAKE_SYSTEM_NAME STREQUAL "Darwin")
    set(sanitizer_flags "-fsanitize=undefined" "-fsanitize=address")
else()
    set(sanitizer_flags
        "-fsanitize=undefined"
        "-fsanitize=address"
        "-fsanitize=leak"
    )
endif()

# TARGET PART
# Excutable
add_executable(main src/main.cpp)
# target_link_libraries(main message)
# target_link_options(main PRIVATE
#      ${sanitizer_flags}
# )
# Library
add_library(hellolib SHARED src/main.cpp)
# Library with the same name
#[[ add_library(message-shared
  SHARED
    $<TARGET_OBJECTS:message-objs>
 )

set_target_properties(message-shared
 PROPERTIES
  OUTPUT_NAME "message"
 )

add_library(message-static
 STATIC
  $<TARGET_OBJECTS:message-objs>
 )

set_target_properties(message-static
 PROPERTIES
  OUTPUT_NAME "message"
 ) ]]

# UNIT TESTS
# C++ programes
enable_testing()
add_executable(test_hello ./validation/test_hello.cpp)
add_test(NAME test_hello COMMAND $<TARGET_FILE:test_hello>)
# python scripts
find_package(Python COMPONENTS Interpreter Development)
message(STATUS "Find python interpreter: ${Python_EXECUTABLE}")
add_test(
    NAME python_test
    COMMAND ${Python_EXECUTABLE} ../validation/test_hello.py
)

# INSTALL PART
if(CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)
    set(CMAKE_INSTALL_PREFIX "~/.local" CACHE PATH "install prefix" FORCE)
endif()
include(GNUInstallDirs)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY
    ${PROJECT_BINARY_DIR}/${CMAKE_INSTALL_LIBDIR}
)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY
    ${PROJECT_BINARY_DIR}/${CMAKE_INSTALL_LIBDIR}
)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY
    ${PROJECT_BINARY_DIR}/${CMAKE_INSTALL_BINDIR}
)
# Offer the user the choice of overriding the installation directories
set(INSTALL_LIBDIR
    ${CMAKE_INSTALL_LIBDIR}
    CACHE PATH
    "Installation directory for libraries"
)
set(INSTALL_BINDIR
    ${CMAKE_INSTALL_BINDIR}
    CACHE PATH
    "Installation directory for executables"
)
set(INSTALL_INCLUDEDIR
    ${CMAKE_INSTALL_INCLUDEDIR}
    CACHE PATH
    "Installation directory for header files"
)
set(DEF_INSTALL_CMAKEDIR CMake)
set(INSTALL_CMAKEDIR
    ${DEF_INSTALL_CMAKEDIR}
    CACHE PATH
    "Installation directory for CMake files"
)
# Report to user
foreach(p LIB BIN INCLUDE CMAKE)
    file(TO_NATIVE_PATH ${CMAKE_INSTALL_PREFIX}/${INSTALL_${p}DIR} _path)
    message(STATUS "Installing ${p} components to ${_path}")
    unset(_path)
endforeach()
install(
    TARGETS main hellolib
    ARCHIVE DESTINATION ${INSTALL_LIBDIR} COMPONENT lib
    RUNTIME DESTINATION ${INSTALL_BINDIR} COMPONENT bin
    LIBRARY DESTINATION ${INSTALL_LIBDIR} COMPONENT lib
    PUBLIC_HEADER DESTINATION ${INSTALL_INCLUDEDIR}/message COMPONENT dev
)
# Offer the user the choice of overriding the installation directories
set(INSTALL_LIBDIR
    ${CMAKE_INSTALL_LIBDIR}
    CACHE PATH
    "Installation directory for libraries"
)
set(INSTALL_BINDIR
    ${CMAKE_INSTALL_BINDIR}
    CACHE PATH
    "Installation directory for executables"
)
set(INSTALL_INCLUDEDIR
    ${CMAKE_INSTALL_INCLUDEDIR}
    CACHE PATH
    "Installation directory for header files"
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
