#include "fortspreprocessor.h"

module ifortsintvector_m

#define MACRO_CTYPE c_int

    !< C functions declaration
    !! Maps one to one with fortsvector.h
    !! For API documentation see the C header file
    interface
        function MACRO_METHODNAME(Int,CreateC)() result(ptr) bind(C, name="FortIntCreate")
            use iso_c_binding
            implicit none
            type(c_ptr) :: ptr
        end function MACRO_METHODNAME(Int,CreateC)

        function MACRO_METHODNAME(Int,CloneC)(ptr) result(clone) bind(C, name="FortIntClone")
            use iso_c_binding
            implicit none
            type(c_ptr), intent(in), value :: ptr
            type(c_ptr)                    :: clone
        end function MACRO_METHODNAME(Int,CloneC)

        subroutine MACRO_METHODNAME(Int,ResetC)(ptr) bind(C, name="FortIntReset")
            use iso_c_binding
            implicit none
            type(c_ptr), intent(in), value :: ptr
        end subroutine MACRO_METHODNAME(Int,ResetC)

        subroutine MACRO_METHODNAME(Int,DestroyC)(ptr) bind(C, name="FortIntDestroy")
            use iso_c_binding
            implicit none
            type(c_ptr), intent(in), value :: ptr
        end subroutine MACRO_METHODNAME(Int,DestroyC)

        function MACRO_METHODNAME(Int,SizeC)(ptr) result(sze) bind(C, name="FortIntSize")
            use iso_c_binding
            implicit none
            type(c_ptr), intent(in), value  :: ptr
            integer(kind=c_int)             :: sze
        end function MACRO_METHODNAME(Int,SizeC)

        function MACRO_METHODNAME(Int,GetC)(ptr, index) result(value) bind(C, name="FortIntGet")
            use iso_c_binding
            implicit none
            type(c_ptr), intent(in), value           :: ptr
            integer(kind=c_int), intent(in), value   :: index
            integer(kind=MACRO_CTYPE)                :: value
        end function MACRO_METHODNAME(Int,GetC)

        subroutine MACRO_METHODNAME(Int,AppendC)(ptr, value) bind(C, name="FortIntAppend")
            use iso_c_binding
            implicit none
            type(c_ptr), intent(in), value                :: ptr
            integer(kind=MACRO_CTYPE), intent(in), value  :: value
        end subroutine MACRO_METHODNAME(Int,AppendC)

        subroutine MACRO_METHODNAME(Int,ReserveC)(ptr, size) bind(C, name="FortIntReserve")
            use iso_c_binding
            implicit none
            type(c_ptr), intent(in), value          :: ptr
            integer(kind=c_int), intent(in), value  :: size
        end subroutine MACRO_METHODNAME(Int,ReserveC)

    end interface

end module ifortsintvector_m

