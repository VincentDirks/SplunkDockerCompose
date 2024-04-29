# SplunkDockerCompose
A super simple repo to allow my account with app.cloudlets.com.au to access a docker-compose.yml file for deploying a splunk image. 
See 
*https://www.virtuozzo.com/application-platform-docs/docker-engine-deployment/
*https://splunk.github.io/docker-splunk/EXAMPLES.html#create-standalone-from-compose. 

Notes: 
The docker-compose.yml file is not refreshed during restarts, nor redeploys, or at least I haven't found an action yet that does. 
Hence, you do need to SSH to the node, and execute `git fetch` and `git pull` in the `/root/application` folder, followed by a restart (I think) 
