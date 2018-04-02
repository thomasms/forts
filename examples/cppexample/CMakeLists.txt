project (CPPEXAMPLE)

set (CPPEXAMPLE_EXE_NAME cppexample)
set (CPPEXAMPLE_EXE_SOURCE ${FORTS_EXAMPLES_DIR}/cppexample/example.cpp)

add_definitions(-DAPI_IMPORT=1)

add_executable (${CPPEXAMPLE_EXE_NAME} ${CPPEXAMPLE_EXE_SOURCE})

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

target_link_libraries (${CPPEXAMPLE_EXE_NAME} ${FORTS_C_LIB_NAME})
set_target_properties(${CPPEXAMPLE_EXE_NAME}
                      PROPERTIES OUTPUT_NAME ${CPPEXAMPLE_EXE_NAME}
                      RUNTIME_OUTPUT_DIRECTORY ${FORTS_BUILD_DIR}/bin)
