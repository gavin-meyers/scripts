#!/usr/bin/env sh
yum install gcc gcc-c++ make
yum install boost-iostreams  boost-program-options boost-regex
yum install  libpcap
yum install boost-devel
yum install  libpcap-devel
yum install boost
yum install boost-devel
#mkdir -p /opt/tools
#cd /opt/tools
#wget http://nchc.dl.sourceforge.net/project/justniffer/justniffer/justniffer%200.5.11/justniffer_0.5.11.tar.gz
#tar -xvzf justniffer_0.5.11.tar.gz
#cd /opt/tools/justniffer-0.5.11
./configure --prefix=/usr --with-boost-libdir=/usr/lib64 # No  --with-boost-system=lib anymore!