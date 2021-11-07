FROM ubuntu:focal

RUN apt-get update;\
    apt-get upgrade;\
    apt-get install -y wget gnupg;
RUN wget -q http://drbl.org/GPG-KEY-DRBL -O- | apt-key add -;
RUN gpg --keyserver keyserver.ubuntu.com --recv-key 45599AFD;
RUN gpg -a --export 45599AFD | apt-key add -;
RUN cat /etc/apt/sources.list;
RUN echo deb http://free.nchc.org.tw/drbl-core drbl stable | tee -a /etc/apt/sources.list;
RUN apt-get update
RUN apt-get install -y drbl

ENTRYPOINT [ "/bin/bash", "-c", "while true; do sleep 5; done"]
