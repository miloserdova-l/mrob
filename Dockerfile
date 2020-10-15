FROM centos:7

RUN yum install -y git
RUN yum groupinstall -y "Development Tools"
RUN yum install -y wget
RUN wget https://cmake.org/files/v3.6/cmake-3.6.2.tar.gz
RUN tar -zxvf cmake-3.6.2.tar.gz
WORKDIR /cmake-3.6.2
RUN ./bootstrap --prefix=/usr/local
RUN gmake
RUN make
RUN make install
WORKDIR /root
RUN yum install -y python3
RUN yum install -y epel-release
RUN yum install -y python36-distutils-extra
RUN yum install -y python36-devel
RUN mkdir soft
WORKDIR /root/soft
RUN git clone --recursive https://github.com/miloserdova-l/mrob
WORKDIR /root/soft/mrob
RUN git submodule update --recursive
RUN mkdir build
WORKDIR /root/soft/mrob/build
RUN cmake ..
RUN make -j
RUN echo export PYTHONPATH=\"/root/soft/mrob/lib\" >> ~/.bashrc
RUN source ~/.bashrc
RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install --user numpy
