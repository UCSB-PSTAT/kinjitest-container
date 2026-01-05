FROM ubuntu

MAINTAINER Kinji Leslie <kinji@ucsb.edu>

USER root

RUN apt-get update -qq && \
    DEBIAN_FRONTEND=noninteractive TZ=America/Los_Angeles \
    apt-get -y install --no-install-recommends \
        tzdata \
        software-properties-common \
        tree \
        wget \
        zip \
    && apt-get clean

RUN cd /tmp && \
    wget https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh && \
    chmod 755 Miniforge3-Linux-x86_64.sh && \
    ./Miniforge3-Linux-x86_64.sh -b -u -p /opt/miniforge && \
    rm -rf Miniforge3-Linux-x86_64.sh

ENV PATH="/opt/miniforge/bin:/opt/miniforge/sbin:$PATH"
    
# if using jupyter notebook, e.g., ucsb/jupyter-base
#USER $NB_USER
