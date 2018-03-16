project (FORTRANEXAMPLE)
enable_language (Fortran)

set (EXAMPLE_EXE_NAME fortranexample)
set (EXAMPLE_EXE_SOURCE ${FORTS_TOOLS_DIR}/fortranexample/example.f90)
set_source_files_properties(${EXAMPLE_EXE_SOURCE} PROPERTIES COMPILE_FLAGS "${F90_FLAGS}")

add_executable (${EXAMPLE_EXE_NAME} ${EXAMPLE_EXE_SOURCE})

target_link_libraries (${EXAMPLE_EXE_NAME} ${FORTS_FORTRAN_LIB_NAME} ${FORTS_C_LIB_NAME})
set_target_properties(${EXAMPLE_EXE_NAME}
                      PROPERTIES OUTPUT_NAME ${EXAMPLE_EXE_NAME}
                      RUNTIME_OUTPUT_DIRECTORY ${FORTS_BUILD_DIR}/bin)
