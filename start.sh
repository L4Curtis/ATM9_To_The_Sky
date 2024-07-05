#!/bin/bash

set -eu
FORGE_VERSION=47.2.20

forgejar="/data/forge-1.20.1-$FORGE_VERSION-installer.jar"

cd /data

if [ ! -f "$forgejar" ]; then
        cp -rf /tmp/feed-the-beast/* .
fi
cp /startserver.sh /data/startserver.sh

# Vérifier si le fichier startserver.sh existe
if [ -f "/data/startserver.sh" ]; then
    # Lancer startserver.sh en arrière-plan
    /bin/bash /data/startserver.sh

    echo "startserver.sh terminé."
else
    echo "Le fichier /data/startserver.sh n'existe pas."
fi

# Continuer avec le reste du script start.sh ici
echo "Continuer avec le reste du script start.sh..."

echo eula=true > /data/eula.txt

# Check if the environment variables are set
# echo "JVM_XMS=${JVM_XMS}"
# echo "JVM_XMX=${JVM_XMX}"

#if [[ -n "${JVM_XMS:-}" ]]; then
#    JVM_XMS="-Xms${JVM_XMS}"
#else
#    JVM_XMS=""
#fi

#if [[ -n "${JVM_XMX:-}" ]]; then
#    JVM_XMX="-Xmx${JVM_XMX}"
#else
#    JVM_XMX=""
#fi

# Debug output to ensure the variables are set correctly
# echo "Setting JVM_XMS to: ${JVM_XMS}"
# echo "Setting JVM_XMX to: ${JVM_XMX}"

# Créer le fichier user_jvm_args.txt dans /data et y insérer les options JVM
echo "-Xms${JVM_XMS}" > /data/user_jvm_args.txt
echo "-Xmx${JVM_XMX}" >> /data/user_jvm_args.txt

if [[ -n "$MOTD" ]]; then
    sed -i "/motd\s*=/ c motd=$MOTD" /data/default-server.properties
fi

if [[ -n "$LEVEL" ]]; then
    sed -i "/level-name\s*=/ c level-name=$LEVEL" /data/default-server.properties
fi

# Debug output to check the content of user_jvm_args.txt
# cat /data/user_jvm_args.txt

# Execute the Minecraft server
java @user_jvm_args.txt @libraries/net/minecraftforge/forge/1.20.1-47.2.20/unix_args.txt nogui
