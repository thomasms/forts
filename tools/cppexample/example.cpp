#include <iostream>

#include "fortsvector.h"

int main(){

    FortPtr ptr = METHODNAME(Create)();
    
    METHODNAME(Append)(ptr, 2);
    METHODNAME(Append)(ptr, 4);
    METHODNAME(Append)(ptr, 89);
    METHODNAME(Append)(ptr, 489);
    METHODNAME(Append)(ptr, -2189);
    METHODNAME(Append)(ptr, 223321389);
    
    std::cout << "Third value is: " << METHODNAME(Get)(ptr, 2) << "\n";
    std::cout << "Size: " << METHODNAME(Size)(ptr) << "\n";
    
    METHODNAME(Destroy)(ptr);
    
    return 0;
}
