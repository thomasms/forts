module fortsdoublevector_m
    use iso_c_binding
    use fork_m
    use ifortsdoublevector_m
    implicit none
    private

#define FORTS_TYPE Double
#define FORTS_CTYPE c_double
#define FORTS_FTYPE real(kind=kr8)

#include "fortsgeneralvector_m.h"

#undef FORTS_TYPE 
#undef FORTS_CTYPE
#undef FORTS_FTYPE

end module fortsdoublevector_m
