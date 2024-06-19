# SplunkDockerCompose
A simple repo for a docker-compose.yml file for deploying a splunk image to a node on my account with app.cloudlets.com.au

For details see
* https://www.virtuozzo.com/application-platform-docs/docker-engine-deployment
* https://splunk.github.io/docker-splunk/EXAMPLES.html#create-standalone-from-compose

And if the cloudlet is up and running you can access it below 
* https://vid-splunk-docker-compose.mel.cloudlets.com.au <br>
(for your own credentials contact me on [LinkedIn](https://www.linkedin.com/in/vincent-dirks))

## Instructions
1. Make sure `docker` and `docker compose` are installed
2. It is useful to configure a service to start splunk.
3. Open a terminal or SSH to the host
4. Configure the host to automatically obtain, or clone, this repo. <br>
In cloudlets use the `Compose Repo` setting <br>
At `New Environment => Custom => Docker Engine => Deploy containers from compose.yml` <br>
(The setting is only availble and shown when creating a new environment)
5. In cloudlets navigate to `Docker Engine Node => Variables` and <br>
add SPLUNK_PASSWORD and set it to the value you wish to use. 
5. Setup the `docker-compose.service` by running <br>
`/root/application/setupServiceDaemon.sh`. <br>
After this you can use `systemctl start docker-compose` etc...
7. In cloudlets navigate to `Docker Engine Node => CMD/Entry Point` and <br>
change it to `systemctl start docker-compose`
8. In cloudlets navigate to `Docker Engine Node => Config`<br>
Open `redeploy.conf`<br>
add `/etc/systemd/system/docker-compose.service` to the `Custom Files and Folders` section<br>
This should retain the service during redeploys, it should only need to be done once when creating the environment. 

## Notes
* The SPLUNK_PASSWORD is used in the first execution of the Splunk image to set the admin password, thereafter it is used as that value. 
* In cloudlets the docker-compose.yml file does not seem to be refreshed during restarts, nor redeploys. (Or at least I haven't found an action yet that does). To manually update the repo files, you can SSH to the node, and execute <br>
   ```
   cd /root/application
   git fetch
   git pull
   ```
   followed by a restart. 

   Usefully, the `docker-compose.service` includes the git commands when the service is started. 
* To give a `.sh` script file execute permissions run 
   ```
   git update-index --chmod=+x <file>
   ```
