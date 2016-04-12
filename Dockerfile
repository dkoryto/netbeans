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
    chown -R developer:developer /data $HOME/.netbeans $HOME/NetBeansProjects

USER developer

RUN wget -q http://download.netbeans.org/netbeans/8.1/final/zip/netbeans-8.1-201510222201-javaee.zip -O ~/netbeans.zip && \
    unzip ~/netbeans.zip -q -d ~ && \
    rm ~/netbeans.zip

CMD [ "/home/developer/netbeans/bin/netbeans", "--jdkhome", "/opt/jdk" ]

