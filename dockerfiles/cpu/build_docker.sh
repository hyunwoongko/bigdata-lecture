# apt update & install downloaders
sudo apt update
sudo apt install curl wget git socat -y
sudo ufw enable 22  # ssh
sudo ufw enable 2375  # tcp

# install docker & nvidia docker
sudo wget -qO- http://get.docker.com/ | sh
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | \
	sudo apt-key add -

distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | \
	sudo tee /etc/apt/sources.list.d/nvidia-docker.list

sudo apt-get update
sudo systemctl enable docker
