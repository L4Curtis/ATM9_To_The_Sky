# Server minecraft ATM9 to the Sky (Updated to 1.0.7)

## Description

Simply installation for your server minecraft AT9TTS,
Server needs to be with persistant data

## Table des Matières

- [Installation](#installation)
- [Usage](#usage)

## Installation

To use the lastest version

1. Create your install directory
   ```bash
   mkdir your/path/GitRepo
   ```
   ```bash
   mkdir your/path/DirectoryServer
   ```
2. Update owner of your/path/DirectoryServer
   ```bash
   sudo chown 1234:1234 your/path/DirectoryServer
   ```
3. Clone the repository
   ```bash
   git clone https://github.com/L4Curtis/ATM9_To_The_Sky/tree/1.0.7
   ```
4. Create or pull the Docker image
   Create :
   ```bash
   docker build -t l4curtis/minecraft-atm9-server:1.0.7 .
   ```
   Pull the lastest version
   ```bash
   docker pull l4curtis/minecraft-atm9-server:1.0.7
   ```

## Usage

1. Command to use the image now
   ```bash
   docker run -d --name ATM9ToTheSky -p 25565:25565 -e JVM_XMS=8G -e JVM_XMX=16G -e MOTD="ATM9 To The Sky" 
-v /your/path/DirectoryServer:/data l4curtis/minecraft-atm9-server:1.0.7
   ```
2. For a specific version (e.g., 1.0.7)
   ```bash
   docker run -d --name ATM9ToTheSky -p 25565:25565 -e JVM_XMS=8G -e JVM_XMX=16G -e MOTD="ATM9 To The Sky" 
-v /your/path/DirectoryServer:/data l4curtis/minecraft-atm9-server:1.0.7
   ```
3. Change the port
   ```bash
   docker run -d -p 25566:25565 ...
   ```
4. Assign a specific container name using
   ```bash
   docker run -d --name minecraft-server ...
   ```
5. Manage the container easily
   ```bash
   docker logs -f <name used>
   ```
   ```bash
   docker stop <name used>
   ```
   ```bash
   docker start <name used>
   ```
6. To map a host directory
   ```bash
   docker run -d -v /your/path/DirectoryServer:/data ...
   ```
7. Adjust Java memory settings using JVM_OPTS
   ```bash
   docker run -e JVM_XMS=8G -e JVM_XMX=16G ...
   ```
