FROM debian:bookworm-slim

# Set noninteractive frontend
ENV DEBIAN_FRONTEND=noninteractive

# Install required system packages
RUN apt-get update && \
    apt-get install -y \
    git \
    curl \
    wget \
    python3.11 \
    python3.11-venv \
    python3-pip \
    bash \
    ca-certificates \
    gnupg \
    lsb-release \
    sudo \
    docker.io \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Set python3.11 as default python
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.11 1

# Install pipx with break-system-packages
RUN python3 -m pip install --no-cache-dir pipx --break-system-packages && \
    python3 -m pipx ensurepath


# Set environment variables
ENV PATH="/root/.local/bin:${PATH}"

# Clone required repositories
RUN mkdir -p /opt && cd /opt && \
    git clone https://github.com/DataDog/integrations-core.git && \
    git clone https://github.com/DataDog/integrations-extras.git

# Install ddev using pipx and upgrade to latest
RUN pipx install ddev && \
    pipx upgrade ddev

# Configure ddev with the cloned repos
RUN ddev config set core /opt/integrations-core && \
    ddev config set extras /opt/integrations-extras

# Reload bashrc (if needed for future login shells)
RUN echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
