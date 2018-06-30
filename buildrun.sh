#!/bin/bash

dobuild(){
    mkdir -p $1
    cd $1
    mkdir -p toast
    cd toast
    cmake -DCMAKE_BUILD_TYPE=Release ../../external/toast
    make
    cd ..
    cmake -DCMAKE_BUILD_TYPE=Release ..
    make
    ./bin/cppunittests
    ./bin/fortranunittests
    cd ..
}

export FC=/usr/local/bin/gfortran-7
rm -rf buildgfortran
dobuild buildgfortran

export FC=/opt/intel/bin/ifort
rm -rf buildifort
dobuild buildifort
