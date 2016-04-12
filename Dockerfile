FROM bbania/jdk:8
MAINTAINER "Bart Bania" <contact@bartbania.com>

RUN yum -q -y install libXext libXrender libXtst \
    && wget -q http://download.netbeans.org/netbeans/8.0.2/final/bundles/netbeans-8.0.2-javaee-linux.sh
RUN chmod +x netbeans-8.0.2-javaee-linux.sh \
    && ./netbeans-8.0.2-javaee-linux.sh --silent
RUN yum clean all \
    && rm -rf netbeans*
RUN useradd developer \
    && echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer \
    && chmod 0440 /etc/sudoers.d/developer

USER developer
ENV HOME /home/developer
WORKDIR /home/developer

CMD [ "/usr/local/netbeans-8.0.2/bin/netbeans", "--jdkhome", "/usr/java/jdk1.8.0_77/" ]
