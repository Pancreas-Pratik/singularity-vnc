#!/usr/bin/env bash
set -e

echo "Install TigerVNC server"
wget https://github.com/Pancreas-Pratik/singularity-vnc/raw/master/src/ubuntu/install/tigervncserver_1.12.0-1ubuntu1_amd64.deb
apt install -y tigervncserver_1.12.0-1ubuntu1_amd64.deb
