# .devcontainer/Dockerfile  (GPU build)
FROM nvidia/cuda:12.5.1-cudnn-devel-ubuntu22.04

# ---- System deps ----
RUN apt-get update && \
        apt-get install -y --no-install-recommends \
        build-essential git curl ca-certificates \
        python3 python3-pip && \
    rm -rf /var/lib/apt/lists/*

# ---- Non-root vscode user (matches devcontainer.json "remoteUser") ----
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID
RUN groupadd --gid $USER_GID $USERNAME && \
    useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME

# ---- Docker CLI inside container (works with docker-outside-of-docker feature) ----
RUN apt-get update && \
    apt-get install -y --no-install-recommends docker-cli && \
    rm -rf /var/lib/apt/lists/*

# ---- Poetry + tooling ----
# use python3 -m pip so it works even if /usr/local/bin isn't linked yet
RUN python3 -m pip install --no-cache-dir pipx && \
    pipx install poetry && \
    pipx ensurepath

# ---- GPU-enabled Python libs ----
RUN pip install --no-cache-dir \
        black nbqa pytest mlflow[extras] \
        torch torchvision torchaudio \
        --extra-index-url https://download.pytorch.org/whl/cu125

WORKDIR /workspace
USER $USERNAME
