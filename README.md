# Polarization Analyzer Agent

This repository provides a setup for deploying the Polarization Analyzer Agent using Docker.

## Prerequisites

- Docker installed on your system.
- Access to the Docker image `ghcr.io/measurement-plane/polarization-analyzer-agent:latest`.
- A running message broker (e.g., NATS) accessible at the specified `BROKER_URL`.

## Quick Start

### 1. Clone the Repository
```bash
git clone <repo-url>
cd polarization-analyzer-agent-ops
```

### 2. Configure Environment Variables
You can modify the BROKER_URL default variables directly in the `run.sh` script if needed with the address of the Broker and the name of the endpoint for the agent:

```bash
BROKER_URL="nats://172.17.0.1:4222"
ENDPOINT="polarization_analyzer"
```

### 3. Run the Application
Make the script executable and run it:

```bash
chmod +x run.sh
./run.sh
```
