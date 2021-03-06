#include "fortspreprocessor.h"

module ifortsintvector_m

#define FORTS_TYPE Int
#define FORTS_CTYPE ki4

    !< C functions declaration
    !! Maps one to one with fortsintvector.h
    !! For API documentation see the C header file
    interface
        function MACRO_METHODNAME(FORTS_TYPE,CreateC)() result(ptr) bind(C, name="FortsIntCreate")
            use iso_c_binding
            implicit none
            type(c_ptr) :: ptr
        end function MACRO_METHODNAME(FORTS_TYPE,CreateC)

        function MACRO_METHODNAME(FORTS_TYPE,CloneC)(ptr) result(clone) bind(C, name="FortsIntClone")
            use iso_c_binding
            implicit none
            type(c_ptr), intent(in), value :: ptr
            type(c_ptr)                    :: clone
        end function MACRO_METHODNAME(FORTS_TYPE,CloneC)

        subroutine MACRO_METHODNAME(FORTS_TYPE,ResetC)(ptr) bind(C, name="FortsIntReset")
            use iso_c_binding
            implicit none
            type(c_ptr), intent(in), value :: ptr
        end subroutine MACRO_METHODNAME(FORTS_TYPE,ResetC)

        subroutine MACRO_METHODNAME(FORTS_TYPE,DestroyC)(ptr) bind(C, name="FortsIntDestroy")
            use iso_c_binding
            implicit none
            type(c_ptr), intent(in), value :: ptr
        end subroutine MACRO_METHODNAME(FORTS_TYPE,DestroyC)

        function MACRO_METHODNAME(FORTS_TYPE,SizeC)(ptr) result(sze) bind(C, name="FortsIntSize")
            use iso_c_binding
            use fork_m
            implicit none
            type(c_ptr), intent(in), value  :: ptr
            integer(kind=ki4)               :: sze
        end function MACRO_METHODNAME(FORTS_TYPE,SizeC)

        function MACRO_METHODNAME(FORTS_TYPE,GetC)(ptr, index) result(value) bind(C, name="FortsIntGet")
            use iso_c_binding
            use fork_m
            implicit none
            type(c_ptr), intent(in), value           :: ptr
            integer(kind=ki4), intent(in), value   :: index
            integer(kind=FORTS_CTYPE)                :: value
        end function MACRO_METHODNAME(FORTS_TYPE,GetC)

        subroutine MACRO_METHODNAME(FORTS_TYPE,AppendC)(ptr, value) bind(C, name="FortsIntAppend")
            use iso_c_binding
            use fork_m
            implicit none
            type(c_ptr), intent(in), value                :: ptr
            integer(kind=FORTS_CTYPE), intent(in), value  :: value
        end subroutine MACRO_METHODNAME(FORTS_TYPE,AppendC)

        subroutine MACRO_METHODNAME(FORTS_TYPE,ReserveC)(ptr, size) bind(C, name="FortsIntReserve")
            use iso_c_binding
            use fork_m
            implicit none
            type(c_ptr), intent(in), value        :: ptr
            integer(kind=ki4), intent(in), value  :: size
        end subroutine MACRO_METHODNAME(FORTS_TYPE,ReserveC)

    end interface

end module ifortsintvector_m

