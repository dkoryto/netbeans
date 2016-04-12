FROM bbania/jdk:8
MAINTAINER "Bart Bania" <contact@bartbania.com>

WORKDIR /opt

RUN yum -q -y install unzip libXext \
    && wget -q http://download.netbeans.org/netbeans/8.1/final/zip/netbeans-8.1-201510222201-javaee.zip \
    && unzip -q netbeans-8.1-201510222201-javaee.zip -d /opt \
    && yum clean all \
    && rm -rf netbeans-8.1-201510222201-javaee.zip

ENV PATH /opt/netbeans/bin:$PATH

