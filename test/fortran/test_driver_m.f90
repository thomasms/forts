program unittests
    use toast     !< testing library
    use forts     !< forts library
    implicit none

    type(TestCase) :: test
    type(FortsIntVector) :: vector
    integer(ki4) :: i, size

    ! Note the need for init here
    call test%init("FortsTest")

    ! Init vector
    call vector%init()

    ! assert defaults
    call test%assertequal(0_ki4, vector%size(), message="Assert default size")

    ! append some values
    call vector%append(38)
    call vector%append(-931)
    call vector%append(45)

    ! should equal 3
    call test%assertequal(3_ki4, vector%size(), message="Assert size after appends")

    ! assert values
    call test%assertequal(38_ki4, vector%get(0), message="Assert first value")
    call test%assertequal(-931_ki4, vector%get(1), message="Assert second value")
    call test%assertequal(45_ki4, vector%get(2), message="Assert third value")

    ! reset
    call vector%reset()

    ! assert defaults
    call test%assertequal(0_ki4, vector%size(), message="Assert default size")

    ! append new values
    call vector%append(378)
    call vector%append(-8378)

    ! assert size
    call test%assertequal(2_ki4, vector%size(), message="Assert size after appends")

    ! assert values
    call test%assertequal(378_ki4, vector%get(0), message="Assert first value")
    call test%assertequal(-8378_ki4, vector%get(1), message="Assert second value")

    ! print summary
    call test%printsummary()

    ! check for fatals
    if(test%failcount() > 0)then
        write(*, "(A)") "FAILED!"
        stop 1
    end if

end program unittests
