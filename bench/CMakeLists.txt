set (FORTIME_SOURCES ${FORTS_EXTERNAL_DIR}/fork/fork_m.f90
                     ${FORTS_EXTERNAL_DIR}/fortime/source/fortime_m.F90
                     ${FORTS_EXTERNAL_DIR}/fortime/source/timefunctor_m.F90)

set (BENCH_BUILD_DIR ${FORTS_BUILD_DIR}/bin/benchmarking)

add_subdirectory(${FORTS_BENCH}/intvector)
