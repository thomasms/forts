project (FORTSINTVECTORBENCH)
enable_language (Fortran)

set (BENCH_EXE_NAME fortsintvectorbench)
set (BENCH_EXE_SOURCE bench.f90 ${FORTIME_SOURCES})
set_source_files_properties(${BENCH_EXE_SOURCE} PROPERTIES COMPILE_FLAGS "${F90_FLAGS}")

add_executable (${BENCH_EXE_NAME} ${BENCH_EXE_SOURCE})

target_link_libraries (${BENCH_EXE_NAME} ${FORTS_FORTRAN_LIB_NAME} ${FORTS_C_LIB_NAME})
set_target_properties(${BENCH_EXE_NAME}
                      PROPERTIES OUTPUT_NAME ${BENCH_EXE_NAME}
                      RUNTIME_OUTPUT_DIRECTORY ${BENCH_BUILD_DIR})
