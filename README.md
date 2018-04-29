# Forts
## For those who hate linked lists in Fortran
### Wraps c++ containers for fortran

[![Build Status](https://travis-ci.org/thomasms/forts.svg?branch=master)](https://travis-ci.org/thomasms/forts)

So far only supports std::vector with integer and double kinds. Some benchmarking is done against a native dynamic integer array in Fortran and it shows just how quick the c++ implementation is in comparison. For appends in excess of 100,000 the difference is huge!!

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
- Needs more unit testing
- Needs more benchmarking
- Other container types
- Generic structure containers
