# CMake project file for forts
cmake_minimum_required (VERSION 2.8)

# project name and details
project (Forts)
enable_language (Fortran)
set(PROJECT_DESCRIPTION "Forts")
set(PROJECT_URL "https://git.ccfe.ac.uk/thomasms/forts")

# set source directories
set (SOURCE_DIR_BASE ${CMAKE_CURRENT_LIST_DIR})
set (FORTS_BUILD_DIR ${CMAKE_BINARY_DIR})
set (FORTS_C_LIB_DIR ${SOURCE_DIR_BASE}/lib)
set (FORTS_FORTRAN_LIB_DIR ${SOURCE_DIR_BASE}/forts)
set (FORTS_API_HEADERS ${SOURCE_DIR_BASE}/api)
set (FORTS_TOOLS_DIR ${SOURCE_DIR_BASE}/tools)
set (FORTS_INCLUDES ${SOURCE_DIR_BASE}/include)

# library names
set (FORTS_C_LIB_NAME cforts)
set (FORTS_FORTRAN_LIB_NAME fforts)

# Set release build by default
set (CMAKE_BUILD_TYPE Release CACHE STRING "Select which configuration to build.")
set (FORTS_BUILD_TYPE "Release")
if(CMAKE_BUILD_TYPE)
    set(FORTS_BUILD_TYPE ${CMAKE_BUILD_TYPE})
else()
    set(CMAKE_BUILD_TYPE ${FORTS_BUILD_TYPE})
endif()

# set the general fortran Debug/Release compiler flags
set(FORTS_RELEASE_FLAGS "-O1")
set(FORTS_RELEASE_CXX_FLAGS "-O3")
set(FORTS_DEBUG_FLAGS "-g -O0")
set(FORTS_DEBUG_CXX_FLAGS "-g -O0")

set(CMAKE_Fortran_FLAGS_RELEASE ${FORTS_RELEASE_FLAGS})
set(CMAKE_Fortran_FLAGS_DEBUG ${FORTS_DEBUG_FLAGS})

# C++ flags
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_CXX_FLAGS "-Wall -Wextra -fvisibility=hidden -fvisibility-inlines-hidden")
set(CMAKE_CXX_FLAGS_DEBUG ${FORTS_DEBUG_CXX_FLAGS})
set(CMAKE_CXX_FLAGS_RELEASE ${FORTS_RELEASE_CXX_FLAGS})

# Fortran OS specific compiler flags
if (CMAKE_Fortran_COMPILER_ID MATCHES MSVC)
    set ( F90_FLAGS_DEBUG "-fp-model")
    set ( F90_FLAGS_RELEASE  "-fp-model" )
elseif (CMAKE_Fortran_COMPILER_ID MATCHES Intel)
    set ( F90_FLAGS_DEBUG "-debug  -CB -CA -CU -std08  -fp-model source")
    set ( F90_FLAGS_RELEASE  "-std08 -unroll -fp-model source -diag-disable 8291,8577" )
elseif (CMAKE_Fortran_COMPILER_ID MATCHES GNU)
    set ( F90_FLAGS_DEBUG "-cpp -ffree-form  -ffloat-store -fno-sign-zero -std=f2008 -ffree-line-length-none")
    set ( F90_FLAGS_RELEASE  "-cpp -ffree-form -ffloat-store -fno-sign-zero -std=f2008 -ffree-line-length-none" )
endif ()

# Release or Debug build
if(FORTS_BUILD_TYPE MATCHES Release)
    message(STATUS "Release build")
    set(F90_FLAGS ${F90_FLAGS_RELEASE})
elseif(FORTS_BUILD_TYPE MATCHES Debug)
    message(STATUS "Debug build")
    set(F90_FLAGS ${F90_FLAGS_DEBUG})
else()
    message(STATUS "Default build (Release)")
    set(F90_FLAGS ${F90_FLAGS_RELEASE})
endif()

# set the output directories
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY lib)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY bin)

# Collect all the mod files into their own include directory
set(FORTS_MODULE_DIR ${FORTS_BUILD_DIR}/include)

# set include and link directories
include_directories (${FORTS_BUILD_DIR}/include ${FORTS_API_HEADERS})
link_directories (${FORTS_BUILD_DIR}/lib)

# sources
add_subdirectory(${FORTS_C_LIB_DIR})
add_subdirectory(${FORTS_FORTRAN_LIB_DIR})
add_subdirectory(${FORTS_TOOLS_DIR})
