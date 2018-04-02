#include "catch.hpp"

#include "common.h"

#include "fortsintvector.h"

NAMESPACE_START(forts)
    SCENARIO( "TestCreateDestroy", "TestCreateDestroy" ){
        THEN( "Create and destroy" ) {
            auto ptr = FortsIntCreate();
            REQUIRE(ptr != nullptr);
            FortsIntDestroy(ptr);
        }
        THEN( "Create and destroy many times" ) {
            const size_t iterations = 10;
            FortsIntPtr ptr = nullptr;
            for(size_t i=0;i<iterations;++i){
                ptr = FortsIntCreate();
                REQUIRE(ptr != nullptr);
                FortsIntDestroy(ptr);
            }
        }
    }

    SCENARIO( "TestAppend", "TestAppend" ){
        auto ptr = FortsIntCreate();
        THEN( "Append" ) {
            FortsIntAppend(ptr, 89);
            REQUIRE(1 == FortsIntSize(ptr));
            REQUIRE(89 == FortsIntGet(ptr, 0));
        }
        THEN( "Append negative" ) {
            FortsIntAppend(ptr, -45);
            REQUIRE(1 == FortsIntSize(ptr));
            REQUIRE(-45 == FortsIntGet(ptr, 0));
        }
        THEN( "Append twice" ) {
            FortsIntAppend(ptr, 3);
            REQUIRE(1 == FortsIntSize(ptr));
            REQUIRE(3 == FortsIntGet(ptr, 0));
            FortsIntAppend(ptr, -93);
            REQUIRE(2 == FortsIntSize(ptr));
            REQUIRE(3 == FortsIntGet(ptr, 0));
            REQUIRE(-93 == FortsIntGet(ptr, 1));
        }
        FortsIntDestroy(ptr);
    }
NAMESPACE_END //fispact
