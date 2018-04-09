module dynamicarray_m
    use fork_m
    implicit none
    private

    type, public :: DynamicIntArray
    private
        integer(kind=sp), dimension(:), allocatable :: raw
        logical           :: isinit = .false.
        integer(kind=sp)  :: arraysize = 0_sp
    contains
        procedure :: init                       !> Initialise
        procedure :: size                       !> Get the size
        procedure :: get                        !> Get a value
        procedure :: append                     !> Append a value
            final :: finalize
        procedure, private :: cleanup
    end type DynamicIntArray

contains

    !> Initialise
    subroutine init(this)
        class(DynamicIntArray), intent(inout) :: this

        if(this%isinit .eqv. .false.) then
            allocate(this%raw(0))
            this%isinit = .true.
        endif

    end subroutine init

    !> Finalize
    subroutine finalize(this)
        type(DynamicIntArray), intent(inout) :: this

        call this%cleanup()

    end subroutine finalize

    !> Cleanup
    subroutine cleanup(this)
        class(DynamicIntArray), intent(inout) :: this

        if(this%isinit .eqv. .true.) then
            deallocate(this%raw)
            this%isinit = .false.
        endif

    end subroutine cleanup

    !> Size
    function size(this) result(length)
        class(DynamicIntArray), intent(inout) :: this

        integer(kind=sp) :: length

        length = this%arraysize

    end function size

    !> Append - very slow and inefficient but for benchmarking
    subroutine append(this, value)
        class(DynamicIntArray), intent(inout) :: this
        integer(kind=sp), intent(in) :: value

        integer(kind=sp), dimension(:), allocatable :: tmp
        integer(kind=sp) :: prevsize

        if(this%isinit .eqv. .true.) then
            prevsize = this%size()
            allocate(tmp(prevsize + 1_sp))
            tmp(1_sp:prevsize) = this%raw
            !deallocate(this%raw)
            call move_alloc(tmp, this%raw)
            this%arraysize = this%arraysize + 1_sp
            this%raw(this%arraysize) = value
        endif

    end subroutine append

    !> Get
    function get(this, index) result(value)
        class(DynamicIntArray), intent(inout) :: this
        integer(kind=sp), intent(in) :: index
        integer(kind=sp) :: value

        value = -1_sp
        if(this%isinit .eqv. .true.) then
            value = this%raw(index + 1_sp)
        endif

    end function get

end module dynamicarray_m
