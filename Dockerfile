FROM ubuntu:16.04
USER root

RUN apt-get update \
 && apt-get upgrade -y \
 && apt-get install -y  --no-install-recommends linux-libc-dev golang gcc

RUN go get https://github.com/coreos/flannel.git
ENV CGO_ENABLED=1
RUN cd $GOPATH/src/github.com/coreos/flannel && make dist/flanneld
