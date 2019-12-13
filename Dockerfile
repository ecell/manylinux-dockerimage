FROM quay.io/pypa/manylinux2010_x86_64

RUN curl -O https://cmake.org/files/v3.13/cmake-3.13.3.tar.gz && tar xf cmake-3.13.3.tar.gz && \
    cd cmake-3.13.3 && ./configure && make && make install && \
    cd .. && rm -rf cmake-3.13* && \
    curl -O ftp://ftp.gnu.org/gnu/gsl/gsl-2.4.tar.gz && tar xf gsl-2.4.tar.gz && \
    cd gsl-2.4 && ./configure && make && make install && \
    cd .. && rm -rf gsl-2.4*
    
