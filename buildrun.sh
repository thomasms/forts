#!/bin/bash

cd build
cmake ..
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
