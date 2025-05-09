FROM ucsb/jupyter-base:latest

MAINTAINER LSIT Systems <lsitops@lsit.ucsb.edu>

USER root

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        tree zip \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/*

USER $NB_USER
