program example
    use forts

    call runintnativetest(40_ki4)
    call runinttest(3_ki4)
    call rundoubletest(30_ki4)

contains

    subroutine runintnativetest(size)
        integer(kind=ki4), intent(in), value :: size

        type(FortsIntContainer) :: vector
        integer(kind=ki4) :: i

        do i=0,size-1
            call vector%append(i)
            print *, "value added: ", vector%get(i)
        enddo

        print *, "SIZE: ", vector%length()

    end subroutine runintnativetest

    subroutine runinttest(size)
        integer(kind=ki4), intent(in), value :: size

        type(FortsIntVector) :: vector
        integer(kind=ki4)    :: i

        call vector%init()
        call vector%reserve(size)

        do i=0,size-1
            call vector%append(i)
            print *, "value added: ", vector%get(i)
        enddo

        print *, "SIZE: ", vector%length()

    end subroutine runinttest

    subroutine rundoubletest(size)
        integer(kind=ki4), intent(in), value :: size

        type(FortsDoubleVector) :: vector
        integer(kind=ki4)       :: i

        call vector%init()
        call vector%reserve(size)

        do i=0,size-1
            call vector%append(i*0.45_kr8)
            print *, "value added: ", vector%get(i)
        enddo

        print *, "SIZE: ", vector%length()

    end subroutine rundoubletest

end program example

