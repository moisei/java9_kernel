FROM jupyter/base-notebook

RUN wget -nc --quiet \
  'http://www.java.net/download/java/jdk9/archive/132/binaries/jdk-9-ea+132_linux-x64_bin.tar.gz' -O jdk-9.tgz && \
  tar -xf jdk-9.tgz && \
  rm -f jdk-9.tgz

COPY 'docker/kulla--20160821005845.jar'  /home/jovyan/work/kulla.jar
RUN pip install --quiet jupyter

RUN mkdir /home/jovyan/work/javakernel
COPY javakernel/ /home/jovyan/work/javakernel

RUN mkdir -p /home/jovyan/.ipython/kernels/java
COPY docker/kernel.json /home/jovyan/.ipython/kernels/java/kernel.json

USER root
RUN apt update
RUN apt install -y nano
ENV TERM xterm
RUN echo 'export TERM=xterm'  >> /home/jovyan/.bashrc
RUN echo 'alias ll="ls -alF"'  >> /home/jovyan/.bashrc
RUN echo 'alias l="ls -lF"'  >> /home/jovyan/.bashrc
USER jovyan

