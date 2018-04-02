#!/bin/bash

export FC=/usr/local/bin/gfortran-7
mkdir -p build
cd build
cmake -DCMAKE_BUILD_TYPE=Release ..
make
cd ..

echo "==========="
echo "C Example"
./build/bin/cexample
echo "==========="
echo "C++ Example"
./build/bin/cppexample
echo "==========="
echo "Fortran Example"
./build/bin/fortranexample
echo "==========="

export FC=/opt/intel/bin/ifort
mkdir -p buildifort
cd buildifort
cmake -DCMAKE_BUILD_TYPE=Release ..
make
cd ..

echo "==========="
echo "C Example"
./buildifort/bin/cexample
echo "==========="
echo "C++ Example"
./buildifort/bin/cppexample
echo "==========="
echo "Fortran Example"
./buildifort/bin/fortranexample
echo "==========="
