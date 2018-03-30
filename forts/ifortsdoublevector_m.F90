#include "fortspreprocessor.h"

module ifortsdoublevector_m

#define FORTS_TYPE Double
#define FORTS_CTYPE c_double

    !< C functions declaration
    !! Maps one to one with fortsdoublevector.h
    !! For API documentation see the C header file
    interface
        function MACRO_METHODNAME(FORTS_TYPE,CreateC)() result(ptr) bind(C, name="FortsDoubleCreate")
            use iso_c_binding
            implicit none
            type(c_ptr) :: ptr
        end function MACRO_METHODNAME(FORTS_TYPE,CreateC)

        function MACRO_METHODNAME(FORTS_TYPE,CloneC)(ptr) result(clone) bind(C, name="FortsDoubleClone")
            use iso_c_binding
            implicit none
            type(c_ptr), intent(in), value :: ptr
            type(c_ptr)                    :: clone
        end function MACRO_METHODNAME(FORTS_TYPE,CloneC)

        subroutine MACRO_METHODNAME(FORTS_TYPE,ResetC)(ptr) bind(C, name="FortsDoubleReset")
            use iso_c_binding
            implicit none
            type(c_ptr), intent(in), value :: ptr
        end subroutine MACRO_METHODNAME(FORTS_TYPE,ResetC)

        subroutine MACRO_METHODNAME(FORTS_TYPE,DestroyC)(ptr) bind(C, name="FortsDoubleDestroy")
            use iso_c_binding
            implicit none
            type(c_ptr), intent(in), value :: ptr
        end subroutine MACRO_METHODNAME(FORTS_TYPE,DestroyC)

        function MACRO_METHODNAME(FORTS_TYPE,SizeC)(ptr) result(sze) bind(C, name="FortsDoubleSize")
            use iso_c_binding
            implicit none
            type(c_ptr), intent(in), value  :: ptr
            integer(kind=c_int)             :: sze
        end function MACRO_METHODNAME(FORTS_TYPE,SizeC)

        function MACRO_METHODNAME(FORTS_TYPE,GetC)(ptr, index) result(value) bind(C, name="FortsDoubleGet")
            use iso_c_binding
            implicit none
            type(c_ptr), intent(in), value           :: ptr
            integer(kind=c_int), intent(in), value   :: index
            real(kind=FORTS_CTYPE)                :: value
        end function MACRO_METHODNAME(FORTS_TYPE,GetC)

        subroutine MACRO_METHODNAME(FORTS_TYPE,AppendC)(ptr, value) bind(C, name="FortsDoubleAppend")
            use iso_c_binding
            implicit none
            type(c_ptr), intent(in), value                :: ptr
            real(kind=FORTS_CTYPE), intent(in), value  :: value
        end subroutine MACRO_METHODNAME(FORTS_TYPE,AppendC)

        subroutine MACRO_METHODNAME(FORTS_TYPE,ReserveC)(ptr, size) bind(C, name="FortsDoubleReserve")
            use iso_c_binding
            implicit none
            type(c_ptr), intent(in), value          :: ptr
            integer(kind=c_int), intent(in), value  :: size
        end subroutine MACRO_METHODNAME(FORTS_TYPE,ReserveC)

    end interface

end module ifortsdoublevector_m

