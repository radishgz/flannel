FROM ubuntu:16.04
USER root

RUN apt-get update \
 && apt-get upgrade -y \
 && apt-get install -y  --no-install-recommends linux-libc-dev golang gcc
 
RUN apt-get update \
 && apt-get upgrade -y \
 && apt-get install -y  --no-install-recommends git
#RUN make dist/flanneld-amd64
RUN mkdir -p $GOPATH/src/github.com/coreos
RUN   cd $GOPATH/src/github.com/coreos&& git clone https://github.com/coreos/flannel
ENV CGO_ENABLED=1
RUN cd $GOPATH/src/github.com/coreos/flannel && make dist/flanneld
