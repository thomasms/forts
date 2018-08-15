module fortsrealcontainer_m
    use fork_m
    implicit none
    private

#define MACRO_CONTAINER_TYPE real
#define MACRO_CONTAINER_KIND kr8
#define MACRO_CLASS_NAME FortsRealContainer

#define MACRO_CONTAINER_STORE_NAME store_real_container
#define MACRO_CONTAINER_RETRIEVE_NAME retrieve_real_container

#include "fortsgeneralcontainer_m.h"

#undef MACRO_CONTAINER_RETRIEVE_NAME
#undef MACRO_CONTAINER_STORE_NAME

#undef MACRO_CLASS_NAME
#undef MACRO_CONTAINER_KIND
#undef MACRO_CONTAINER_TYPE

end module fortsrealcontainer_m
