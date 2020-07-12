sudo docker pull gusdnd852/hyunwoong

sudo nvidia-docker run \
	-it \
	-p 8888:8888 \
	-v /home:/home \
	gusdnd852/blog:cpu \
	bin/bash