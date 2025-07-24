# 🐶 Datadog DDEV Docker Environment

This repo provides a Docker environment with the [Datadog `ddev` tool](https://datadoghq.dev/integrations-core/ddev/cli) pre-installed for agent integration development and SNMP profile generation.

## 🚀 Quick Start

```bash
git clone https://github.com/prerakdali/sandbox-ddev.git
docker compose build
docker compose up -d
docker exec -it ddev-dev bash

