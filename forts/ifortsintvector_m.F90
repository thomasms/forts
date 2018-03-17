module ifortsintvector_m

    !< C functions declaration
    !! Maps one to one with fortsvector.h
    !! For API documentation see the C header file
    interface
        function FortCreateC() result(ptr) bind(C, name="FortIntCreate")
            use iso_c_binding
            implicit none
            type(c_ptr) :: ptr
        end function FortCreateC

        function FortCloneC(ptr) result(clone) bind(C, name="FortIntClone")
            use iso_c_binding
            implicit none
            type(c_ptr), intent(in), value :: ptr
            type(c_ptr)                    :: clone
        end function FortCloneC

        subroutine FortResetC(ptr) bind(C, name="FortIntReset")
            use iso_c_binding
            implicit none
            type(c_ptr), intent(in), value :: ptr
        end subroutine FortResetC

        subroutine FortDestroyC(ptr) bind(C, name="FortIntDestroy")
            use iso_c_binding
            implicit none
            type(c_ptr), intent(in), value :: ptr
        end subroutine FortDestroyC

        function FortSizeC(ptr) result(sze) bind(C, name="FortIntSize")
            use iso_c_binding
            implicit none
            type(c_ptr), intent(in), value  :: ptr
            integer(kind=c_int)             :: sze
        end function FortSizeC

        function FortGetC(ptr, index) result(value) bind(C, name="FortIntGet")
            use iso_c_binding
            implicit none
            type(c_ptr), intent(in), value           :: ptr
            integer(kind=c_int), intent(in), value   :: index
            integer(kind=c_int)                      :: value
        end function FortGetC

        subroutine FortAppendC(ptr, value) bind(C, name="FortIntAppend")
            use iso_c_binding
            implicit none
            type(c_ptr), intent(in), value          :: ptr
            integer(kind=c_int), intent(in), value  :: value
        end subroutine FortAppendC

    end interface

end module ifortsintvector_m

