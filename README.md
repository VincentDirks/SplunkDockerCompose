# SplunkDockerCompose
A simple repo for a docker-compose.yml file for deploying a splunk image to a node on my account with app.cloudlets.com.au

See
* https://www.virtuozzo.com/application-platform-docs/docker-engine-deployment
* https://splunk.github.io/docker-splunk/EXAMPLES.html#create-standalone-from-compose

And if the cloudlet is up and running you can access it at 
* https://vid-splunk-docker-compose.mel.cloudlets.com.au

For some new login credentials contact me at 
* https://www.linkedin.com/in/vincent-dirks

## Instructions
1. Make sure `docker` and `docker compose` are installed
2. It is useful to configure a service to start splunk.
3. Open a terminal or SSH to the host
4. Configure the host to automatically obtain, or clone, this repo. <br>
In cloudlets use the `Compose Repo` setting <br>
At `New Environment => Custom => Docker Engine => Deploy containers from compose.yml` <br>
(The setting is only availble and shown when creating a new environment)
5. Copy file `docker-compose.service` <br>
to `/etc/systemd/system/` and <br>
execute `systemctl daemon-reload`. <br>
After this you can use `systemctl docker-compose start` etc...
7. In cloudlets navigate to `Docker Engine Node => CMD/Entry Point` and <br>
change it to `systemctl start docker-compose`
8. In cloudlets navigate to `Docker Engine Node => Config`<br>
Open `redeploy.conf`<br>
add `/etc/systemd/system/docker-compose.service` to the `Custom Files and Folders` section<br>
This should retain the service during redeploys, it should only need to be done once when creating the environment. 

## Notes
In cloudlets the docker-compose.yml file does not seem to be refreshed during restarts, nor redeploys. (Or at least I haven't found an action yet that does). To manually update the repo files, you can SSH to the node, and execute 

```
cd /root/application
git fetch
git pull
```
followed by a restart. 

Usefully, the `docker-compose.service` includes the git commands when the service the started. 
