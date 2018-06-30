#include "fortspreprocessor.h"

    !> The monitor object
    !! This wraps the C API for easy use within fortran
    !! So far does not support cloning, needs to be added
    type, public :: MACRO_TYPENAME(FORTS_TYPE)
    private
        type(c_ptr) :: raw                      !< Underlying C monitor object
        logical     :: isinit  = .false.
    contains
        procedure :: init                       !> Constructor
        procedure :: reset                      !> Resets/Clears messages, but monitor still exists and is still initialised
        procedure :: size                       !> Get the size
        procedure :: reserve                    !> Reserve the size
        procedure :: get                        !> Get a value
        procedure :: append                     !> Append a value
            final :: finalize
        procedure, private :: check
        procedure, private :: cleanup
    end type MACRO_TYPENAME(FORTS_TYPE)

    contains

        !> The constructor
        subroutine init(this)
            class(MACRO_TYPENAME(FORTS_TYPE)), intent(inout) :: this

            ! It looks odd to call the cleanup, but is good practice to call before allocation
            call this%cleanup()

            ! allocate the C pointer
            !! we don't want a memory leak so check it was not initialised before
            if(this%isinit .eqv. .false.)then
                this%raw = MACRO_METHODNAME(FORTS_TYPE,CreateC)()
                ! flag to make sure that it is initialised
                this%isinit = .true.
            endif

        end subroutine init

        !> Destructor
        subroutine finalize(this)
            type(MACRO_TYPENAME(FORTS_TYPE)), intent(inout) :: this

            call this%cleanup()

        end subroutine finalize

        !> Deallocates and resets the data structure
        !! If not initialised then this does nothing
        subroutine cleanup(this)
            class(MACRO_TYPENAME(FORTS_TYPE)), intent(inout) :: this

            ! deallocate the C pointer
            if(this%isinit .eqv. .true.)then
                call MACRO_METHODNAME(FORTS_TYPE,DestroyC)(this%raw)
                this%isinit = .false.
            endif

        end subroutine cleanup

        !> Reset
        subroutine reset(this)
            class(MACRO_TYPENAME(FORTS_TYPE)), intent(inout) :: this

            call this%check()
            call MACRO_METHODNAME(FORTS_TYPE,ResetC)(this%raw)

        end subroutine reset

        !> Gets the size of the container
        function size(this) result(value)
            class(MACRO_TYPENAME(FORTS_TYPE)), intent(in) :: this
            integer(kind=ki4) :: value

            call this%check()
            value = MACRO_METHODNAME(FORTS_TYPE,SizeC)(this%raw)

        end function size

        !> Gets a value (index is 0 based)
        function get(this, index) result(value)
            class(MACRO_TYPENAME(FORTS_TYPE)), intent(in) :: this
            integer(kind=ki4), intent(in)    :: index
            FORTS_FTYPE                      :: value

            call this%check()
            value = MACRO_METHODNAME(FORTS_TYPE,GetC)(this%raw, index)

        end function get

        !> Add a new value
        subroutine append(this, value)
            class(MACRO_TYPENAME(FORTS_TYPE)), intent(inout) :: this
            FORTS_FTYPE, intent(in)                          :: value

            call this%check()
            call MACRO_METHODNAME(FORTS_TYPE,AppendC)(this%raw, value)

        end subroutine append

        !> Add a new value
        subroutine reserve(this, size)
            class(MACRO_TYPENAME(FORTS_TYPE)), intent(inout) :: this
            integer(kind=ki4), intent(in)             :: size

            call this%check()
            call MACRO_METHODNAME(FORTS_TYPE,ReserveC)(this%raw, size)

        end subroutine reserve

        !> Checks if the container has been initialised, exits otherwise
        subroutine check(this)
            class(MACRO_TYPENAME(FORTS_TYPE)), intent(in) :: this

            if(this%isinit .eqv. .false.)then
                stop 'FortsVector has not been initialised.'
            endif

        end subroutine check
