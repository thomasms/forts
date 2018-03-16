#include <stdio.h>

#include "fortsvector.h"

int main(){

    FortPtr ptr = FortCreate();

    FortAppend(ptr, 2);
    FortAppend(ptr, 4);
    FortAppend(ptr, 89);
    
    printf("Size: %i \n", FortSize(ptr));
    
    FortDestroy(ptr);
    
    return 0;
}
