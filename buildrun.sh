#!/bin/bash

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
./build/bin/cexample
echo "==========="
echo "C++ Example"
./build/bin/cppexample
echo "==========="
echo "Fortran Example"
./build/bin/fortranexample
echo "==========="
