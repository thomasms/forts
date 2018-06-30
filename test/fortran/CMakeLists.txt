project(FORTRANUNITTESTS)

set (FORTRANUNITTESTS_EXE_NAME fortranunittests)
set (EXTERNAL_SOURCES
    ${FORTS_EXTERNAL_DIR}/toast/toast/toast.F90
    ${FORTS_FORTRAN_LIB_DIR}/forts.F90)

set (F90_SOURCES
    ${EXTERNAL_SOURCES}
    test_driver_m.f90)

# export the api
add_definitions(-DAPI_IMPORT=1)

# set the flags
set_source_files_properties(${F90_SOURCES} PROPERTIES COMPILE_FLAGS "${F90_FLAGS}")

include_directories (${TOAST_INCLUDES})
link_directories (${TOAST_LIB})

add_executable(${FORTRANUNITTESTS_EXE_NAME} ${F90_SOURCES})
target_link_libraries (${FORTRANUNITTESTS_EXE_NAME}
                       toast
                       ${FORTS_FORTRAN_LIB_NAME}
                       ${FORTS_C_LIB_NAME})

set_target_properties(${FORTRANUNITTESTS_EXE_NAME}
                      PROPERTIES OUTPUT_NAME ${FORTRANUNITTESTS_EXE_NAME}
                      RUNTIME_OUTPUT_DIRECTORY ${FORTS_BUILD_DIR}/bin)
