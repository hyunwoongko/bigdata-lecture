---
layout: page
title: Environments
permalink: /environments
---

이 페이지는 블로그의 소스코드 구동 환경에 대해 소개합니다. 
소스코드를 로컬머신에서 실행하시고 싶은 분들은 Docker 이미지를 이용해 쉽게 환경을 구성할 수 있습니다.
추가로, 이 블로그는 포스트의 기본단위가 노트북 파일이기 때문에 별도의 환경 구성 없이 
Binder와 Google Colab을 이용하여 웹상에서 소스코드를 구동할 수 있습니다.
<br><br>

[cpu]:https://github.com/gusdnd852/blog/tree/master/dockerfiles/cpu
[gpu]:https://github.com/gusdnd852/blog/tree/master/dockerfiles/gpu
[binder]:https://hub.gke.mybinder.org/user/gusdnd852-blog-1761gk1c/tree/_notebooks?token=5WdHr9fgRRq8FS0Ymudk_g
[colab]:https://colab.research.google.com/github/gusdnd852/blog

### Code Execution Environments
현재 Google Colab을 제외한 모든 환경에서 C, Python3.6, Openjdk11 등 다양한 언어를 구동할 수 있습니다.
추후에 게시글이 추가됨에 따라서 구동 가능 언어를 점차 확장할 계획입니다.
만약 GPU 도커 이미지를 사용하실 경우에 Dockerfile의 **CUDA와 CUDNN버전 변수를
본인 머신에 맞게 수정해주시길 바랍니다.** (CPU 구동시 신경쓰지 않으셔도 됩니다.)
<br>

#### 1) CPU 환경
- Web : [Binder에서 실행하기][binder] 
- Dockerfile : [CPU Dockerfile][cpu]
- Dockerhub : `docker pull gusdnd852/blog:cpu`
<br>

#### 2) GPU 환경
- Web : [Google Colab에서 실행하기][colab]
- Dockerfile : [GPU Dockerfile][gpu]
- Dockerhub : `docker pull gusdnd852/blog:latest`
<br><br>

### Jupyter Kernel Specs
- C언어 커널 : [jupyter-c-kernel](https://github.com/brendan-rius/jupyter-c-kernel)
- Python 커널 : 초기 설정과 동일
- Java 커널 : [IJava](https://github.com/SpencerPark/IJava)
<br><br>

### Owner's Local Machine
- OS : Ubuntu 18.04.4 LTS Desktop
- CPU : Intel Core(TM) i7-9700KF CPU @ 3.60GHz
- GPU : Nvidia RTX 2070 8GB
- RAM : Samsung 16GB (8GB x 2)