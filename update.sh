#!/usr/bin/env bash

set -e
VERSION=1.8.2

wget -O droidcam_${VERSION}.zip https://files.dev47apps.net/linux/droidcam_${VERSION}.zip
unzip droidcam_${VERSION}.zip -d droidcam_${VERSION}


if [ -e /opt/droidcat-uninstall ]; then
  sudo /opt/droidcam-uninstall
fi

pushd droidcam_"${VERSION}"
sudo ./install-client
#sudo ./install-video
sudo ./install-dkms 640 480
# Standard sizes (Width x Height): 640×480, 960×720, 1280×720 (720p), 1920×1080 (1080p).
#sudo ./install-sound

