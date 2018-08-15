
    public :: MACRO_CONTAINER_STORE_NAME             !< Store array to unit
    public :: MACRO_CONTAINER_RETRIEVE_NAME          !< Fill array from unit

    !> A dynamic container object which can append and reset values
    type, public :: MACRO_CLASS_NAME
    private
        integer(ki4)                                            :: count = 0_ki4
        MACRO_CONTAINER_TYPE(MACRO_CONTAINER_KIND), allocatable :: values(:)
        integer(ki4), public                                    :: scalefactor = 2_ki4
    contains
        procedure :: reset                                      !> Resets data
        procedure :: length                                     !> Gets the number of entries in array
        procedure :: fill                                       !> Fills the values from another array
        procedure :: set                                        !> Set the value for a given key
        procedure :: get                                        !> Get the value for a given key
        procedure :: append                                     !> Append a new key
        procedure :: iterate                                    !> Iterate through the container
        procedure, private :: cleanup                           !> Deallocate
            final :: finalize
    end type MACRO_CLASS_NAME

contains

    !> reset values
    subroutine reset(this)
        class(MACRO_CLASS_NAME), intent(inout) :: this

        ! Cleanup
        call this%cleanup()

    end subroutine reset

    !> Fills the values from another array
    !! allocates values but does not deallocate tocopy
    subroutine fill(this, tocopy)
        class(MACRO_CLASS_NAME), intent(inout)                 :: this
        MACRO_CONTAINER_TYPE(MACRO_CONTAINER_KIND), intent(in) :: tocopy(:)

        call this%cleanup()
        
        this%count = size(tocopy)
        allocate(this%values(1_ki4:this%count))
        this%values(:) = tocopy(:)

    end subroutine fill

    !> get the number of entries
    integer(ki4) function length(this)
        class(MACRO_CLASS_NAME), intent(in) :: this

        length = this%count

    end function length

    !> Iterate through the array
    subroutine iterate(this, iterator_func)
        class(MACRO_CLASS_NAME), intent(in) :: this
        interface
            subroutine iterator_func(value)
                import MACRO_CONTAINER_KIND
                MACRO_CONTAINER_TYPE(MACRO_CONTAINER_KIND), intent(in)  :: value
            end subroutine iterator_func
        end interface

        integer(ki4) :: i

        do i = 1, this%count
            call iterator_func(this%values(i))
        end do

    end subroutine iterate

    !> Set value
    subroutine set(this, index, value)
        class(MACRO_CLASS_NAME), intent(inout)                 :: this
        integer(ki4), intent(in)                               :: index
        MACRO_CONTAINER_TYPE(MACRO_CONTAINER_KIND), intent(in) :: value

        ! if index out of range then do nothing
        if(index > 0 .and. index <= this%count) then
            this%values(index) = value
        endif

    end subroutine set

    !> Get value
    function get(this, index) result(value)
        class(MACRO_CLASS_NAME), intent(in)        :: this
        integer(ki4), intent(in)                   :: index
        MACRO_CONTAINER_TYPE(MACRO_CONTAINER_KIND) :: value

        ! if index out of range then return undefined
        if(index > 0 .and. index <= this%count) then
            value = this%values(index)
        endif

    end function get

    !> cleanup
    subroutine cleanup(this)
        class(MACRO_CLASS_NAME), intent(inout) :: this

        ! Cleanup
        if(this%count > 0 .and. allocated(this%values))then
            deallocate(this%values)
            this%count = 0
        endif

    end subroutine cleanup

    !> Append a new value
    subroutine append(this, value)
        class(MACRO_CLASS_NAME), intent(inout) :: this
        MACRO_CONTAINER_TYPE(MACRO_CONTAINER_KIND), intent(in) :: value

        MACRO_CONTAINER_TYPE(MACRO_CONTAINER_KIND), allocatable :: values_tmp(:)
        integer(ki4) :: prevcount
        integer(ki4) :: prevsize
        integer(ki4) :: newsize

        ! the actual number of items appended
        prevcount = this%count

        ! the actual size of the container - not necessarily the same as the count
        prevsize = 0_ki4
        if(allocated(this%values))then
            prevsize = size(this%values)
        end if

        if(prevcount >= prevsize)then
            newsize = max(prevsize*this%scalefactor, prevsize+1_ki4)
            allocate(values_tmp(1_ki4:newsize))
            if(prevsize > 0_ki4)then
                values_tmp(1_ki4:prevsize) = this%values
            end if
            call move_alloc(values_tmp, this%values)
        end if

        this%count = this%count + 1_ki4
        this%values(this%count) = value

    end subroutine append

    !> finalize
    subroutine finalize(this)
        type(MACRO_CLASS_NAME), intent(inout) :: this

        call this%cleanup()

    end subroutine finalize
    
    !> Subroutine to write container array to a unit
    subroutine MACRO_CONTAINER_STORE_NAME(container, storeunit)
        type(MACRO_CLASS_NAME), intent(in) :: container
        integer(ki4), intent(in)           :: storeunit

        write(storeunit) container%count
        if(container%count > 0) then
            write(storeunit) container%values
        end if

    end subroutine MACRO_CONTAINER_STORE_NAME
        
    !> Subroutine to retrieve container array from a unit
    subroutine MACRO_CONTAINER_RETRIEVE_NAME(container, retrieveunit)
        type(MACRO_CLASS_NAME), intent(inout) :: container
        integer(ki4), intent(in)              :: retrieveunit

        integer(ki4) :: len_array
        
        call container%cleanup()
        
        read(retrieveunit) len_array
        if(len_array > 0_ki4) then
            container%count = len_array
            allocate(container%values(1_ki4:len_array))
            read(retrieveunit) container%values
        end if

    end subroutine MACRO_CONTAINER_RETRIEVE_NAME
    
