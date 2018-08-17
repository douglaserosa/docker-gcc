FROM ubuntu
LABEL maintainer="Douglas Eduardo Rosa douglas.erosa@gmail.com"

RUN apt-get update
RUN apt-get upgrade -y
# RUN apt-get install -y build-essential
RUN apt-get install -y make
RUN apt-get install -y cmake
RUN apt-get install -y vim

ADD toolchains/ /toolchains/

# ENV CC="/toolchains/android/arm/bin/clang --sysroot=/toolchains/android/arm/sysroot -pie"
# ENV CXX="/toolchains/android/arm/bin/clang++ --sysroot=/toolchains/android/arm/sysroot -pie -static-libstdc++"
# ENV PATH=$PATH:/toolchains/android/arm/bin/

# Add the standalone toolchain to the search path.
ENV PATH=$PATH:/toolchains/arm/api21/gcc/bin

# Tell configure what tools to use.
ENV AR=arm-linux-androideabi-ar
ENV AS=arm-linux-androideabi-as
ENV CC=arm-linux-androideabi-gcc
ENV CXX=arm-linux-androideabi-g++
ENV LD=arm-linux-androideabi-ld
ENV STRIP=arm-linux-androideabi-strip

# Tell configure what flags Android requires.
ENV CFLAGS="-fPIE -fPIC"
ENV LDFLAGS="-pie"


RUN apt-get autoremove
RUN apt-get clean