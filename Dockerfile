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
    
RUN apt-get install --yes build-essential autoconf \
        libtool pkg-config python-opengl python-imaging python-pyrex \
        python-pyside.qtopengl idle-python2.7 qt4-dev-tools qt4-designer \
        libqtgui4 libqtcore4 libqt4-xml libqt4-test libqt4-script libqt4-network \
        libqt4-dbus python-qt4 python-qt4-gl libgle3 python-dev
        
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
