project (${FORTS_FORTRAN_LIB_NAME})

set (F90_SOURCES
    ${FORTS_EXTERNAL_DIR}/fork/fork_m.f90
    ${FORTS_FORTRAN_LIB_DIR}/dynamicarray_m.F90
    ${FORTS_FORTRAN_LIB_DIR}/ifortsintvector_m.F90
    ${FORTS_FORTRAN_LIB_DIR}/ifortsdoublevector_m.F90
    ${FORTS_FORTRAN_LIB_DIR}/fortsintvector_m.F90
    ${FORTS_FORTRAN_LIB_DIR}/fortsdoublevector_m.F90)

# export the api
add_definitions(-DAPI_IMPORT=1)

# set the flags
set_source_files_properties(${F90_SOURCES} PROPERTIES COMPILE_FLAGS "${F90_FLAGS}")

add_library(${FORTS_FORTRAN_LIB_NAME} ${F90_SOURCES})
target_link_libraries (${FORTS_FORTRAN_LIB_NAME}
                       ${FORTS_C_LIB_NAME})

set_target_properties(${FORTS_FORTRAN_LIB_NAME}
                        PROPERTIES OUTPUT_NAME ${FORTS_FORTRAN_LIB_NAME}
                        LIBRARY_OUTPUT_DIRECTORY ${FORTS_BUILD_DIR}/lib
                        ARCHIVE_OUTPUT_DIRECTORY ${FORTS_BUILD_DIR}/lib
                        Fortran_MODULE_DIRECTORY ${FORTS_MODULE_DIR})
