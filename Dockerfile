FROM quay.io/pypa/manylinux2010_x86_64
ENV CMAKEVER="3.17.0" 
ENV GSLVER="2.6"
ENV HDF5VER="1.10.5"
RUN yum update -y && yum -y install openssl-devel openssh-server openssh-clients git && \
    curl -O https://cmake.org/files/v3.17/cmake-${CMAKEVER}.tar.gz && \
    curl -O ftp://ftp.gnu.org/gnu/gsl/gsl-${GSLVER}.tar.gz && \
    curl -LO https://support.hdfgroup.org/ftp/HDF5/releases/hdf5-1.10/hdf5-${HDF5VER}/src/hdf5-${HDF5VER}.tar.bz2 && \
    tar xf cmake-${CMAKEVER}.tar.gz && tar xf gsl-${GSLVER}.tar.gz && tar xf hdf5-${HDF5VER}.tar.bz2 && \
    cd cmake-${CMAKEVER} && ./configure && make && make install && \
    cd ../gsl-${GSLVER} && ./configure && make && make install && \
    cd ../hdf5-${HDF5VER} && ./configure --prefix=/usr/local --enable-cxx && make && make install && \
    rm -rf cmake-${CMAKEVER}* gsl-${GSLVER}* hdf5-${HDF5VER}*
