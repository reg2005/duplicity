################################################################################
#                                                                              #
#                                 {o,o}                                        #
#                                 |)__)                                        #
#                                 -"-"-                                        #
#                                                                              #
################################################################################
#
# The Duplicity image
#
#################################---INFO---#####################################

FROM debian:latest
MAINTAINER DevOps <devops@kendu.si>

################################################################################

#################################---ENV---######################################

ENV DEBIAN_FRONTEND noninteractive

################################################################################

################################---BUILD---#####################################

RUN apt-get update && \
    apt-get upgrade --yes --force-yes
RUN apt-get install --yes --force-yes \
        gpg \
        python-paramiko \
        python-swiftclient \
        librsync-dev \
        bzr \
        duplicity \
        openssl \
        python \
    && \
    apt-get clean
RUN bzr branch lp:~mhu-s/duplicity/swiftbackend
RUN cd swiftbackend && python dist/setup.py install

################################################################################
