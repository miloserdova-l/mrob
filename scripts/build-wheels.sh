#!/bin/bash

LATEST=""

mkdir -p ~/soft/wheel/mrob
mkdir ~/soft/wheel/dist

cp ~/soft/mrob/README.md ~/soft/wheel/README.md 
cp ~/soft/mrob/LICENSE ~/soft/wheel/LICENSE
cp ~/soft/mrob/__init__.py ~/soft/wheel/mrob/__init__.py 
cp ~/soft/mrob/pyproject.toml ~/soft/wheel/pyproject.toml
cp ~/soft/mrob/setup.cfg ~/soft/wheel/setup.cfg

for PYBIN in /opt/python/cp3*/bin/
do
    LATEST=${PYBIN}

    cd ~/soft/mrob/build 
    cmake .. -DPYTHON_EXECUTABLE:FILEPATH=${PYBIN}python3
    make -j 4
    
    cp -a ~/soft/mrob/lib/* ~/soft/wheel/mrob
done

chrpath -r '$ORIGIN' ~/soft/wheel/mrob/mrob.*.so
${LATEST}python3 -m pip install --user -q pep517
${LATEST}python3 -m pep517.build ~/soft/wheel

