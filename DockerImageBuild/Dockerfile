FROM ubuntu:18.04

RUN apt-get update \
&& apt-get install vim curl wget curl git -y

WORKDIR /home
RUN mkdir goInstall goWork goLib
WORKDIR /home/goInstall
RUN wget -O go.tar.gz https://dl.google.com/go/go1.13.1.linux-amd64.tar.gz
RUN tar -xf go.tar.gz -C /usr/local/
RUN rm go.tar.gz

RUN echo 'export GOROOT=/usr/local/go' >> ~/.bashrc
RUN echo 'export GOPATH=/home/goLib' >> ~/.bashrc
RUN echo 'export PATH=$PATH:$GOROOT/bin:$GOPATH/bin' >> ~/.bashrc
RUN echo 'export GOPATH=$GOPATH:/home/goWork' >> ~/.bashrc
#RUN /bin/bash -c "source /root/.bashrc"


WORKDIR /home/goWork
COPY ./app/ /home/goWork/

RUN /usr/local/go/bin/go get -d -v ./
RUN /usr/local/go/bin/go build -o hello ./

EXPOSE 80

ENTRYPOINT /home/goWork/hello

