# toast includes and lib
set (TOAST_INCLUDES ${FORTS_BUILD_DIR}/toast/include)
set (TOAST_LIB ${FORTS_BUILD_DIR}/toast/lib)

add_subdirectory(${FORTS_TEST_DIR}/cpp)
add_subdirectory(${FORTS_TEST_DIR}/fortran)
