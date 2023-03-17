FROM ubuntu:latest
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
RUN apt-get -y update
RUN mkdir -p /opt/zig

# compiler dev
WORKDIR /zig
RUN apt-get install -y cmake build-essential lsb-release wget software-properties-common gnupg xz-utils libc6-dev build-essential zlib1g-dev
# install llvm-15
RUN wget https://apt.llvm.org/llvm.sh
RUN chmod +x llvm.sh
RUN ./llvm.sh 15
RUN apt-get install -y libclang-cpp15-dev libclang-common-15-dev clang-tools-15 libclang-15-dev liblld-15-dev
# make llvm-15 tools the default
RUN update-alternatives --install /usr/bin/clang clang /usr/bin/clang-15 100
RUN update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-15 100
RUN update-alternatives --install /usr/bin/lld lld /usr/bin/lld-15 100

# convenience tools
RUN apt-get install -y vim curl wget git less screen cpio unzip rsync bc file

CMD /bin/bash
