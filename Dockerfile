FROM ubuntu:22.04

RUN apt-get update -y \
    && apt-get install -y wget unzip

# C++23
# https://docs.google.com/spreadsheets/d/1HXyOXt5bKwhKWXruzUvfMFHQtBxfZQ0047W7VVObnXI/edit?gid=408033513#gid=408033513&range=L43
RUN apt-get install -y g++-12 libgmp3-dev \
    && cd /tmp \
    && mkdir /opt/ac-library \
    && wget https://github.com/atcoder/ac-library/releases/download/v1.5.1/ac-library.zip -O ac-library.zip \
    && unzip /tmp/ac-library.zip -d /opt/ac-library \
    && apt-get install -y build-essential \
    && wget https://boostorg.jfrog.io/artifactory/main/release/1.82.0/source/boost_1_82_0.tar.gz -O boost_1_82_0.tar.gz \
    && tar xf boost_1_82_0.tar.gz \
    && cd boost_1_82_0 \
    && ./bootstrap.sh --with-toolset=gcc --without-libraries=mpi,graph_parallel \
    && ./b2 -j3 toolset=gcc variant=release link=static runtime-link=static cxxflags="-std=c++2b" stage \
    && ./b2 -j3 toolset=gcc variant=release link=static runtime-link=static cxxflags="-std=c++2b" --prefix=/opt/boost/gcc install \
    && apt-get install -y libeigen3-dev=3.4.0-2ubuntu2

# Development tools
RUN apt-get install -y git python3 python3-pip
RUN pip3 install online-judge-tools

# Add non-root user
ARG USERNAME
ARG USER_UID
ARG USER_GID
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME