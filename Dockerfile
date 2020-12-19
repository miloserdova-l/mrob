FROM quay.io/pypa/manylinux2010_x86_64
RUN yum install -y chrpath && yum remove cmake -y && yum clean all && rm -rf /var/lib/{yum,rpm}
RUN set -xueo pipefail \
 && export NUMPROC=$(grep -Ec '^processor\s+:' /proc/cpuinfo) \
 && cd /usr/src \
 && curl -OL https://cmake.org/files/v3.6/cmake-3.6.2.tar.gz \
 && tar -zxvf ./cmake-3.6.2.tar.gz \
 && cd ./cmake-3.6.2 \
 && ./bootstrap --parallel=$NUMPROC --prefix=/usr/local \
 && make -j $NUMPROC \
 && make install/strip -j $NUMPROC \
 && rm -rf /usr/src/cmake-3.6.2*

RUN echo "export PATH=/usr/local/bin:$PATH:$HOME/bin" >> ~/.bashrc
ENV BASH_ENV /etc/profile
