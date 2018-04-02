module intvectorbench_m
    use fork_m
    use timefunctor_m
    use fortsintvector_m
    implicit none
    private

    !> Base benchmark type for int containers
    type, extends(TimeFunctor), abstract, public :: IntContainerTimeFunctor
        private
        integer(kind=sp) :: iterations = 100000000_sp ! 400 MB
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
        integer(kind=sp), dimension(:), allocatable :: values
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

        allocate(this%values(this%iterations))
    end subroutine setup_intarray

    !> FortsIntVector::Append to be benchmarked
    subroutine run_intvector(this)
        class(IntVectorTimeFunctor), intent(inout) :: this

        integer(kind=sp) :: i

        do i=1,this%iterations
            call this%vector%append(i)
        enddo

    end subroutine run_intvector

    !> array set values to be benchmarked
    subroutine run_intarray(this)
        class(IntArrayTimeFunctor), intent(inout) :: this

        integer(kind=sp) :: i

        do i=0,this%iterations-1
            this%values(i) = i
        enddo

    end subroutine run_intarray

end module intvectorbench_m

program bench
    use fork_m
    use timefunctor_m
    use intvectorbench_m

    type(IntVectorTimeFunctor) :: fctrvector
    type(IntArrayTimeFunctor) :: fctrarray
    real(kind=sp) :: time

    call fctrvector%setup()
    time = timeit(fctrvector)
    print *, time, "secs"

    call fctrarray%setup()
    time = timeit(fctrarray)
    print *, time, "secs"

end program bench

