module intvectorbench_m
    use forts
    use timefunctor_m
    implicit none
    private

    !> Base benchmark type for int containers
    type, extends(TimeFunctor), abstract, public :: IntContainerTimeFunctor
    contains
        procedure(setup_container), deferred :: setup
    end type IntContainerTimeFunctor

    abstract interface
        subroutine setup_container(this)
            import :: IntContainerTimeFunctor
            implicit none
            class(IntContainerTimeFunctor), intent(inout) :: this
        end subroutine setup_container
    end interface

    !> Benchmarking for FortsIntVector
    type, extends(IntContainerTimeFunctor), public :: IntVectorTimeFunctor
        private
        type(FortsIntVector) :: vector
    contains
        procedure :: setup => setup_intvector
        procedure :: run => run_intvector
    end type IntVectorTimeFunctor

    !> Benchmarking for native integer array
    type, extends(IntContainerTimeFunctor), public :: IntArrayTimeFunctor
        private
        type(FortsIntContainer) :: vector
    contains
        procedure :: setup => setup_intarray
        procedure :: run => run_intarray
    end type IntArrayTimeFunctor

contains

    !> setup FortsIntVector functor
    subroutine setup_intvector(this)
        class(IntVectorTimeFunctor), intent(inout) :: this

        call this%vector%init()
    end subroutine setup_intvector

    !> setup integer array functor
    subroutine setup_intarray(this)
        class(IntArrayTimeFunctor), intent(inout) :: this

        ! does nothing
    end subroutine setup_intarray

    !> FortsIntVector::Append to be benchmarked
    subroutine run_intvector(this)
        class(IntVectorTimeFunctor), intent(inout) :: this

        call this%vector%append(6748329_ki4)

    end subroutine run_intvector

    !> array set values to be benchmarked
    subroutine run_intarray(this)
        class(IntArrayTimeFunctor), intent(inout) :: this

        call this%vector%append(6748329_ki4)

    end subroutine run_intarray

end module intvectorbench_m

program bench
    use fork_m
    use forts
    use timefunctor_m
    use intvectorbench_m

    type(IntVectorTimeFunctor) :: fctrvector
    type(IntArrayTimeFunctor) :: fctrarray

    type(FortsIntContainer) :: its
    integer(kind=ki2), parameter :: repeats = 3_ki2
    integer(kind=ki4) :: i

    ! number of iterations
    call its%fill([10_ki4, 100_ki4, 1000_ki4, 10000_ki4, &
                 & 100000_ki4, 1000000_ki4, 10000000_ki4, 100000000_ki4])

    write(*,'(A)') " -- native fortran array --"
    do i = 1, its%length()
        call run(fctrarray, its%get(i))
    end do

    write(*,'(A)') " -- fortran wrapped c++ vector --"
    do i = 1, its%length()
        call run(fctrvector, its%get(i))
    end do

contains
    subroutine run(fctr, iterations)
        class(IntContainerTimeFunctor), intent(inout) :: fctr
        integer(kind=ki4), intent(in) :: iterations

        fctr%repeats = repeats
        fctr%iterations = iterations
        call fctr%setup()
        call timeit(fctr)
        call fctr%printsummary()
    end subroutine run

end program bench

