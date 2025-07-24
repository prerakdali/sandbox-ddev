FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    python3.8 \
    python3.8-venv \
    python3-pip \
    git \
    curl \
    wget \
    make \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

RUN update-alternatives --install /usr/bin/python python /usr/bin/python3.8 1

RUN python -m venv /opt/ddenv && \
    /opt/ddenv/bin/pip install --upgrade pip setuptools wheel && \
    /opt/ddenv/bin/pip install ddev

ENV PATH="/opt/ddenv/bin:$PATH"

WORKDIR /opt
RUN git clone https://github.com/DataDog/integrations-core.git

CMD [ "bash" ]
