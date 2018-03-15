#include <iostream>
#include <vector>

#include "fortsvector.h"

std::ostream& PRINT = std::cout;

struct FortStruct{
    std::vector<int> raw;
};

FortPtr FortCreate(){
    try{
        return new FortStruct();
    }
    catch(...){
        PRINT << "Unknown error when creating container\n";
        return nullptr;
    }
}

FortPtr FortClone(const FortPtr& ptr){
    try{
        return new FortStruct(*ptr);
    }
    catch(...){
        PRINT << "Unknown error when cloning container\n";
        return nullptr;
    }
}

void FortReset(FortPtr& ptr){
    try{
        ptr->raw.clear();
    }
    catch(...){
        PRINT << "Unknown error when reseting container\n";
    }
}

void FortDestroy(FortPtr& ptr){
    try{
        delete ptr;
        ptr = nullptr;
    }
    catch(...){
        PRINT << "Unknown error when destroying container\n";
    }
}

int FortSize(const FortPtr& ptr){
    try{
        return static_cast<int>(ptr->raw.size());
    }
    catch(...){
        PRINT << "Unknown error when getting the size of the container\n";
        return -1;
    }
}

int FortGet(const FortPtr& ptr, int index){
    try{
        return ptr->raw[index];
    }
    catch(...){
        PRINT << "Unknown error when getting a value from the container\n";
    }
}

void FortAppend(FortPtr& ptr, int value){
    try{
        ptr->raw.push_back(value);
    }
    catch(...){
        PRINT << "Unknown error when appending to the container\n";
    }
}
