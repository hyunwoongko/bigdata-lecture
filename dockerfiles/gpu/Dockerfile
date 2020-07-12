# @author hyunwoong
# @see "https://hub.docker.com/r/gusdnd852/hyunwoong"

# 1. Load cuda-ubuntu (plear set for your machine)
ARG UBUNTU_VERSION=18.04
ARG ARCH=
ARG CUDA=10.1
ARG CUDNN=7.6.4.38-1
ARG CUDNN_MAJOR_VERSION=7

FROM nvidia/cuda${ARCH:+-$ARCH}:${CUDA}-base-ubuntu${UBUNTU_VERSION} as base

# 2. Declare constants
ARG ARCH
ARG CUDA
ARG LIB_DIR_PREFIX=x86_64
ARG LIBNVINFER=6.0.1-1
ARG LIBNVINFER_MAJOR_VERSION=6

# 3. pick up some dependencies
SHELL ["/bin/bash", "-c"]
RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        cuda-command-line-tools-${CUDA/./-} \
        # There appears to be a regression in libcublas10=10.2.2.89-1 which
        # prevents cublas from initializing in TF. See
        # https://github.com/tensorflow/tensorflow/issues/9489#issuecomment-562394257
        libcublas10=10.2.1.243-1 \ 
        cuda-nvrtc-${CUDA/./-} \
        cuda-cufft-${CUDA/./-} \
        cuda-curand-${CUDA/./-} \
        cuda-cusolver-${CUDA/./-} \
        cuda-cusparse-${CUDA/./-} \
        curl \
        libcudnn7=${CUDNN}+cuda${CUDA} \
        libfreetype6-dev \
        libhdf5-serial-dev \
        libzmq3-dev \
        pkg-config \
        software-properties-common \
	unzip

# 4. Install TensorRT
RUN [[ "${ARCH}" = "ppc64le" ]] || { apt-get update && \
        apt-get install -y --no-install-recommends libnvinfer${LIBNVINFER_MAJOR_VERSION}=${LIBNVINFER}+cuda${CUDA} \
        libnvinfer-plugin${LIBNVINFER_MAJOR_VERSION}=${LIBNVINFER}+cuda${CUDA} \
        && apt-get clean \
        && rm -rf /var/lib/apt/lists/*; }

# 5. Link the libcuda stub to the location where tensorflow is searching for it and reconfigure
ENV LD_LIBRARY_PATH /usr/local/cuda/extras/CUPTI/lib64:/usr/local/cuda/lib64:$LD_LIBRARY_PATH
RUN ln -s /usr/local/cuda/lib64/stubs/libcuda.so /usr/local/cuda/lib64/stubs/libcuda.so.1 \
    && echo "/usr/local/cuda/lib64/stubs" > /etc/ld.so.conf.d/z-cuda-stubs.conf \
    && ldconfig

# 6. python set up
ENV LANG C.UTF-8
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip
RUN python3 -m pip --no-cache-dir install --upgrade \
    pip \
    setuptools
RUN ln -s $(which python3) /usr/local/bin/python

# 9. java set up
RUN apt install openjdk-11-jdk -y

# 10. install jupyterlab and C / Java kernels 
RUN python3 -m pip install --no-cache-dir \
	jupyterlab \
	jupyter-c-kernel \
	&& install_c_kernel \
	&& apt install wget -y \
	&& mkdir ijava \
	&& cd ijava \
	&& wget https://github.com/SpencerPark/IJava/releases/download/v1.3.0/ijava-1.3.0.zip \
	&& unzip ijava-1.3.0.zip \
	&& rm ijava-1.3.0.zip \
	&& python3 install.py \
	&& cd .. \
	&& rm -rf ijava

# 7. set up python packages
COPY requirements.txt /
RUN pip3 install -r requirements.txt