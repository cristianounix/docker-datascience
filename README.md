# Data Science Image Docker

This image was created from base-notebook and minimal-notebook by Jupyter Project (docker-stacks) 

## Using

[notebooks]: full path, not relative path

$ docker run -it --rm -p 8888:8888 -v [notebooks]:/opt/app/data cristianounix/datascience

Ex:

$ docker run -it --rm -p 8888:8888 -v /home/cristianounix/notebooks:/opt/app/data cristianounix:datascience

## Libs


### Python

+ scikit-learn
+ numpy
+ pandas
+ scipy
+ plotly
+ matplotlib
+ nltk
+ ipywidgets
+ seaborn
+ spacy
+ cv2
