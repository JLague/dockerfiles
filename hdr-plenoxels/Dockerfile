ARG CUDA_VERSION=11.2.0
ARG OS_VERSION=20.04

FROM nvcr.io/nvidia/cuda:${CUDA_VERSION}-devel-ubuntu${OS_VERSION}

# Titan RTX = 75
ARG CUDA_ARCHITECTURES=75

# Set environment variables.
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=America/Montreal
ENV CUDA_HOME="/usr/local/cuda"

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    git \
    ffmpeg \
    libsm6 \
    libxext6 \
    python3-dev \
    python3-pip

# Upgrade pip and install packages.
RUN pip3 install --upgrade pip setuptools pathtools promise pybind11

# Change shell to bash because sh points to dash on ubuntu for some reason
SHELL ["/bin/bash", "-c"]

# Install pytorch and submodules
RUN CUDA_VER=${CUDA_VERSION%.*} && CUDA_VER=${CUDA_VER//./} && CUDA_VER=113 && pip3 install \
    torch==1.12.1+cu${CUDA_VER} \
    torchvision==0.13.1+cu${CUDA_VER} \
        --extra-index-url https://download.pytorch.org/whl/cu${CUDA_VER}

# Install all other requirements for HDR-Plenoxels (without conda lol)
ADD requirements.txt requirements.txt
RUN pip3 install -r requirements.txt && \
    rm requirements.txt

WORKDIR /workspace

RUN git clone https://github.com/postech-ami/HDR-Plenoxels.git --single-branch && \
    cd HDR-Plenoxels && \
    pip3 install .

WORKDIR /workspace/HDR-Plenoxels
