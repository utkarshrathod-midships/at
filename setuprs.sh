
echo "Downloading RS"
echo "Getting RS"
curl -u midships:Midships202! "ftp://ruhle.drayddns.com/forgerock/directory-services/DS-7.1.2.zip" -o /tmp/DS-7.1.2.zip -k
touch /tmp/$(date +"%Y-%m-%d-%H-%M-%S").log
#echo "Setting up pre-requsite(s)"
unzip /tmp/DS-7.1.2.zip -d /opt/ds


#Setting up User of the Server
echo "-> Creating User and Group";
groupadd -g 10002 ds;
useradd -m -s /bin/nologin -m -d /home/ds -u 10002 -g 10002 ds
echo "-- Done";
echo "";
