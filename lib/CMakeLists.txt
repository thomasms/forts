project (${FORTS_C_LIB_NAME})

set (FORTS_C_LIB_SOURCE
    ${FORTS_C_LIB_DIR}/fortsintvector.cpp
    ${FORTS_C_LIB_DIR}/fortsdoublevector.cpp)

# export the api
add_definitions(-DAPI_EXPORT=1)

add_library(${FORTS_C_LIB_NAME} ${FORTS_C_LIB_SOURCE})

set_target_properties(${FORTS_C_LIB_NAME}
                    PROPERTIES OUTPUT_NAME ${FORTS_C_LIB_NAME}
                    LIBRARY_OUTPUT_DIRECTORY ${FORTS_BUILD_DIR}/lib
                    ARCHIVE_OUTPUT_DIRECTORY ${FORTS_BUILD_DIR}/lib)

