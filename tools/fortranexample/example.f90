program example
    use fortsvector_m

    type(FortsVector) :: vector

    call vector%init()

    call vector%append(2)
    call vector%append(1)
    call vector%append(6)
    call vector%append(-9)
    call vector%append(3)

    print *, "SIZE: ", vector%size()

end program example
