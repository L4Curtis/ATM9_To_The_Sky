FROM openjdk:17-jdk-slim

MAINTAINER Curtis LEMIEUX

# Installer les outils nécessaires et ajouter l'utilisateur minecraft
RUN apt-get update && \
    apt-get install -y wget unzip && \
    addgroup --gid 1234 minecraft && \
    adduser --disabled-password --home=/data --uid 1234 --gid 1234 --gecos "minecraft user" minecraft

RUN mkdir -p /tmp/feed-the-beast && \
    cd /tmp/feed-the-beast && \
    wget -c https://www.curseforge.com/api/v1/mods/967745/files/5527366/download -O ATM9_To_The_Sky.zip && \
    unzip ATM9_To_The_Sky.zip -d /tmp/feed-the-beast && \
    chmod -R 777 /tmp/feed-the-beast && \
    chown -R minecraft /tmp/feed-the-beast

# Copier le script de démarrage et le rendre exécutable
COPY start.sh /start.sh
RUN chmod +x /start.sh
COPY startserver.sh /startserver.sh
COPY default-server.properties /default-server.properties

# Utiliser l'utilisateur minecraft
USER minecraft

# Définir le volume et le répertoire de travail
VOLUME /data
WORKDIR /data

# Exposer le port Minecraft
EXPOSE 25565

# Définir les variables d'environnement et le point d'entrée
ENV MOTD "A Minecraft (ATM9 To The Sky 1.0.6) Server Powered by Docker"
ENV LEVEL skyblockbuilder\:skyblock
ENV JVM_XMS="8096m"
ENV JVM_XMX="8096m"


CMD ["/start.sh"]

