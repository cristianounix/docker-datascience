FROM python:3.7.6-buster

# LABEL maintainer="Cristianounix <cristianounix@gmail.com>"
MAINTAINER Cristiano S. Oliveira <cristianounix@gmail.com>

ENV LANG=C.UTF-8

RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        curl \
        libfreetype6-dev \
        libhdf5-serial-dev \
        libsm6 \
        libxext6 \
        libxrender-dev \
        libzmq3-dev \
        pkg-config \
        rsync \
        software-properties-common \
        unzip \
        && \
        apt-get clean 
    
RUN curl https://bootstrap.pypa.io/get-pip.py | python
RUN pip install --upgrade setuptools

RUN pip --no-cache-dir install \
        bokeh \
        numexpr \
        patsy \
        scikit-image \
        ipython \
        sympy \
        Pillow \
        h5py \
        ipykernel \
        jupyter \
        jupyterlab \
        keras_applications \
        keras_preprocessing \
        matplotlib 

RUN pip --no-cache-dir install \
        pandas==1.0.1 \
        pytz \
        numpy \
        plotly==4.5.4 \
        python-dateutil==2.6.1 \
        scipy \
        sklearn \
        dash==1.8.0 \
        nltk \
        opencv-python \
        keras \
        ipywidgets \
        scikit-learn \
        ipywidgets \
        seaborn==0.9.0 \
        spacy \
        folium \
        "dask[complete]" \
        && \
    python -m ipykernel.kernelspec

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash
RUN apt-get install nodejs -y

RUN jupyter labextension install \
    jupyterlab-plotly \
    jupyterlab-drawio \
    @bokeh/jupyter_bokeh \
    jupyterlab-spreadsheet

RUN pip uninstall tensorflow-tensorboard
RUN pip uninstall tensorflow-gpu
RUN pip install --upgrade tensorflow

# jupyter nbextension configurator
RUN pip install jupyter_nbextensions_configurator
RUN pip install jupyter_contrib_nbextensions

RUN jupyter nbextensions_configurator enable
RUN jupyter nbextension enable --py --sys-prefix widgetsnbextension
RUN jupyter nbextension enable --py widgetsnbextension
RUN jupyter serverextension enable --py jupyterlab

RUN pip install --upgrade jupyterthemes


# Set config
COPY jupyter_notebook_config.py /root/.jupyter/

# https://github.com/ipython/ipython/issues/7062
COPY run_jupyter.sh /

RUN chmod +x /run_jupyter.sh

# TensorBoard
EXPOSE 6006

# IPython
EXPOSE 8888

WORKDIR "/notebooks"

CMD ["jupyter", "lab", "--no-browser","--allow-root","--NotebookApp.token=''","--NotebookApp.password=''"]


