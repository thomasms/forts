module fortsvector_m
    use iso_c_binding
    use ifortsvector_m
    implicit none

    private

    !> The monitor object
    !! This wraps the C API for easy use within fortran
    !! So far does not support cloning, needs to be added
    type, public :: FortsVector
    private
        type(c_ptr) :: raw                      !< Underlying C monitor object
        logical     :: isinit  = .false.
    contains
        procedure :: init                       !> Constructor
        procedure :: reset                      !> Resets/Clears messages, but monitor still exists and is still initialised
        procedure :: size                       !> Get the size
        procedure :: get                        !> Get a value
        procedure :: append                     !> Append a value
            final :: finalize
        procedure, private :: check
        procedure, private :: cleanup
    end type FortsVector

    contains

        !> The constructor
        subroutine init(this)
            class(FortsVector), intent(inout) :: this

            ! It looks odd to call the cleanup, but is good practice to call before allocation
            call this%cleanup()

            ! allocate the C pointer
            !! we don't want a memory leak so check it was not initialised before
            if(this%isinit .eqv. .false.)then
                this%raw = FortCreateC()
                ! flag to make sure that it is initialised
                this%isinit = .true.
            endif

        end subroutine init

        !> Destructor
        subroutine finalize(this)
            type(FortsVector), intent(inout) :: this

            call this%cleanup()

        end subroutine finalize

        !> Deallocates and resets the data structure
        !! If not initialised then this does nothing
        subroutine cleanup(this)
            class(FortsVector), intent(inout) :: this

            ! deallocate the C pointer
            if(this%isinit .eqv. .true.)then
                call FortDestroyC(this%raw)
                this%isinit = .false.
            endif

        end subroutine cleanup

        !> Reset
        subroutine reset(this)
            class(FortsVector), intent(inout) :: this

            call this%check()
            call FortResetC(this%raw)

        end subroutine reset

        !> Gets the size of the container
        function size(this) result(value)
            class(FortsVector), intent(in) :: this
            integer  :: value

            call this%check()
            value = FortSizeC(this%raw)

        end function size

        !> Gets a value (index is 0 based)
        function get(this, index) result(value)
            class(FortsVector), intent(in)    :: this
            integer, intent(in)               :: index
            integer  :: value

            call this%check()
            value = FortGetC(this%raw, index)

        end function get

        !> Add a new value
        subroutine append(this, value)
            class(FortsVector), intent(inout) :: this
            integer, intent(in)               :: value

            call this%check()
            call FortAppendC(this%raw, value)

        end subroutine append

        !> Checks if the container has been initialised, exits otherwise
        subroutine check(this)
            class(FortsVector), intent(in) :: this

            if(this%isinit .eqv. .false.)then
                stop 'FortsVector has not been initialised.'
            endif

        end subroutine check

end module fortsvector_m
