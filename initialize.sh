#!/bin/bash

git clone -b students --single-branch https://github.com/lucadomene/DFB_Lab01_DataCarving /opt/datacarving-lab
ln -s /opt/datacarving-lab/ext4.dd /dev/loop0 
rm -rf /content/sample_data
cp -r /opt/datacarving-lab/challenges /content
mkdir -p /content/retrieved_data

apt install dcfldd sleuthkit xxd binwalk scalpel 
