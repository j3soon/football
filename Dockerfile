ARG DOCKER_BASE
FROM $DOCKER_BASE
ARG DEVICE

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -yq git cmake build-essential \
  libgl1-mesa-dev libsdl2-dev \
  libsdl2-image-dev libsdl2-ttf-dev libsdl2-gfx-dev libboost-all-dev \
  libdirectfb-dev libst-dev mesa-utils xvfb x11vnc \
  libsdl-sge-dev #python3-pip

RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
RUN python3 get-pip.py --force-reinstall
RUN python3 -m pip install --upgrade pip

COPY . /gfootball
RUN cd /gfootball && pip3 install -r requirements.txt . && pip3 install .
WORKDIR '/gfootball'
