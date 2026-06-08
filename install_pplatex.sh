#!/usr/bin/bash
cd
git clone https://github.com/stefanhepp/pplatex
cd pplatex
cd build
cmake ..
make
sudo cp src/pplatex /usr/bin
cd && rm -rf pplatex

