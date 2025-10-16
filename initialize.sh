#!/bin/bash

git clone -b students --single-branch https://github.com/lucadomene/DFB_Lab01_DataCarving /opt/datacarving-lab
ln -s /dev/loop0 /opt/datacarving-lab/ext4.dd
rm -rf /content/sample_data
cp -r /opt/datacarving-lab/disk_images /content
mkdir -p /content/retrieved_data

apt install dcfldd sleuthkit xxd binwalk scalpel 
