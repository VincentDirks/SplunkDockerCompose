# This copies the 
cp /root/application/docker-compose.service /etc/systemd/system/docker-compose.service
sed -i "s/\${SPLUNK_PASSWORD}/${SPLUNK_PASSWORD}/g" /etc/systemd/system/docker-compose.service
cat /etc/systemd/system/docker-compose.service
systemctl daemon-reload
