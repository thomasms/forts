project (CPPUNITTESTS)

set (CPPUNITTTESTS_EXE_NAME cppunittests)
set (CPPUNITTEST_SOURCES main.cpp
                         test_intvector.cpp)

include_directories (${FORTS_INCLUDES}
                     ${FORTS_API_HEADERS}
                     ${FORTS_EXTERNAL_DIR}/Catch2/single_include)
add_definitions(-DAPI_IMPORT=1)

add_executable (${CPPUNITTTESTS_EXE_NAME} ${CPPUNITTEST_SOURCES})

# set the C++ compiler and linker flags
if(BUILD_STATIC_LIBS)
    if (CMAKE_CXX_COMPILER_ID MATCHES Clang)
        # using Clang
    elseif (CMAKE_CXX_COMPILER_ID MATCHES GNU)
        set ( CMAKE_EXE_LINKER_FLAGS "-static-libgfortran -static-libgcc -static-libstdc++")
    elseif (CMAKE_CXX_COMPILER_ID MATCHES Intel)
        # using Intel C++
        set ( CMAKE_EXE_LINKER_FLAGS "-static-intel -static-libgcc")
    elseif (CMAKE_CXX_COMPILER_ID MATCHES MSVC)
        # using Visual Studio C++
    endif()
endif()

target_link_libraries (${CPPUNITTTESTS_EXE_NAME} ${FORTS_C_LIB_NAME})
set_target_properties(${CPPUNITTTESTS_EXE_NAME}
                      PROPERTIES OUTPUT_NAME ${CPPUNITTTESTS_EXE_NAME}
                      RUNTIME_OUTPUT_DIRECTORY ${FORTS_BUILD_DIR}/bin)
