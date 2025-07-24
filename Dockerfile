# Dockerfile
FROM python:3.8-slim

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    wget \
    make \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip and install ddev
RUN pip install --upgrade pip setuptools wheel && \
    pip install ddev

# Optional: Clone the integrations-core repo for development
WORKDIR /opt
RUN git clone https://github.com/DataDog/integrations-core.git

# Add to PATH just in case
ENV PATH="/root/.local/bin:$PATH"

CMD ["bash"]
