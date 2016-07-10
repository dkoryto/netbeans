FROM bbania/jdk:8
MAINTAINER "Bart Bania" <contact@bartbania.com>

ARG DISPLAY=local
ENV DISPLAY ${DISPLAY}

RUN yum -q -y install libXext libXrender libXtst \
    && wget http://download.netbeans.org/netbeans/8.1/final/bundles/netbeans-8.1-linux.sh \
    && chmod +x netbeans-8.1-linux.sh \
    && ./netbeans-8.1-linux.sh
RUN useradd developer \
    && mkdir -p /etc/sudoers.d/ \
    && echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer \
    && chmod 0440 /etc/sudoers.d/developer
RUN yum clean all \
    && rm -rf netbeans*

USER developer
ENV HOME /home/developer
WORKDIR /home/developer

CMD [ "/usr/local/netbeans-8.1/bin/netbeans" ]

