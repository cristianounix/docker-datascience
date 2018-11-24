FROM ubuntu:16.04

# LABEL maintainer="Cristianounix <cristianounix@gmail.com>"
MAINTAINER Cristiano S. Oliveira <cristianounix@gmail.com>

ENV LANG=C.UTF-8

# Dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        curl \
        libfreetype6-dev \
        libhdf5-serial-dev \
        libpng12-dev \
        libzmq3-dev \
        pkg-config \
        python \
        python-dev \
        rsync \
        software-properties-common \
        unzip \
        && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN curl -O https://bootstrap.pypa.io/get-pip.py && \
    python get-pip.py && \
    rm get-pip.py

RUN pip --no-cache-dir install \
        Pillow \
        h5py \
        ipykernel \
        jupyter \
        jupyterlab \
        keras_applications \
        keras_preprocessing \
        matplotlib \
        numpy \
        pandas \
        scipy \
        sklearn \
        nltk \
        opencv-python \
        keras \
        ipywidgets \
        scikit-learn \
        && \
    python -m ipykernel.kernelspec

RUN pip install --upgrade tensorflow

# RUN ln -s -f /usr/bin/python3 /usr/bin/python#

# Set config
COPY jupyter_notebook_config.py /root/.jupyter/

# https://github.com/ipython/ipython/issues/7062
COPY run_jupyter.sh /

# TensorBoard
EXPOSE 6006

# IPython
EXPOSE 8888

WORKDIR "/notebooks"

CMD ["/run_jupyter.sh", "--allow-root"]

