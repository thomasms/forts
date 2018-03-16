project (CPPEXAMPLE)

set (CPPEXAMPLE_EXE_NAME cppexample)
set (CPPEXAMPLE_EXE_SOURCE ${FORTS_TOOLS_DIR}/cppexample/example.cpp)

add_definitions(-DAPI_IMPORT=1)

add_executable (${CPPEXAMPLE_EXE_NAME} ${CPPEXAMPLE_EXE_SOURCE})

target_link_libraries (${CPPEXAMPLE_EXE_NAME} ${FORTS_C_LIB_NAME})
set_target_properties(${CPPEXAMPLE_EXE_NAME}
                      PROPERTIES OUTPUT_NAME ${CPPEXAMPLE_EXE_NAME}
                      RUNTIME_OUTPUT_DIRECTORY ${FORTS_BUILD_DIR}/bin)
