#!/bin/sh

fileName=$1

# Compile
# https://docs.google.com/spreadsheets/d/1HXyOXt5bKwhKWXruzUvfMFHQtBxfZQ0047W7VVObnXI/edit?gid=408033513#gid=408033513&range=M43
g++-12 -std=gnu++2b -g -O0 -DLOCAL \
    -fsanitize=undefined,address \
    -I/opt/ac-library -I/opt/boost/gcc/include -L/opt/boost/gcc/lib \
    -o a.out $fileName \
    -lgmpxx -lgmp \
    -I/usr/include/eigen3
# g++-12 -std=gnu++2b -O2 -DONLINE_JUDGE -DATCODER \
#     -Wall -Wextra \
#     -mtune=native -march=native \
#     -fconstexpr-depth=2147483647 -fconstexpr-loop-limit=2147483647 -fconstexpr-ops-limit=2147483647 \
#     -I/opt/ac-library -I/opt/boost/gcc/include -L/opt/boost/gcc/lib \
#     -o a.out $fileName \
#     -lgmpxx -lgmp \
#     -I/usr/include/eigen3

if [ $? -ne 0 ]; then
    echo "[ERROR] Compile"
    exit 1
fi
echo "[SUCCESS] Compile"

# Download
echo -n "ProblemURL: "
read problemURL
if [ -d test ]; then
    rm -rf test
fi
oj d ${problemURL}
if [ $? -ne 0 ]; then
    echo "[ERROR] Download"
    exit 1
fi

# Test
oj t --ignore-spaces -t 5 -e 1e-6
if [ $? -ne 0 ]; then
    exit 1
fi

# File name check
if [ ${fileName} = "submission.cpp" ]; then
    echo "[ERROR] Don't use submission.cpp"
    exit 1
fi

# Bundle
if [ ! -e submission.cpp ]; then
    touch submission.cpp
fi
oj-bundle ${fileName} >submission.cpp 2>/dev/null
if [ $? -ne 0 ]; then
    echo "[ERROR] Bundle"
    exit 1
fi

# Submit
oj s ${problemURL} submission.cpp
