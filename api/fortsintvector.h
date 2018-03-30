#ifndef FORTS_INT_VECTOR_HH
#define FORTS_INT_VECTOR_HH

#include "definitionsapi.h"

// hacky but lets try it for now
#define ENTRYTYPE int
#define TYPENAME Int
#define METHODNAME(name) M_CONC(FORTNAME, M_CONC(TYPENAME,name))
#define FORTSTRUCT M_CONC(FORTNAME, M_CONC(TYPENAME,Struct))
#define FORTPTR M_CONC(FORTNAME, M_CONC(TYPENAME,Ptr))
#define PTR_VALUE FORTPTR
#define PTR_CONST_VALUE const FORTPTR

#include "fortsgeneralvector.h"

#undef ENTRYTYPE
#undef TYPENAME
#undef METHODNAME
#undef FORTSTRUCT
#undef FORTPTR
#undef PTR_VALUE
#undef PTR_CONST_VALUE


#endif //FORTS_INT_VECTOR_HH

