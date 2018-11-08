FROM centos

ENV SIPP_VERSION 3.5.2

RUN yum makecache && yum install -y which gcc-c++ gcc automake autoconf libtool make libpcap libpcap-devel ncurses ncurses-devel openssl openssl-devel lksctp-tools lksctp-tools-devel gsl gsl-devel && \
    mkdir /build && cd /build && \
    curl -sqLkv https://github.com/SIPp/sipp/releases/download/v${SIPP_VERSION}/sipp-${SIPP_VERSION}.tar.gz | tar xvzf - --strip-components=1 && \
    ./build.sh --full && make install && \
    cd / && rm -rf /build
