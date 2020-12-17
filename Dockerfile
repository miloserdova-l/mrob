FROM quay.io/pypa/manylinux2010_x86_64

RUN yum install -y wget chrpath \
 && yum groupinstall -y 'Development Tools' \
 && yum remove cmake -y  \
 && cd /usr/src \
 && wget https://cmake.org/files/v3.6/cmake-3.6.2.tar.gz \
 && tar -zxvf ./cmake-3.6.2.tar.gz \
 && cd ./cmake-3.6.2 \
 && ./bootstrap --prefix=/usr/local \
 && make \
 && make install \
 && echo "PATH=/usr/local/bin:$PATH:$HOME/bin" >> ~/.bash_profile \
 && echo "export PATH" >> ~/.bash_profile




