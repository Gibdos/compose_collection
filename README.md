# Docker-Compose Collection

## What is this?

A collection of Docker-Compose YAMLs for quick and easy container deployment.

## Which Services are available?

- Audiobookshelf
- Gotify
- Grafana with Prometheus + Cadvisor + Node_Exporter
- jsWiki
- Meshcentral
- Nextcloud with Collabora Code
- Portainer
- Uptime-Kuma
- Vaultwarden
- Wordpress Boilerplate

## How do I use them?

1. Make sure you have docker and docker-compose installed
   - For instructions see [Docker](https://www.docker.com/get-started/) and [Docker Compose](https://docs.docker.com/compose/install/)
2. Download the folder to wherever you want
3. Open a Terminal
4. `cd path/to/your/folder`
5. `docker-compose config` to make sure the compose.yml and your docker-compose is correct
6. `docker-compose up -d` to start the container

## Do they work?

All compose.yml have been tested with

- docker-compose version 1.29.2, build 5becea4c
- docker version 20.10.13, build a224086
- on Ubuntu Server 20.04.4 LTS with Kernel 5.13.0-35-generic
