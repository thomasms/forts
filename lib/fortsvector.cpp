#include <iostream>

#include "fortsvector.h"

std::ostream& PRINT = std::cout;

FortPtr METHODNAME(Create)(){
    try{
        //PRINT << "Creating...\n";
        return new FortStruct<>();
    }
    catch(...){
        PRINT << "Unknown error when creating container\n";
        return nullptr;
    }
}

FortPtr METHODNAME(Clone)(PTR_CONST_VALUE ptr){
    try{
        //PRINT << "Cloning...\n";
        return new FortStruct<>(*ptr);
    }
    catch(...){
        PRINT << "Unknown error when cloning container\n";
        return nullptr;
    }
}

void METHODNAME(Reset)(PTR_CONST_VALUE ptr){
    try{
        ptr->raw.clear();
    }
    catch(...){
        PRINT << "Unknown error when reseting container\n";
    }
}

void METHODNAME(Destroy)(PTR_VALUE ptr){
    try{
        delete ptr;
        ptr = nullptr;
        //PRINT << "Deleting...\n";
    }
    catch(...){
        PRINT << "Unknown error when destroying container\n";
    }
}

int METHODNAME(Size)(PTR_CONST_VALUE ptr){
    try{
        return static_cast<int>(ptr->raw.size());
    }
    catch(...){
        PRINT << "Unknown error when getting the size of the container\n";
        return -1;
    }
}

ITEM METHODNAME(Get)(PTR_CONST_VALUE ptr, int index){
    try{
        return ptr->raw[index];
    }
    catch(...){
        PRINT << "Unknown error when getting a value from the container\n";
    }
}

void METHODNAME(Append)(PTR_CONST_VALUE ptr, ITEM value){
    try{
        ptr->raw.push_back(value);
    }
    catch(...){
        PRINT << "Unknown error when appending to the container\n";
    }
}

