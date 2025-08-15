#!/bin/sh

fileName=$1

# Compile
# https://docs.google.com/spreadsheets/d/1HXyOXt5bKwhKWXruzUvfMFHQtBxfZQ0047W7VVObnXI/edit?gid=408033513#gid=408033513&range=M43
g++-12 -std=gnu++2b -O2 -DLOCAL \
    -Wall -Wextra \
    -mtune=native -march=native \
    -fconstexpr-depth=2147483647 -fconstexpr-loop-limit=2147483647 -fconstexpr-ops-limit=2147483647 \
    -I/opt/ac-library -I/opt/boost/gcc/include -L/opt/boost/gcc/lib \
    -o a.out $fileName \
    -lgmpxx -lgmp \
    -I/usr/include/eigen3

if [ $? -ne 0 ]; then
    echo "[ERROR] Compile"
    exit 1
fi
echo "[SUCCESS] Compile"

# Run
./a.out
