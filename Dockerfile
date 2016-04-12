FROM bbania/jdk:8
MAINTAINER "Bart Bania" <contact@bartbania.com>

ENV DISPLAY=192.168.99.1:0

WORKDIR /tmp
RUN wget -q http://download.netbeans.org/netbeans/8.1/final/bundles/netbeans-8.1-javaee-linux.sh 
RUN sh netbeans-8.1-javaee-linux.sh

