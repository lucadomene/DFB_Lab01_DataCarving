#!/bin/bash

if test $# -ne 2
then
	echo "Usage: $0 image-name image-size" >&2
	exit 1
fi

IMAGE=${1}.dd

echo $1 $2

dcfldd if=/dev/zero of="$PWD/${IMAGE}" bs=1M count=$2

fdisk "$IMAGE" <<EOF
n
p
1


w
EOF

LOOP=$(sudo losetup --show -fP $IMAGE)
LOOPP="${LOOP}p1"

sudo mkfs.ext4 -O ^metadata_csum,^metadata_csum_seed,^orphan_file $LOOPP

MOUNT="${PWD}/${IMAGE}-mount"
mkdir $MOUNT

sudo mount $LOOPP $MOUNT
sudo chown -R $USER $MOUNT

cp -r -t $MOUNT dummy_files/*

sudo umount $MOUNT
sudo losetup -d $LOOP

rm -r $MOUNT
