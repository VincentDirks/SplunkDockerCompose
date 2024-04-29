# SplunkDockerCompose
A super simple repo for a docker-compose.yml file for deploying a splunk image to a node on my account with app.cloudlets.com.au

See
* https://www.virtuozzo.com/application-platform-docs/docker-engine-deployment
* https://splunk.github.io/docker-splunk/EXAMPLES.html#create-standalone-from-compose

And if the cloudlet is up and running you can access it at 
* https://vid-splunk-docker-compose.mel.cloudlets.com.au

For some new login credentials contact me at 
* https://www.linkedin.com/in/vincent-dirks

Note: <br> In cloudlets the docker-compose.yml file does not seem to be refreshed during restarts, nor redeploys. (Or at least I haven't found an action yet that does). Hence, you do need to SSH to the node, and execute `git fetch` and `git pull` in the `/root/application` folder, followed by a restart (I think) 
