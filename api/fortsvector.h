#ifndef FORTS_VECTOR_HH
#define FORTS_VECTOR_HH

#include "definitionsapi.h"

typedef int ITEM;

#ifdef __cplusplus

template<typename T>
struct FortStruct;

extern "C" {
    /**
     *   @brief  From the C++ side, the C pointer
     *           is wrapped in a structure using a standard pointer
     *
     *           Sadly we cannot use shared pointers since this causes
     *           issues when calling from fortran. It is not clear if
     *           this is possible but it is far to difficult to figure out
     *           and does not add that much benefit.
     */
    typedef FortStruct<ITEM>* FortPtr;
    typedef FortPtr& PTR_REF;
#else
    /**
     *   @brief  From the C side, the C pointer
     *           is merely wrapped as an opaque pointer
     *           using an anonymous struct for some type safety
     */
    struct FortStruct;
    typedef struct FortStruct* FortPtr;
    typedef FortPtr PTR_REF;
#endif
    
    typedef FortPtr PTR_VALUE;
    typedef const FortPtr PTR_CONST_VALUE;
    
    /**
     *   @brief  Creates an instance of the container.
     *           Performs heap allocation.
     *           Must be deallocated with FortDestroy
     *
     *           Returns a new instance of the container
     *
     *   @return FortPtr object
     */
    API_OPTIONAL_SPEC FortPtr FortCreate();
    
    /**
     *   @brief  Clones an instance of the container.
     *           Performs heap allocation, similar to FortCreate.
     *           Must be deallocated with FortDestroy.
     *           The ptr to be copied still persists (deep copy),
     *           both must be destroyed.
     
     *           Returns a deep copy of container
     *
     *   @param  FortPtr is the object to copy
     *   @return FortPtr object
     */
    API_OPTIONAL_SPEC FortPtr FortClone(PTR_CONST_VALUE ptr);
    
    /**
     *   @brief  Resets an instance of the container.
     *           Does not deallocate, just resets the data to defaults
     *
     *   @param  ptr is the object to reset
     */
    API_OPTIONAL_SPEC void FortReset(PTR_CONST_VALUE ptr);
    
    /**
     *   @brief  Destroys an instance of the container.
     *           Performs the deallocation.
     *
     *           Multiple calls will cause seg faults.
     *           Since we pass by value, for C compatability,
     *           we must only call once.
     *
     *   @param  ptr is the object to destroy
     */
    API_OPTIONAL_SPEC void FortDestroy(PTR_VALUE ptr);
    
    /**
     *   @brief  Gets the size of the container
     *
     *   @param   ptr object
     *   @return  the size of the container
     */
    API_OPTIONAL_SPEC int FortSize(PTR_CONST_VALUE ptr);
    
    /**
     *   @brief  Gets the nth (index) value in the container
     *
     *   @param   ptr object
     *   @param   index in the container must be >=0 and < FortSize
     *   @return  The value
     */
    API_OPTIONAL_SPEC ITEM FortGet(PTR_CONST_VALUE ptr, int index);
    
    /**
     *   @brief  Append to the container
     *
     *   @param   ptr object
     *   @param   the value to add
     */
    API_OPTIONAL_SPEC void FortAppend(PTR_CONST_VALUE ptr, ITEM value);
    
#ifdef __cplusplus
}
#endif

#endif //FORTS_VECTOR_HH

