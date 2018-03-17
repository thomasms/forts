module ifortsvector_m

    !< C functions declaration
    !! Maps one to one with fortsvector.h
    !! For API documentation see the C header file
    interface
        function FortCreateC() result(ptr) bind(C, name="FortCreate")
            use iso_c_binding
            implicit none
            type(c_ptr) :: ptr
        end function FortCreateC

        function FortCloneC(ptr) result(clone) bind(C, name="FortClone")
            use iso_c_binding
            implicit none
            type(c_ptr), intent(in), value :: ptr
            type(c_ptr)                    :: clone
        end function FortCloneC

        subroutine FortResetC(ptr) bind(C, name="FortReset")
            use iso_c_binding
            implicit none
            type(c_ptr), intent(in), value :: ptr
        end subroutine FortResetC

        subroutine FortDestroyC(ptr) bind(C, name="FortDestroy")
            use iso_c_binding
            implicit none
            type(c_ptr) :: ptr
        end subroutine FortDestroyC

        function FortSizeC(ptr) result(sze) bind(C, name="FortSize")
            use iso_c_binding
            implicit none
            type(c_ptr), intent(in), value  :: ptr
            integer(kind=c_int)             :: sze
        end function FortSizeC

        function FortGetC(ptr, index) result(value) bind(C, name="FortGet")
            use iso_c_binding
            implicit none
            type(c_ptr), intent(in), value           :: ptr
            integer(kind=c_int), intent(in), value   :: index
            integer(kind=c_int)                      :: value
        end function FortGetC

        subroutine FortAppendC(ptr, value) bind(C, name="FortAppend")
            use iso_c_binding
            implicit none
            type(c_ptr), intent(in), value          :: ptr
            integer(kind=c_int), intent(in), value  :: value
        end subroutine FortAppendC

    end interface

end module ifortsvector_m

