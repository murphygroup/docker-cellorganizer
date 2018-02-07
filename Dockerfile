FROM quay.io/bgruening/galaxy-base:latest

MAINTAINER Ivan E. Cao-Berg <icaoberg@andrew.cmu.edu>
LABEL Description="CellOrganizer."
LABEL Vendor="Murphy Lab in the Computational Biology Department at Carnegie Mellon University"
LABEL Web="http://murphylab.cbd.cmu.edu"
LABEL Version="2.7.0"

USER root
RUN echo "Installing Matlab MCR 2017a"
RUN apt-get -qq update && apt-get -qq install -y \
    unzip \
    xorg \
    wget \
    tree \
    curl && \
    mkdir /mcr-install && \
    mkdir /opt/mcr && \
    cd /mcr-install && \
    echo "Downloading Matlab MCR 2017" && \
    wget -nc --quiet http://ssd.mathworks.com/supportfiles/downloads/R2017a/deployment_files/R2017a/installers/glnxa64/MCR_R2017a_glnxa64_installer.zip && \
    cd /mcr-install && \
    echo "Unzipping container" && \
    unzip -q MCR_R2017a_glnxa64_installer.zip && \
    ./install -destinationFolder /opt/mcr -agreeToLicense yes -mode silent && \
    cd / && \
    echo "Removing temporary files" && \
    rm -rvf mcr-install
    
# Configure environment variables for MCR
ENV LD_LIBRARY_PATH /opt/mcr/v92/runtime/glnxa64:/opt/mcr/v92/bin/glnxa64:/opt/mcr/v92/sys/os/glnxa64
ENV XAPPLRESDIR /opt/mcr/v92/X11/app-defaults

# Configure environment
ENV DEBIAN_FRONTEND noninteractive
ENV SHELL /bin/bash
ENV USERNAME galaxy
ENV HOME /home/$USERNAME/
RUN if [ ! -d /home/$USERNAME/ ]; then mkdir /home/$USERNAME/; fi
WORKDIR /home/$USERNAME/
USER $USERNAME

RUN echo "Downloading CellOrganizer v2.6.0" && \
    cd ~/ && wget -nc --quiet http://www.cellorganizer.org/Downloads/v2.7/docker/cellorganizer-v2.7.0-binaries.tgz && \
    tar -xvf cellorganizer-v2.7.0-binaries.tgz && \
    if [ ! -d /opt ]; then mkdir /opt; fi && \
    mv -v cellorganizer-binaries /opt && \
    ln -s /opt/cellorganizer-binaries/train /usr/local/bin/train && \
    ln -s /opt/cellorganizer-binaries/synthesize /usr/local/bin/synthesize

