# !/bin/sh
# Environment variable
# export DS_HOME="/opt/ds"
# export DS_APP="${DS_HOME}/app" 
# export DS_INSTANCE="${DS_HOME}/app/instance"
# export DS_SCRIPTS="${DS_HOME}/scripts"
# export JAVA_CACERTS="/etc/ssl/certs/java/cacerts"
# export JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64/"
# export OPENDJ_JAVA_HOME="${JAVA_HOME}"

# echo "----------------------------------------------------"
# echo "****************************************************"
# echo "[[ forgerock Directory Server (DS) - Replication Server ]]"
# echo "->               Server Name: ${HOSTNAME}"
# echo "->                   DS_HOME: ${DS_HOME}"
# echo "->                    DS_APP: ${DS_APP}"
# echo "->               DS_INSTANCE: ${DS_INSTANCE}"
# echo "->                DS_SCRIPTS: ${DS_SCRIPTS}"
# echo "->                 JAVA_HOME: ${JAVA_HOME}"
# echo "->              JAVA_CACERTS: ${JAVA_CACERTS}"
# echo "----------------------------------------------------"
# echo ""

echo "Downloading RS"
echo "Getting RS"
curl -u midships:Midships202! "ftp://ruhle.drayddns.com/forgerock/directory-services/DS-7.1.2.zip" -o DS.zip
touch /tmp/$(date +"%Y-%m-%d-%H-%M-%S").log
echo "Setting up pre-requsite(s)"
sudo unzip DS.zip -d /opt/ds

#Setting up User of the Server
echo "-> Creating User and Group";
groupadd -g 10002 ds;
useradd -m -s /bin/nologin -m -d /home/ds -u 10002 -g 10002 ds
echo "-- Done";
echo "";


