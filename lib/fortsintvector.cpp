#include "fortsintvector.h"

#define ENTRYTYPE int
#define TYPENAME Int
#define METHODNAME(name) M_CONC(FORTNAME, M_CONC(TYPENAME,name))
#define FORTSTRUCT M_CONC(FORTNAME, M_CONC(TYPENAME,Struct))
#define FORTPTR M_CONC(FORTNAME, M_CONC(TYPENAME,Ptr))
#define PTR_VALUE FORTPTR
#define PTR_CONST_VALUE const FORTPTR

#include "fortsgeneralvectorimp.h"

#undef ENTRYTYPE
#undef TYPENAME
#undef METHODNAME
#undef FORTSTRUCT
#undef FORTPTR
#undef PTR_VALUE
#undef PTR_CONST_VALUE
