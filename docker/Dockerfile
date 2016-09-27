FROM jupyter/base-notebook

USER root
WORKDIR /home/jovyan

# Dalet. for further debug container
RUN apt update
RUN apt install -y nano
ENV TERM xterm
RUN echo 'export TERM=xterm'  >> /home/jovyan/.bashrc
RUN echo 'alias ll="ls -alF"'  >> /home/jovyan/.bashrc
RUN echo 'alias l="ls -lF"'  >> /home/jovyan/.bashrc
# EOF Dalet DEBUG 

# not sure why is it needed
RUN pip install --quiet jupyter

# JAVA 9 kernel
RUN wget -nc --quiet \
  'http://www.java.net/download/java/jdk9/archive/132/binaries/jdk-9-ea+132_linux-x64_bin.tar.gz' -O jdk-9.tgz && \
  tar -xf jdk-9.tgz && \
  rm -f jdk-9.tgz

COPY java9_kernel/ java9_kernel
RUN mv 'java9_kernel/kulla--20160821005845.jar' 'java9_kernel/kulla.jar'
RUN jupyter kernelspec install /home/jovyan/java9_kernel

# JSR 223 kernel binaries and jdk-8
RUN wget -nc --quiet --no-check-certificate --no-cookies --header 'Cookie: oraclelicense=accept-securebackup-cookie' \
  'http://download.oracle.com/otn-pub/java/jdk/8u101-b13/jdk-8u101-linux-x64.tar.gz' -O jdk-8.tgz && \
  tar -xf jdk-8.tgz && \
  mv jdk1.8.0_101 jdk-8 && \
  rm -f jdk-8.tgz

COPY jupyter-kernel-jsr223/ jupyter-kernel-jsr223

# Jython kernel on top of jupyter-kernel-jsr223
RUN mkdir jython && \
  wget -nc --quiet \
  'http://search.maven.org/remotecontent?filepath=org/python/jython-standalone/2.7.0/jython-standalone-2.7.0.jar' \
	-O jython/jython-standalone-2.7.0.jar

COPY jython_kernel/ jython_kernel
RUN jupyter kernelspec install /home/jovyan/jython_kernel
# EOF jython kernel

# Groovy kernel
COPY groovy_kernel/ groovy_kernel
RUN jupyter kernelspec install /home/jovyan/groovy_kernel
# EOF groovy kernel

# install samples
COPY sample-notebooks/ sample-notebooks

USER jovyan
WORKDIR /home/jovyan/work
