#!/bin/bash

LATEST=""


mkdir ./build
mkdir ./dist
mkdir ./mrob

cp ./__init__.py ./mrob/__init__.py 

cd ./build

NUMPROC=$(grep -Ec '^processor\s+:' /proc/cpuinfo)

for PYBIN in /opt/python/cp3*/bin/
do
    LATEST=${PYBIN}

    cmake .. -DPYTHON_EXECUTABLE:FILEPATH=${PYBIN}python3
    make -j $NUMPROC
    
    mv ../lib/* ../mrob
done

chrpath -r '$ORIGIN' ../mrob/mrob.*.so
${LATEST}python3 -m pip install --user -q pep517
${LATEST}python3 -m pep517.build ../

