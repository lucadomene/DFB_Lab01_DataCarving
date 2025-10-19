#!/bin/bash

git clone -b students --single-branch https://github.com/lucadomene/DFB_Lab01_DataCarving /opt/datacarving-lab
ln -s /opt/datacarving-lab/ext4.dd /dev/loop0 
rm -rf /content/sample_data
cp -r /opt/datacarving-lab/challenges /content
mkdir -p /content/retrieved_data

apt install dcfldd sleuthkit xxd scalpel
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
export PATH=/root/.cargo/bin:$PATH
source "/root/.cargo/env"
cargo install binwalk
ln -s /root/.cargo/bin/binwalk /usr/local/bin/binwalk
