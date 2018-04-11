module intvectorbench_m
    use fork_m
    use timefunctor_m
    use fortsintvector_m
    use dynamicarray_m
    implicit none
    private

    !> Base benchmark type for int containers
    type, extends(TimeFunctor), abstract, public :: IntContainerTimeFunctor
        integer(kind=ki4) :: iterations = 100000_ki4 ! 0.4 MB
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
        type(DynamicIntArray) :: vector
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

        call this%vector%init()
    end subroutine setup_intarray

    !> FortsIntVector::Append to be benchmarked
    subroutine run_intvector(this)
        class(IntVectorTimeFunctor), intent(inout) :: this

        integer(kind=ki4) :: i

        do i=0,this%iterations-1
            call this%vector%append(i)
        enddo

    end subroutine run_intvector

    !> array set values to be benchmarked
    subroutine run_intarray(this)
        class(IntArrayTimeFunctor), intent(inout) :: this

        integer(kind=ki4) :: i

        do i=0,this%iterations-1
            call this%vector%append(i)
        enddo

    end subroutine run_intarray

end module intvectorbench_m

program bench
    use fork_m
    use timefunctor_m
    use intvectorbench_m

    type(IntVectorTimeFunctor) :: fctrvector
    type(IntArrayTimeFunctor) :: fctrarray

    integer(kind=ki2), parameter :: repeats = 3_ki2

    call run(fctrvector)
    call run(fctrarray)

contains
    subroutine run(fctr)
        class(IntContainerTimeFunctor), intent(inout) :: fctr
        real(kind=kr4) :: time

        fctr%repeats = repeats
        call fctr%setup()
        time = timeit(fctr)
        print *, time, "secs", fctr%iterations, "iterations"
    end subroutine run

end program bench

