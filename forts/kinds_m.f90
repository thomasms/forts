module kinds_m
    implicit none
    private

    !< 4 byte integer kind
    integer, parameter, public :: ki4 = selected_int_kind(9)

    !< 8 byte integer kind
    integer, parameter, public :: ki8 = selected_int_kind(18)

    !< 4 byte real kind
    integer, parameter, public :: kr4 = selected_real_kind(6)

    !< 8 byte real kind
    integer, parameter, public :: kr8 = selected_real_kind(15)

    !< default integer kind
    integer, parameter, public :: kidef = kind(1)

    !< default real kind
    integer, parameter, public :: krdef = kind(1.0)

    !< default double precision kind
    integer, parameter, public :: kddef = kind(1.0d0)

end module kinds_m
