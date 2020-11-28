FROM quay.io/pypa/manylinux2010_x86_64

RUN yum install -y wget chrpath 
RUN yum groupinstall -y 'Development Tools'
#RUN yum install -y nano

RUN mkdir /scripts

ADD ./scripts/build-cmake.sh /scripts/build-cmake.sh
RUN chmod +x /scripts/build-cmake.sh \
 && /scripts/build-cmake.sh

ADD ./scripts/clone-mrob.sh /scripts/clone-mrob.sh
RUN chmod +x /scripts/clone-mrob.sh \
 && /scripts/clone-mrob.sh

RUN mkdir -p /root/soft/wheel/mrob \
 && mkdir /root/soft/wheel/dist

ADD __init__.py /root/soft/wheel/mrob/__init__.py
ADD pyproject.toml /root/soft/wheel/pyproject.toml
ADD setup.cfg /root/soft/wheel/setup.cfg

ADD ./scripts/build-wheels.sh /scripts/build-wheels.sh
RUN chmod +x /scripts/build-wheels.sh \
 && /scripts/build-wheels.sh



