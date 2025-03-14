FROM ubuntu:latest

ENV USER="tuna"
RUN useradd -m -s /bin/bash ${USER}

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential \
    cmake \
    wget \
    curl \
    git && \
    rm -rf /var/lib/apt/lists/*

USER ${USER}
WORKDIR /home/${USER}

