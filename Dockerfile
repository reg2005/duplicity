#
#       .
#        ":"
#      ___:____     |"\/"|
#    ,'        `.    \  /
#    |  O        \___/  |
#  ~^~^~^~^~^~^~^~^~^~^~^~^~

# The Cuplicity image

FROM ubuntu:latest
MAINTAINER DevOps <devops@kendu.si>

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update -y

# Instaling package and clean up the mess
RUN apt-get update -y \
    && \
    apt-get -y install \
        duplicity \
        python-paramiko \
    && \
    apt-get upgrade && \
    apt-get clean
