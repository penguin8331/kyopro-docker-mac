FROM ubuntu:22.04

RUN apt update -y \
    && apt install -y wget unzip


##############################
# C++23 (AtCoder)
# https://docs.google.com/spreadsheets/d/1HXyOXt5bKwhKWXruzUvfMFHQtBxfZQ0047W7VVObnXI/edit?gid=408033513#gid=408033513&range=L43
##############################
RUN apt install -y g++-12

# GMP
RUN apt install -y libgmp3-dev

WORKDIR /tmp

# ac library
RUN mkdir /opt/ac-library
RUN wget https://github.com/atcoder/ac-library/releases/download/v1.5.1/ac-library.zip -O ac-library.zip
RUN unzip /tmp/ac-library.zip -d /opt/ac-library

# boost
RUN apt install -y build-essential
# RUN wget https://boostorg.jfrog.io/artifactory/main/release/1.82.0/source/boost_1_82_0.tar.gz -O boost_1_82_0.tar.gz
RUN wget https://archives.boost.io/release/1.82.0/source/boost_1_82_0.tar.gz -O boost_1_82_0.tar.gz
RUN tar xf boost_1_82_0.tar.gz
WORKDIR /tmp/boost_1_82_0
RUN ./bootstrap.sh --with-toolset=gcc --without-libraries=mpi,graph_parallel
RUN ./b2 -j3 toolset=gcc variant=release link=static runtime-link=static cxxflags="-std=c++2b" stage
RUN ./b2 -j3 toolset=gcc variant=release link=static runtime-link=static cxxflags="-std=c++2b" --prefix=/opt/boost/gcc install

# Eigen
RUN apt install -y libeigen3-dev=3.4.0-2ubuntu2


# Development tools
RUN apt install -y git gdb python3 python3-pip
RUN pip install online-judge-tools online-judge-verify-helper

# Add non-root user
ARG USERNAME
ARG USER_UID
ARG USER_GID
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd -m -s /bin/bash -u $USER_UID -g $USER_GID $USERNAME
