# HiveMQ Enterprise Security Extension (ESE) Demo

## Executive Summary

This document outlines a demonstration of HiveMQ's Enterprise Security Extension (ESE) for a customer in the Smart Manufacturing space. The customer has deployed their IoT solution without proper security measures and now needs to implement robust authentication and authorization for their MQTT clients. This demo showcases how HiveMQ's ESE can address these security concerns efficiently and effectively on a Windows environment.

## Goals

1. Demonstrate the ease of setting up HiveMQ with ESE on Windows
2. Showcase the flexibility of role-based access control
3. Prove the effectiveness of ESE in securing MQTT communications

## Tenets

- Simplicity: The demo setup should be straightforward and easily reproducible on Windows
- Security: Demonstrate strong authentication and fine-grained authorization
- Scalability: Show how the solution can grow with the customer's needs

## Customer Benefits

1. Rapid implementation of security measures without disrupting existing operations
2. Granular control over client permissions, reducing potential security risks
3. Seamless integration with existing database systems for user management

## Approach

We will create a Docker-based demo environment on Windows that includes:

1. HiveMQ broker with ESE installed
2. PostgreSQL database for user authentication and authorization
3. Pre-configured roles and permissions
4. PowerShell scripts to demonstrate different access levels

### Step 1: Environment Setup

1. Install Docker Desktop for Windows
2. Install Git for Windows
3. Clone the repository:
   ```powershell
   git clone https://github.com/your-username/hivemq-ese-demo.git
   cd hivemq-ese-demo
   ```
4. Start the Docker containers:
   ```powershell
   docker-compose up -d
   ```

### Step 2: Role and Permission Configuration

We'll set up three roles with specific permissions:

1. Machine: Publish to `{clientID}/telemetry/data` (QoS 1)
2. Backend: Subscribe to `+/+/data` (all QoS levels)
3. Admin: Publish and Subscribe to all topics

These roles will be automatically configured in the PostgreSQL database when the container starts.

### Step 3: Demonstration

We'll use PowerShell scripts with MQTT CLI to show the effectiveness of our security setup:

1. Machine client publishing data:
   ```powershell
   .\mqtt-clients\machine_client.ps1
   ```

2. Backend client subscribing to data:
   ```powershell
   .\mqtt-clients\backend_client.ps1
   ```

3. Admin client with full access:
   ```powershell
   .\mqtt-clients\admin_client.ps1
   ```

## Success Criteria

1. All MQTT clients can connect with their respective credentials
2. Clients can only perform actions allowed by their roles
3. Unauthorized actions are prevented by the ESE

## Conclusion

This demo illustrates how HiveMQ's Enterprise Security Extension can quickly and effectively secure an existing IoT infrastructure on a Windows environment. By implementing role-based access control, we can ensure that each client has the appropriate level of access, significantly reducing security risks without disrupting ongoing operations.

The solution is scalable and can be easily integrated into the customer's existing Windows-based systems, providing a solid foundation for secure IoT communications in their Smart Manufacturing environment.

## Setup Instructions

1. Ensure you have Docker Desktop for Windows and Git for Windows installed.
2. Open PowerShell as Administrator.
3. Clone the repository:
   ```powershell
   git clone https://github.com/your-username/hivemq-ese-demo.git
   cd hivemq-ese-demo
   ```
4. Start the Docker containers:
   ```powershell
   docker-compose up -d
   ```
5. Wait for the services to start up (you can check the logs with `docker-compose logs -f`).
6. Run the MQTT client scripts to test the setup (in separate PowerShell windows):
   ```powershell
   .\mqtt-clients\admin_client.ps1
   .\mqtt-clients\backend_client.ps1
   .\mqtt-clients\machine_client.ps1
   ```

Note: If you encounter issues running the PowerShell scripts, you may need to adjust the execution policy:
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```