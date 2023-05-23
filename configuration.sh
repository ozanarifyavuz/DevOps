# THE REQUIRED CONFIGURATIONS ON THE VM1

# Installing a NATS Server on the vm1

# Updating package list:
sudo apt update

# Installing dependencies:
sudo apt install -y curl

# Downloading the NATS server binary:
curl -L https://github.com/nats-io/nats-server/releases/download/v2.2.2/nats-server-v2.2.2-linux-amd64.zip -o nats-server.zip

# Extracting the ZIP file:
unzip nats-server.zip

# Installing the NATS server binary:
sudo install nats-server-v2.2.2-linux-amd64/nats-server /usr/local/bin/nats-server

# Cleaning up downloaded files:
rm -rf nats-server.zip nats-server-v2.2.2-linux-amd64



# THE REQUIRED CONFIGURATIONS ON THE VM2

# Installing pip3 to be able to execute publisher.py script

# Updating package list:
sudo apt update

# Installing pip3:
sudo apt install -y python3-pip

# Installing the asyncio-nats-client: 
pip3 install asyncio-nats-client



# THE REQUIRED CONFIGURATIONS ON THE VM3

# Firstly, Installing pip3 to be able to execute publisher.py script

# Updating package list:
sudo apt update

# Installing pip3:
sudo apt install -y python3-pip

# Installing the asyncio-nats-client: 
pip3 install asyncio-nats-client

# Secondly, installing the Docker:

# Updating package list:
sudo apt update

# Installing the required packages to allow apt to use a repository over HTTPS:
sudo apt install apt-transport-https ca-certificates curl software-properties-common

# Adding the Docker GPG key:
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Adding the Docker repository:
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Updating the package manager again:
sudo apt update

# Installing Docker:
sudo apt install docker-ce docker-ce-cli containerd.io

# Adding my user to the docker group to allow running Docker commands without sudo:
sudo usermod -aG docker $USER

# Build the Docker image for my subscriber:
docker build -t nats-subscriber .

# Run the produced Docker container:
docker run -d nats-subscriber

# In order to see the logs executing subscriber.py in a container, use the following commnad:
docker logs <container_id>