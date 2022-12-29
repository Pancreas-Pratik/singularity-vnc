#!/usr/bin/env bash
### every exit != 0 fails the script
set -e
set -u

echo "Install noVNC - HTML5 based VNC viewer"
mkdir -p $NO_VNC_DEFAULT_HOME/utils/websockify
wget -qO- https://github.com/novnc/noVNC/archive/refs/tags/v1.3.0.tar.gz | tar xz --strip 1 -C $NO_VNC_DEFAULT_HOME
# use older version of websockify to prevent hanging connections on offline containers, see https://github.com/ConSol/docker-headless-vnc-container/issues/50
wget -qO- https://github.com/novnc/websockify/archive/refs/tags/v0.11.0.tar.gz | tar xz --strip 1 -C $NO_VNC_DEFAULT_HOME/utils/websockify
cd $NO_VNC_DEFAULT_HOME/utils/websockify
python3 setup.py install
cd
mv $NO_VNC_DEFAULT_HOME/utils/README.md $NO_VNC_DEFAULT_HOME/novnc_README.md
chmod +x -v $NO_VNC_DEFAULT_HOME/utils/*
## create index.html to forward automatically to `vnc_lite.html`
