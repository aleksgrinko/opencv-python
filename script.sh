#!/bin/bash
apt update
# apt upgrade -y
apt install -y \
        git
        python3-pip 
python3 -m pip install -U pip
git checkout 72
ls -la > /app/testfile
