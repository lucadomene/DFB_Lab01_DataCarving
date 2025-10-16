FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    sleuthkit \
    xxd \
    scalpel \
    binwalk \
    git \
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install jupyter

RUN git clone https://github.com/lucadomene/DFB_Lab01_DataCarving /home/datacarving-lab

WORKDIR /home/datacarving-lab

RUN mkdir -p /home/datacarving-lab/data

EXPOSE 8888

CMD jupyter notebook --ip=0.0.0.0  --port=12345 --no-browser --allow-root --notebook-dir=/home/datacarving-lab & /bin/bash
