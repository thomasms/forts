#define METHODNAME(name) M_CONC(FORTNAME, M_CONC(TYPENAME,name))
#define FORTSTRUCT M_CONC(FORTNAME, M_CONC(TYPENAME,Struct))
#define FORTPTR M_CONC(FORTNAME, M_CONC(TYPENAME,Ptr))
#define PTR_VALUE FORTPTR
#define PTR_CONST_VALUE const FORTPTR

#ifdef __cplusplus

#include <vector>

template<typename T = ENTRYTYPE>
struct FORTSTRUCT{
    std::vector<T> raw;
};

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
    typedef FORTSTRUCT<>* FORTPTR;
#else
    /**
     *   @brief  From the C side, the C pointer
     *           is merely wrapped as an opaque pointer
     *           using an anonymous struct for some type safety
     */
    struct FORTSTRUCT;
    typedef struct FORTSTRUCT* FORTPTR;
#endif // __cplusplus
    
    /**
     *   @brief  Creates an instance of the container.
     *           Performs heap allocation.
     *           Must be deallocated with FortDestroy
     *
     *           Returns a new instance of the container
     *
     *   @return FortPtr object
     */
    API_OPTIONAL_SPEC FORTPTR METHODNAME(Create)();
    
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
    API_OPTIONAL_SPEC FORTPTR METHODNAME(Clone)(PTR_CONST_VALUE ptr);
    
    /**
     *   @brief  Resets an instance of the container.
     *           Does not deallocate, just resets the data to defaults
     *
     *   @param  ptr is the object to reset
     */
    API_OPTIONAL_SPEC void METHODNAME(Reset)(PTR_CONST_VALUE ptr);
    
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
    API_OPTIONAL_SPEC void METHODNAME(Destroy)(PTR_VALUE ptr);
    
    /**
     *   @brief  Gets the size of the container
     *
     *   @param   ptr object
     *   @return  the size of the container
     */
    API_OPTIONAL_SPEC int METHODNAME(Size)(PTR_CONST_VALUE ptr);
    
    /**
     *   @brief  Gets the nth (index) value in the container
     *
     *   @param   ptr object
     *   @param   index in the container must be >=0 and < FortSize
     *   @return  The value
     */
    API_OPTIONAL_SPEC ENTRYTYPE METHODNAME(Get)(PTR_CONST_VALUE ptr, int index);
    
    /**
     *   @brief  Append to the container
     *
     *   @param   ptr object
     *   @param   the value to add
     */
    API_OPTIONAL_SPEC void METHODNAME(Append)(PTR_CONST_VALUE ptr, ENTRYTYPE value);
    
    /**
     *   @brief  Reserve size
     *
     *   @param   ptr object
     *   @param   Reserve a size
     */
    API_OPTIONAL_SPEC void METHODNAME(Reserve)(PTR_CONST_VALUE ptr, int size);
    
#ifdef __cplusplus
}
#endif

#undef METHODNAME
#undef FORTSTRUCT
#undef FORTPTR
#undef PTR_VALUE
#undef PTR_CONST_VALUE

