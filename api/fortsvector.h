#ifndef FORTS_VECTOR_HH
#define FORTS_VECTOR_HH

#include "definitionsapi.h"

#ifdef __cplusplus
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
    struct FortStruct;
    typedef FortStruct* FortPtr;
#else
    /**
     *   @brief  From the C side, the C pointer
     *           is merely wrapped as an opaque pointer
     */
    typedef void* FortPtr;
#endif
    
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
    API_OPTIONAL_SPEC FortPtr FortClone(const FortPtr& ptr);
    
    /**
     *   @brief  Resets an instance of the container.
     *           Does not deallocate, just resets the data to defaults
     *
     *   @param  ptr is the object to reset
     */
    API_OPTIONAL_SPEC void FortReset(FortPtr& ptr);
    
    /**
     *   @brief  Destroys an instance of the container.
     *           Performs the deallocation
     *
     *   @param  ptr is the object to destroy
     */
    API_OPTIONAL_SPEC void FortDestroy(FortPtr& ptr);
    
    /**
     *   @brief  Gets the size of the container
     *
     *   @param   ptr object
     *   @return  the size of the container
     */
    API_OPTIONAL_SPEC int FortSize(const FortPtr& ptr);
    
    /**
     *   @brief  Gets the nth (index) value in the container
     *
     *   @param   ptr object
     *   @param   index in the container must be >=0 and < FortSize
     *   @return  The value
     */
    API_OPTIONAL_SPEC int FortGet(const FortPtr& ptr, int index);
    
    /**
     *   @brief  Append to the container
     *
     *   @param   ptr object
     *   @param   the value to add
     */
    API_OPTIONAL_SPEC void FortAppend(FortPtr& ptr, int value);
    
#ifdef __cplusplus
}
#endif

#endif //FORTS_VECTOR_HH

