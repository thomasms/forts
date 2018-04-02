#include <iostream>

#include "fortsintvector.h"
#include "fortsdoublevector.h"

int main(){

    auto ptr = FortsIntCreate();
    auto ptr2 = FortsDoubleCreate();
    
    FortsIntAppend(ptr, 2);
    FortsIntAppend(ptr, 4);
    FortsIntAppend(ptr, 89);
    FortsIntAppend(ptr, 489);
    FortsIntAppend(ptr, -2189);
    FortsIntAppend(ptr, 223321389);
    FortsDoubleAppend(ptr2, 287.3321389);
    
    std::cout << "Third value is: " << FortsIntGet(ptr, 2) << "\n";
    std::cout << "Size: " << FortsIntSize(ptr) << "\n";
    std::cout << "First value is: " << FortsDoubleGet(ptr2, 0) << "\n";
    std::cout << "Size: " << FortsDoubleSize(ptr2) << "\n";
    
    FortsIntDestroy(ptr);
    FortsDoubleDestroy(ptr2);
    
    return 0;
}
