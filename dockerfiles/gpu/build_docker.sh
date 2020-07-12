# apt update & install downloaders
sudo apt update
sudo apt install git git-lfs make fail2ban curl wget git socat -y
sudo ufw allow 22  # ssh
sudo ufw allow 2375  # tcp

# install docker & nvidia docker
sudo wget -qO- http://get.docker.com/ | sh
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | \
	sudo apt-key add -

distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | \
	sudo tee /etc/apt/sources.list.d/nvidia-docker.list

sudo apt-get update
sudo apt-get install -y nvidia-docker2
sudo systemctl enable docker
