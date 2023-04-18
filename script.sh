#!/bin/bash
apt update
apt upgrade -y
apt install -y \
        build-essential \
        cmake \
        git \
        gfortran \
        python3.8-dev \
        python3-pip \
        libatlas-base-dev \
        libavcodec-dev \
        libavformat-dev \
        libavresample-dev \
        libdc1394-22-dev \
        libeigen3-dev \
        libglew-dev \
        libgstreamer-plugins-base1.0-dev \
        libgstreamer-plugins-good1.0-dev \
        libgstreamer1.0-dev \
        libjpeg-dev \
        libjpeg8-dev \
        libjpeg-turbo8-dev \
        liblapack-dev \
        liblapacke-dev \
        libopenblas-dev \
        libpng-dev \
        libpostproc-dev \
        libswscale-dev \
        libtbb-dev \
        libtbb2 \
        libtiff-dev \
        libv4l-dev \
        libxine2-dev \
        libxvidcore-dev \
        libx264-dev \
        pkg-config \
        qv4l2 \
        v4l-utils \
        zlib1g-dev
python3 -m pip install -U pip
git clone --recursive https://github.com/opencv/opencv-python.git
cd opencv-python
export CMAKE_BUILD_PARALLEL_LEVEL=$(nproc)
export CMAKE_ARGS="-D BUILD_opencv_world=OFF -DCPU_BASELINE=SSE4_2 -D CUDA_FAST_MATH=OFF -D OPENCV_DNN_CUDA=OFF -D WITH_CUBLAS=ON -D WITH_CUDA=OFF -D WITH_OPENVINO=OFF -D WITH_CUDNN=OFF -D EIGEN_INCLUDE_PATH=/usr/include/eigen3 -D WITH_OPENCL=ON -D WITH_OPENMP=OFF -D WITH_TBB=ON -D WITH_1394=OFF -D OPENCV_ENABLE_NONFREE=OFF -D OPENCV_GENERATE_PKGCONFIG=ON -D WITH_GSTREAMER=ON -D WITH_LIBV4L=ON -D WITH_OPENGL=OFF -D WITH_GTK=OFF -D INSTALL_CREATE_DISTRIB=ON -D BUILD_SHARED_LIBS=OFF"
export ENABLE_CONTRIB=1
export ENABLE_HEADLESS=1
pip wheel . --verbose --wheel-dir=/app/wheels 
ls -la wheels/ > /app/testfile
