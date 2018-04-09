program example
    use fork_m
    use dynamicarray_m
    use fortsintvector_m
    use fortsdoublevector_m

    call runintnativetest(40)
    call runinttest(3)
    call rundoubletest(30)

contains

    subroutine runintnativetest(size)
        integer(kind=sp), intent(in), value :: size

        type(DynamicIntArray) :: vector
        integer(kind=sp) :: i, j

        call vector%init()

        do i=0,size-1
            call vector%append(i)
            print *, "value added: ", vector%get(i)
        enddo

        print *, "SIZE: ", vector%size()

    end subroutine runintnativetest

    subroutine runinttest(size)
        integer(kind=sp), intent(in), value :: size

        type(FortsIntVector) :: vector
        integer(kind=sp) :: i

        call vector%init()
        call vector%reserve(size)

        do i=0,size-1
            call vector%append(i)
            print *, "value added: ", vector%get(i)
        enddo

        print *, "SIZE: ", vector%size()

    end subroutine runinttest

    subroutine rundoubletest(size)
        integer(kind=sp), intent(in), value :: size

        type(FortsDoubleVector) :: vector
        integer(kind=sp)        :: i

        call vector%init()
        call vector%reserve(size)

        do i=0,size-1
            call vector%append(i*0.45_dp)
            print *, "value added: ", vector%get(i)
        enddo

        print *, "SIZE: ", vector%size()

    end subroutine rundoubletest

end program example

