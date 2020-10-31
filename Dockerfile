FROM centos:7

RUN yum install -y git && \
	yum groupinstall -y "Development Tools" && \
	yum install -y wget && \
	yum install -y python3 && \
    yum install -y epel-release && \
    yum install -y python36-distutils-extra && \
    yum install -y python36-devel && \
    python3 -m pip install --user --upgrade pip && \
    python3 -m pip install --user numpy && \
    python3 -m pip install -q pep517 && \
    yum clean all
    

RUN wget https://cmake.org/files/v3.6/cmake-3.6.2.tar.gz && \
    tar -zxvf cmake-3.6.2.tar.gz
WORKDIR /cmake-3.6.2
RUN ./bootstrap --prefix=/usr/local && \
    make && \
    make install
    
WORKDIR /root
RUN mkdir soft
WORKDIR /root/soft
RUN git clone --recursive https://github.com/miloserdova-l/mrob
WORKDIR /root/soft/mrob
RUN git submodule update --recursive && \
    mkdir build
WORKDIR /root/soft/mrob/build 
RUN cmake .. && \
	make -j4

WORKDIR /root/soft
RUN mkdir wheel && \
	cp -a ./mrob/lib ./wheel/mrob
WORKDIR /root/soft/wheel/mrob	
RUN touch __init__.py && \
	chmod +x __init__.py && \
	echo "#TODO" > __init__.py 
	
ADD pyproject.toml /root/soft/wheel/pyproject.toml
ADD setup.cfg /root/soft/wheel/setup.cfg
WORKDIR /root/soft/wheel
RUN mkdir dist && \
	python3 -m pep517.build . && \
	python3 -m pip install ./dist/mrob-0.0.1-py3-none-any.whl
