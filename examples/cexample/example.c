#include <stdio.h>

#include "fortsintvector.h"
#include "fortsdoublevector.h"

int main(){

    FortsIntPtr ptr = FortsIntCreate();
    FortsDoublePtr ptr2 = FortsDoubleCreate();

    FortsIntReserve(ptr, 3);
    
    FortsIntAppend(ptr, 2);
    FortsIntAppend(ptr, 4);
    FortsIntAppend(ptr, 89);
    FortsDoubleAppend(ptr2, 287.3321389);
    
    printf("Second value is: %i \n", FortsIntGet(ptr, 1));
    printf("Size: %i \n", FortsIntSize(ptr));
    printf("First value is: %f \n", FortsDoubleGet(ptr2, 0));
    
    FortsIntDestroy(ptr);
    FortsDoubleDestroy(ptr2);
    
    return 0;
}
