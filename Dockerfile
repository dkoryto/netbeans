FROM bbania/jdk:8-alpine
MAINTAINER "Bart Bania" <contact@bartbania.com>

ARG DISPLAY=local
ENV DISPLAY ${DISPLAY}
ENV HOME /home/developer

RUN apk update && \
    apk add libxext libxtst libxrender && \
    rm -rf /tmp/* && \
    rm -rf /var/cache/apk/*

RUN adduser -D developer && \
    mkdir -m 700 /data && \
    mkdir -m 700 $HOME/.netbeans && \
    mkdir -m 700 $HOME/NetBeansProjects && \
    chown -R netbeans:netbeans /data $HOME/.netbeans $HOME/NetBeansProjects

RUN yum -q -y install libXext libXrender libXtst \
    && wget -q http://download.netbeans.org/netbeans/8.0.2/final/bundles/netbeans-8.0.2-javaee-linux.sh
RUN chmod +x netbeans-8.0.2-javaee-linux.sh \
    && ./netbeans-8.0.2-javaee-linux.sh --silent
RUN yum clean all \
    && rm -rf netbeans*
RUN useradd developer \
    && mkdir -p /etc/sudoers.d/ \
    && echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer \
    && chmod 0440 /etc/sudoers.d/developer

USER developer

RUN wget -q http://download.netbeans.org/netbeans/8.1/final/zip/netbeans-8.1-201510222201-javaee.zip -O ~/netbeans.zip && \
    unzip ~/netbeans.zip -q -d ~ && \
    rm ~/netbeans.zip

WORKDIR /data
CMD ~/netbeans/bin/netbeans

