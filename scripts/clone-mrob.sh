#!/bin/bash

mkdir ~/soft
cd ~/soft

git clone --recursive --branch feature/wheel https://github.com/miloserdova-l/mrob
cd ~/soft/mrob
git submodule update --recursive 
mkdir build
