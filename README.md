# zig-compiler-env

Quick and dirty docker container in which to build zig's compiler from source

Clone the repos:

    git clone https://github.com/ringtailsoftware/zig-compiler-env
    cd zig-compiler-env
    git clone https://github.com/ziglang/zig.git

Setup environment and drop into a bash shell in the container

    make

Build the compiler

    cd zig
    mkdir build && cd build
    cmake ../
    time make install

Have a cup of tea

    file /zig/zig/build/stage3/bin/zig
    /zig/zig/build/stage3/bin/zig version


## Running `make` does the following

 - builds an ubuntu based docker container with llvm-19
 - mounts the current directory on the host into /zig inside the container
 - drops into a bash shell in the container

