sudo docker pull gusdnd852/blog:cpu

sudo nvidia-docker run \
	-it \
	-p 8888:8888 \
	-v /home:/home \
	gusdnd852/blog:cpu \
	jupyter lab \
	--ip=0.0.0.0 \
	--allow-root