# This copies the service file to the correct location, sets the splunk password, and reloads the services. 
cp /root/application/docker-compose.service /etc/systemd/system/docker-compose.service
sed -i "s/\${SPLUNK_PASSWORD}/${SPLUNK_PASSWORD}/g" /etc/systemd/system/docker-compose.service
cat /etc/systemd/system/docker-compose.service
systemctl daemon-reload
