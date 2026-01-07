# n8n Self-Hosted Local Automation (On-Premise)

This project demonstrates how to run **n8n fully self-hosted on a local machine** using Docker Compose and PostgreSQL, enabling end-to-end workflow development and testing **without requiring a public domain**.

It is designed for developers, automation engineers, and consultants who want a **local-first, production-like automation environment** for building and testing workflows.

---

## Why This Project Exists

Many automation platforms assume a cloud-first setup with a registered domain. This repository shows how to:

- Run n8n on a **local machine while accessing it through a browser-based UI**
- Maintain a **production-style stack** using Docker and PostgreSQL
- Experiment with webhook-based workflows via **n8n tunneling**
- Extend n8n functionality with **custom scripting** for workflow data management

The focus of this project is **learning, experimentation, and rapid prototyping** of automation workflows in a realistic local environment.

---

## Architecture Overview

- **n8n** – Workflow automation engine
- **Docker Compose** – Local orchestration
- **PostgreSQL** – Persistent workflow and execution data
- **n8n Tunnel** – External access for lightweight webhook testing and experimentation
- **Shell Script** – Automates local storage of workflow JSON outputs

All components run locally and can be started or stopped with a single command.

---

## Prerequisites

- Docker & Docker Compose
- Node.js (optional, for local tooling)
- Bash-compatible shell

---

### To use the n8n Tunnel
go to this page ([text](https://docs.n8n.io/hosting/installation/docker/#next-steps)), scroll down to "n8n with tunnel" section. If you are:
- just using Docker you can use this command:
```
docker run -it --rm \          
--name n8n \
-p 5678:5678 \
-v n8n_data:/home/node/.n8n \
-e N8N_TUNNEL_SUBDOMAIN=example123 \
docker.n8n.io/n8nio/n8n \
start --tunnel
```
- using Docker Compose then you need to install the "tunnel service" at this page ([text](https://github.com/localtunnel/localtunnel)) and basically use these commands:
```
npm install -g localtunnel
```
to install the local tunnel.

## Quick Start

```bash
# Clone the repository
git clone https://github.com/Alessandro-DM/n8n-self-host-on-premise.git
cd n8n-self-host-on-premise

# Copy and configure environment variables
cp .env.example .env
# Edit .env with your specific configuration (change passwords, subdomain, etc.)

# Setup and run the docker compose containers
sh setup-env.sh
```
Then you use this other command to use the tunnel (in another terminal):
```
sh launch-tunnel.sh
```
Once running:
- The n8n UI will be accessible via a web browser
- Use **n8n tunnel** to test webhooks and external triggers during development

---

## Commands & Local Development

This section documents the most common commands used to run and experiment with the local n8n environment.

### Start the environment

```bash
docker compose up -d
```
Starts n8n and PostgreSQL in detached mode. This mirrors a production-style setup while running entirely on a local machine.

### Stop the environment

```bash
docker compose down
```
Stops and removes containers while preserving volumes and workflow data.

### View logs

```bash
docker compose logs -f n8n
```
Streams n8n logs for debugging workflows, executions, and connectivity issues.

### Run n8n with tunneling (for experimentation)

```bash
docker compose exec n8n n8n start --tunnel
```
Enables external access for webhook-based workflows during development and testing.

> Note: Tunneling is intended for **lightweight experimentation and simple workflows**, and is not optimized for high-throughput or latency-sensitive use cases.

### Sync workflow data

```bash
sh workflow-sync.sh
```
Runs a custom shell script that synchronizes workflow JSON data locally, supporting easier inspection, debugging, and reproducible testing during development.

---

## Workflow Output Management

This project includes a **custom shell script** that allows exporting and storing workflow JSON outputs locally.

This enables:
- Easier debugging and inspection
- Versioning of workflow results
- Reproducible testing during development

The script is intended to support **experimentation and lightweight workflows**, and can be adapted or replaced for more advanced production setups.

---

## Use Cases

- Local development of automation workflows
- Testing webhook-based integrations
- Learning self-hosted automation infrastructure
- Prototyping automation solutions for clients
- Demonstrating workflow automation skills in a portfolio

---

## Project Status

This repository is actively maintained as a **reference implementation** and learning resource.

Contributions and suggestions are welcome.

---

## Author

**Alessandro De Mitri**  
Software Engineer | Automation & AI Systems  

---

## Disclaimer

This project is intended for development, experimentation, and educational purposes. For production deployments, additional security and scaling considerations should be applied.

