module test_int_vector_m
    use toast
    use forts
    implicit none
    private

    !> Test append
    type, extends(TestCase), public :: TestFortsIntVectorAppend
    contains
        procedure :: test => test_int_vector_append
    end type TestFortsIntVectorAppend

    !> Test append and reset
    type, extends(TestCase), public :: TestFortsIntVectorReset
    contains
        procedure :: test => test_int_vector_append_and_reset
    end type TestFortsIntVectorReset
contains

    ! test append
    subroutine test_int_vector_append(this)
        class(TestFortsIntVectorAppend), intent(inout) :: this
        
        type(FortsIntVector) :: vector

        ! Init vector
        call vector%init()

        ! assert defaults
        call this%assertequal(0_ki4, vector%length(), message="Assert default size")

        ! append some values
        call vector%append(38)
        call vector%append(-931)
        call vector%append(45)

        ! should equal 3
        call this%assertequal(3_ki4, vector%length(), message="Assert size after appends")

        ! assert values
        call this%assertequal(38_ki4, vector%get(0), message="Assert first value")
        call this%assertequal(-931_ki4, vector%get(1), message="Assert second value")
        call this%assertequal(45_ki4, vector%get(2), message="Assert third value")

    end subroutine test_int_vector_append

    ! test reset
    subroutine test_int_vector_append_and_reset(this)
        class(TestFortsIntVectorReset), intent(inout) :: this

        type(FortsIntVector) :: vector

        ! Init vector
        call vector%init()

        ! assert defaults
        call this%assertequal(0_ki4, vector%length(), message="Assert default size")

        ! append some values
        call vector%append(38)
        call vector%append(-931)
        call vector%append(45)

        ! should equal 3
        call this%assertequal(3_ki4, vector%length(), message="Assert size after appends")

        ! assert values
        call this%assertequal(38_ki4, vector%get(0), message="Assert first value")
        call this%assertequal(-931_ki4, vector%get(1), message="Assert second value")
        call this%assertequal(45_ki4, vector%get(2), message="Assert third value")

        ! reset
        call vector%reset()

        ! assert defaults
        call this%assertequal(0_ki4, vector%length(), message="Assert default size")

        ! append new values
        call vector%append(378)
        call vector%append(-8378)

        ! assert size
        call this%assertequal(2_ki4, vector%length(), message="Assert size after appends")

        ! assert values
        call this%assertequal(378_ki4, vector%get(0), message="Assert first value")
        call this%assertequal(-8378_ki4, vector%get(1), message="Assert second value")

    end subroutine test_int_vector_append_and_reset

end module test_int_vector_m
