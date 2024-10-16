# HiveMQ Enterprise Security Extension (ESE) Demo

This repository contains a simple demo setup for HiveMQ with the Enterprise Security Extension (ESE) using Docker.

## Repository Structure

```
hivemq-ese-demo/
├── docker-compose.yml
├── hivemq/
│   ├── Dockerfile
│   ├── config.xml
│   └── extensions/
│       └── enterprise-security-extension-4.9.0.jar
├── postgres/
│   └── init.sql
├── mqtt-clients/
│   ├── admin_client.sh
│   ├── backend_client.sh
│   └── machine_client.sh
└── README.md
```

## Setup Instructions

1. Clone this repository
2. Navigate to the `hivemq-ese-demo` directory
3. Run `docker-compose up -d` to start HiveMQ and PostgreSQL
4. Use the provided MQTT client scripts to test the setup

## Components

- HiveMQ Broker with ESE
- PostgreSQL database for user authentication and authorization
- MQTT client scripts for testing

## Testing

Use the provided MQTT client scripts to test different roles:
- `./mqtt-clients/admin_client.sh`
- `./mqtt-clients/backend_client.sh`
- `./mqtt-clients/machine_client.sh`

These scripts use the MQTT CLI to connect with different credentials and test permissions.