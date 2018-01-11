FROM ubuntu:latest

RUN apt-get -qq update && apt-get -qq install -y \
    unzip \
    xorg \
    wget \
    tree \
    curl && \
    mkdir /mcr-install && \
    mkdir /opt/mcr && \
    cd /mcr-install && \
    wget -nc --quiet http://ssd.mathworks.com/supportfiles/downloads/R2016b/deployment_files/R2016b/installers/glnxa64/MCR_R2016b_glnxa64_installer.zip && \
    cd /mcr-install && \
    unzip -q MCR_R2016b_glnxa64_installer.zip && \
    ./install -destinationFolder /opt/mcr -agreeToLicense yes -mode silent && \
    cd / && \
    rm -rf mcr-install
RUN tree /opt/mcr

# Configure environment variables for MCR
ENV LD_LIBRARY_PATH /opt/mcr/v91/runtime/glnxa64:/opt/mcr/v91/bin/glnxa64:/opt/mcr/v91/sys/os/glnxa64
ENV XAPPLRESDIR /opt/mcr/v91/X11/app-defaults