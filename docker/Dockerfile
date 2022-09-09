FROM nvidia/cuda:11.1.1-cudnn8-devel-ubuntu20.04

#install required libs and packages
RUN apt-get update -y && \
    apt-get autoremove -y && \ 
    apt-get install -y --no-install-recommends \
    wget curl python3 python3-pip \
    ca-certificates libjpeg-dev libpng-dev lsb-release ninja-build build-essential git && \
    rm -rf /var/lib/apt/lists/*

ENV FORCE_CUDA="1"


# Update pip & install pytorch
RUN python3 -m pip install pip --upgrade
RUN python3 -m pip install wheel pyyaml numpy ipython

# RUN pip install torch==1.7.0+cu110 torchvision==0.8.1+cu110 -f https://download.pytorch.org/whl/torch_stable.html
RUN pip3 install \
	torch==1.10.1+cu111 torchvision==0.11.2+cu111 \
	-f https://download.pytorch.org/whl/cu111/torch_stable.html

RUN pip install \
    torch-scatter -f https://data.pyg.org/whl/torch-1.10.1+cu111.html 
ARG DEBIAN_FRONTEND=noninteractive

RUN pip install  scikit-image albumentations timm  test-tube

RUN pip install  wandb matplotlib tensorboard open3d scipy tqdm  setuptools==59.5.0
RUN pip install suitesparse-graphblas lietorch opencv-python-headless

RUN pip install opencv-contrib-python==4.1.2.30
RUN apt-get update
RUN apt-get install ffmpeg libsm6 libxext6  -y 
RUN apt-get install python3-dev -y
RUN pip3 install git+https://github.com/princeton-vl/lietorch.git 
RUN pip install evo --upgrade --no-binary evo
RUN pip install gdown
# ARG USER=docker_centerpoint_gnn
# ARG UID=1001
# ARG GID=1001
# # default password
# ARG PW=user 

# RUN useradd -m ${USER} --uid=${UID} && echo "${USER}:${PW}" | chpasswd && adduser ${USER} sudo

# WORKDIR /home/${USER}
# RUN cd /home/${USER} && mkdir -p catkin_ws/src && chown -R ${UID}:${GID} ./

# USER ${UID}:${GID}
