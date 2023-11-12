ARG CUDA_VERSION=11.2.0
ARG OS_VERSION=20.04

FROM nvcr.io/nvidia/cuda:${CUDA_VERSION}-devel-ubuntu${OS_VERSION}

# Titan RTX = 75
ARG CUDA_ARCHITECTURES=75

# Set environment variables.
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=America/Montreal
ENV CUDA_HOME="/usr/local/cuda"

# Install dependencies and clear cache
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    git \
    unzip \
    sudo \
    vim-tiny \
    curl \
    wget \
    ffmpeg \
    libsm6 \
    libxext6 \
    imagemagick \
    python3-dev \
    python3-pip && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /workspace

# Setup HDR-NeRF
RUN git clone https://github.com/xhuangcv/hdr-nerf.git --single-branch && \
    cd hdr-nerf && \
    pip3 install -r requirements.txt && \
    pip3 install lpips

WORKDIR /workspace/hdr-nerf

# Download demo dataset
RUN pip3 install gdown && \
    mkdir demo && \
    cd demo && \
    gdown 1-WdnwxKlj2IcjfFSKcgJ1kMQIX_WGig3 && \
    unzip demo.zip && \
    rm demo.zip
