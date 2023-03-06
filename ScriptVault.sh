apt update
apt -y install sudo
sudo apt -y update
sudo apt -y install ca-certificates
sudo apt -y install curl 
sudo apt -y install gnupg
sudo apt -y install lsb-release


sudo mkdir -m 0755 -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null


sudo apt -y update


sudo apt -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

docker run -d \
--restart unless-stopped \
--name vaultwarden \
-v /path/to/data:/data/ \
-p 80:80 \
vaultwarden/server:latest