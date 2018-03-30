module kinds_m
    implicit none
    private

    !> Single precision
    integer, parameter, public :: sp = kind(1.0)

    !> Double precision
    integer, parameter, public :: dp = selected_real_kind(2*precision(1.0_sp))

    !> Quad precision
    integer, parameter, public :: qp = selected_real_kind(2*precision(1.0_dp))

end module kinds_m
