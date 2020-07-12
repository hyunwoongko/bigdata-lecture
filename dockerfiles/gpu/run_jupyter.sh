sudo docker pull gusdnd852/blog:latest

sudo nvidia-docker run \
	-it \
	-p 8888:8888 \
	-v /home:/home \
	gusdnd852/blog:latest \
	jupyter lab \
	--ip=0.0.0.0 \
	--allow-root