# syntax=docker/dockerfile:1
#
# .devcontainer/Dockerfile  – GPU build (CUDA 12 + Python 3.12)

FROM nvidia/cuda:12.5.1-cudnn-devel-ubuntu22.04

# --------------------------------------------------------------------
# Base system packages + Python toolchain
# --------------------------------------------------------------------
ENV DEBIAN_FRONTEND=noninteractive
ENV PIPX_HOME=/usr/local/pipx
ENV PIPX_BIN_DIR=${PIPX_HOME}/bin
ENV PATH=${PIPX_BIN_DIR}:${PATH}

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        build-essential git curl ca-certificates \
        python3 python3-pip python3-venv docker-cli && \
    rm -rf /var/lib/apt/lists/* && \
    python3 -m pip install --no-cache-dir --upgrade pip pipx && \
    pipx install poetry && \
    pipx ensurepath

# --------------------------------------------------------------------
# Create non-root “vscode” user (matches devcontainer.json)
# --------------------------------------------------------------------
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=${USER_UID}

RUN groupadd --gid ${USER_GID} ${USERNAME} && \
    useradd --uid ${USER_UID} --gid ${USER_GID} -m -s /bin/bash ${USERNAME}

# --------------------------------------------------------------------
# GPU-enabled Python libraries & common dev tools
# --------------------------------------------------------------------
RUN pip install --no-cache-dir \
        black nbqa pytest mlflow[extras] \
        torch torchvision torchaudio \
        --extra-index-url https://download.pytorch.org/whl/cu125

# --------------------------------------------------------------------
# Final setup
# --------------------------------------------------------------------
WORKDIR /workspace
USER ${USERNAME}
