#ifndef FORTS_PREPROCESSOR_H
#define FORTS_PREPROCESSOR_H

#ifdef __INTEL__
#define MACRO_CAT2(A,B) A ## B
#define MACRO_CAT3(A,B,C) A ## B ## C
#define MACRO_STRINGIFY(A) #A
#else
#define MACRO_SAME(A) A
#define MACRO_CAT2(A,B) MACRO_SAME(A)B
#define MACRO_CAT3(A,B,C) MACRO_CAT2(A,B)C
#define MACRO_STRINGIFY(A) "A"
#endif

#define MACRO_TYPENAME(type) MACRO_CAT3(Forts,type,Vector)
#define MACRO_INTERFACEMODULE(type) MACRO_CAT3(iforts,type,vector_m)
#define MACRO_MODULESTART(type) module MACRO_CAT3(forts,type,vector_m)
#define MACRO_MODULEEND(type) end module MACRO_CAT3(forts,type,vector_m)
#define MACRO_METHODNAME(type,name) MACRO_CAT3(Forts,type,name)

#endif
