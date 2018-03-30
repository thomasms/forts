# Forts
## C++ to Fortran
### Wraps c++ containers for fortran

So far only supports std::vector with integer and double kinds.

It heavily uses the preprocessor for both C and Fortran but users should not have to deal with it directly. It is used to make Fortran and C code generic.

### How to use
Integer (4 byte kind) vector in fortran.
```Fortran
program example
    use fortsintvector_m
    
    type(FortsIntVector) :: vector
    integer :: size
    
    ! Init is required always 
    call vector%init()
    
    call vector%append(38)
    call vector%append(-931)
    call vector%append(45)
    
    ! should equal 3
    size = vector%size()
    
    ! no need to destroy, finalize will take care of this
    
end program example
```

Real (8 byte kind) vector in fortran.
```Fortran
program example
    use fortsdoublevector_m

    type(FortsDoubleVector) :: vector
    integer :: size

    ! Init is required always
    call vector%init()

    call vector%append(3.48)
    call vector%append(-0.931)
    call vector%append(45.3e-8)

    ! should equal 3
    size = vector%size()
    
    ! no need to destroy, finalize will take care of this

end program example
```

Much more work needed:
- Needs unit testing
- Needs benchmarking
- Other container types
- Generic structure containers
