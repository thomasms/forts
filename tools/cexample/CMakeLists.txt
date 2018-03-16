project (CEXAMPLE)

set (CEXAMPLE_EXE_NAME cexample)
set (CEXAMPLE_EXE_SOURCE ${FORTS_TOOLS_DIR}/cexample/example.c)

add_definitions(-DAPI_IMPORT=1)

add_executable (${CEXAMPLE_EXE_NAME} ${CEXAMPLE_EXE_SOURCE})

target_link_libraries (${CEXAMPLE_EXE_NAME} ${FORTS_C_LIB_NAME})
set_target_properties(${CEXAMPLE_EXE_NAME}
                      PROPERTIES OUTPUT_NAME ${CEXAMPLE_EXE_NAME}
                      RUNTIME_OUTPUT_DIRECTORY ${FORTS_BUILD_DIR}/bin)
