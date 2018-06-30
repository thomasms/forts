module fortsintvector_m
    use iso_c_binding
    use fork_m
    use ifortsintvector_m
    implicit none
    private

#define FORTS_TYPE Int
#define FORTS_CTYPE c_int
#define FORTS_FTYPE integer(kind=ki4)

#include "fortsgeneralvector_m.h"

#undef FORTS_TYPE 
#undef FORTS_CTYPE
#undef FORTS_FTYPE

end module fortsintvector_m
