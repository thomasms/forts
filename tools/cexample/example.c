#include <stdio.h>

#include "fortsvector.h"

int main(){

    FortPtr ptr = METHODNAME(Create)();

    METHODNAME(Reserve)(ptr, 3);
    
    METHODNAME(Append)(ptr, 2);
    METHODNAME(Append)(ptr, 4);
    METHODNAME(Append)(ptr, 89);
    
    printf("Second value is: %i \n", METHODNAME(Get)(ptr, 1));
    printf("Size: %i \n", METHODNAME(Size)(ptr));
    
    METHODNAME(Destroy)(ptr);
    
    return 0;
}
