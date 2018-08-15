module fortsintcontainer_m
    use fork_m
    implicit none
    private

#define MACRO_CONTAINER_TYPE integer
#define MACRO_CONTAINER_KIND ki4
#define MACRO_CLASS_NAME FortsIntContainer

#define MACRO_CONTAINER_STORE_NAME store_int_container
#define MACRO_CONTAINER_RETRIEVE_NAME retrieve_int_container

#include "fortsgeneralcontainer_m.h"

#undef MACRO_CONTAINER_RETRIEVE_NAME
#undef MACRO_CONTAINER_STORE_NAME

#undef MACRO_CLASS_NAME
#undef MACRO_CONTAINER_KIND
#undef MACRO_CONTAINER_TYPE

end module fortsintcontainer_m

