#!/bin/bash

mkdir ~/soft
cd ~/soft

git clone --recursive https://github.com/MobileRoboticsSkoltech/mrob
cd ~/soft/mrob
git submodule update --recursive 
mkdir build
