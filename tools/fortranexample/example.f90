program example
    use kinds_m
    use fortsintvector_m

    call createappenddestroy(3)
    call createappenddestroy(30)
    call createappenddestroy(300)
    call createappenddestroy(3000)
    call createappenddestroy(30000)
    call createappenddestroy(30000000)

contains

    subroutine createappenddestroy(size)
        integer(kind=kr4), intent(in), value :: size

        type(FortsIntVector) :: vector
        integer(kind=kr4) :: i

        call vector%init()
        call vector%reserve(size)

        do i=0,size-1
            call vector%append(i)
        enddo

        print *, "SIZE: ", vector%size()

    end subroutine createappenddestroy

end program example

