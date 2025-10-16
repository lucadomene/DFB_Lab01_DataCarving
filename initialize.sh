#!/bin/bash

git clone -b students --single-branch https://github.com/lucadomene/DFB_Lab01_DataCarving /opt/datacarving-lab
losetup -fP /opt/datacarving-lab/ext4.dd
rm -rf /content/sample_data
cp -r /opt/datacarving-lab/disk_images /content
mkdir -p /content/retrieved_data
