#include <iostream>

#include "fortsvector.h"

int main(){

    FortPtr ptr = FortCreate();

    FortAppend(ptr, 2);
    FortAppend(ptr, 4);
    FortAppend(ptr, 89);
    FortAppend(ptr, 489);
    FortAppend(ptr, -2189);
    FortAppend(ptr, 223321389);
    
    std::cout << "Size: " << FortSize(ptr) << "\n";
    
    FortDestroy(ptr);
    
    return 0;
}
