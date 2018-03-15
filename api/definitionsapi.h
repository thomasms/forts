#ifndef DEFINITIONS_HH
#define DEFINITIONS_HH

// define the import/export for shared libraries/dlls
#ifdef API_EXPORT
    #if defined(_MSC_VER)
        #define API_OPTIONAL_SPEC __declspec(dllexport)
    #elif defined(__GNUC__)
        #define API_OPTIONAL_SPEC __attribute__((visibility("default")))
    #else
        #pragma warning Unknown dynamic link export semantics.
    #endif
#elif API_IMPORT
    #if defined(_MSC_VER)
        #define API_OPTIONAL_SPEC __declspec(dllimport)
    #elif defined(__GNUC__)
        #define API_OPTIONAL_SPEC
    #else
        #pragma warning Unknown dynamic link import semantics.
    #endif
#else
    #define API_OPTIONAL_SPEC
#endif // API_EXPORT

#ifndef API_EXTERN_TAG
    #define API_EXTERN_TAG extern
#endif // API_EXTERN_TAG

#endif //DEFINITIONS_HH
