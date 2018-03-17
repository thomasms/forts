project (${FORTS_FORTRAN_LIB_NAME})

set (F90_SOURCES
    ${FORTS_FORTRAN_LIB_DIR}/kinds_m.f90
    ${FORTS_FORTRAN_LIB_DIR}/ifortsintvector_m.f90
    ${FORTS_FORTRAN_LIB_DIR}/fortsintvector_m.f90)

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
