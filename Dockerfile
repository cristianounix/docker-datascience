FROM jupyter/minimal-notebook

MAINTAINER Cristiano S. Oliveira <cristianounix@gmail.com>

ENV LANG=C.UTF-8

RUN pip install jupyterlab && \
    pip install -U scikit-learn && \ 
    pip install -U numpy pandas scipy && \
    pip install -U matplotlib nltk ipywidgets && \
    pip install -U seaborn==0.9.0 && \
    pip install -U Spacy && \
    jupyter nbextension enable --py widgetsnbextension && \ 
    jupyter serverextension enable --py jupyterlab --sys-prefix

RUN pip install -U opencv-python
RUN pip install -U tensorflown
RUN pip install -U plotly

RUN python -m spacy download pt && \
    python -m spacy download en

USER $NB_UID

# R packages
RUN conda install --quiet --yes \
    'r-base=3.4.1' \
    'r-irkernel=0.8*' \
    'r-plyr=1.8*' \
    'r-devtools=1.13*' \
    'r-tidyverse=1.1*' \
    'r-shiny=1.0*' \
    'r-rmarkdown=1.8*' \
    'r-forecast=8.2*' \
    'r-rsqlite=2.0*' \
    'r-reshape2=1.4*' \
    'r-nycflights13=0.2*' \
    'r-caret=6.0*' \
    'r-rcurl=1.95*' \
    'r-crayon=1.3*' \
    'r-randomforest=4.6*' \
    'r-htmltools=0.3*' \
    'r-sparklyr=0.7*' \
    'r-htmlwidgets=1.0*' \
    'r-hexbin=1.27*' && \
    conda clean -tipsy && \
    fix-permissions $CONDA_DIR

EXPOSE 8888

WORKDIR /opt/app/data

CMD ["jupyter", "lab"]
