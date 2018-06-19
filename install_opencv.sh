#!/usr/bin/env bash

# THIS SHELL SCRIPT INSTALLS OPENCV GLOBALLY.
# KINDLY TAKE THIS INTO ACCOUNT BEFORE PROCEEDING. 

# Change this for different versions of OpenCV
OPENCV_VERSION='3.4.0'

# 1. KEEP UBUNTU OR DEBIAN UP TO DATE
sudo apt-get -y update
sudo apt-get -y upgrade

# 2. INSTALL THE DEPENDENCIES

# Dev tools:
sudo apt-get install -y build-essential cmake pkg-config

# Image I/O:
sudo apt-get install -y libjpeg8-dev libtiff5-dev libjasper-dev libpng12-dev

# Video I/O:
sudo apt-get install -y libavcodec-dev libavformat-dev libswscale-dev libv4l-dev
sudo apt-get install -y libxvidcore-dev libx264-dev

# Dependency for HIGHGUI
sudo apt-get install -y libgtk-3-dev

# OpenCV algo Optimizers:
sudo apt-get install -y libatlas-base-dev gfortran

# Python:
sudo apt-get install -y python2.7-dev python3.5-dev

# 3. INSTALL THE LIBRARY

cd ~
wget -O opencv.zip https://github.com/Itseez/opencv/archive/${OPENCV_VERSION}.zip
unzip opencv.zip
wget -O opencv_contrib.zip https://github.com/Itseez/opencv_contrib/archive/${OPENCV_VERSION}.zip
unzip opencv_contrib.zip

cd ~/opencv-${OPENCV_VERSION}/
mkdir build
cd build

cmake -D CMAKE_BUILD_TYPE=RELEASE \
    -D CMAKE_INSTALL_PREFIX=/usr/local \
    -D INSTALL_PYTHON_EXAMPLES=ON \
    -D INSTALL_C_EXAMPLES=OFF \
    -D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib-${OPENCV_VERSION}/modules \
    -D BUILD_EXAMPLES=ON \
    -D WITH_FFMPEG=ON \
    -D WITH_CUDA=OFF ..

make -j4
sudo make install
sudo ldconfig

cd ~
