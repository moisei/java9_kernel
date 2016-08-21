FROM jupyter/base-notebook

RUN wget -nc --quiet \
  "http://www.java.net/download/java/jdk9/archive/132/binaries/jdk-9-ea+132_linux-x64_bin.tar.gz" -O jdk-9.tgz && \
  tar -xvf jdk-9.tgz

RUN wget -nc --quiet \
  "https://adopt-openjdk.ci.cloudbees.com/view/OpenJDK/job/langtools-1.9-linux-x86_64-kulla-dev/lastSuccessfulBuild/artifact/kulla--20160821005845.jar" \
     -O kulla.jar

ENV KULLA_HOME $PWD/kulla.jar
ENV JAVA_HOME $PWD/jdk-9
ENV PATH $PATH:$JAVA_HOME/bin

RUN pip install jupyter

RUN mkdir /home/jovyan/work/javakernel
COPY javakernel/ /home/jovyan/work/javakernel

RUN mkdir -p /home/jovyan/.ipython/kernels/java
COPY java9-kernel.json /home/jovyan/.ipython/kernels/java/kernel.json
