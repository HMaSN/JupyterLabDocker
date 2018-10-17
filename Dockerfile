# Author: Hayssam Noweir
# Description: Jupyter lab with iPython
FROM alpine

# Install packages
RUN apk update && \
apk add python3 python3-dev py3-zmq zeromq zeromq-dev gcc libc-dev

RUN mkdir /jupyter
WORKDIR /jupyter
RUN python3 -m venv .  && \
. bin/activate && \
pip3 install --upgrade pip && \
pip3 install jupyter jupyterlab


RUN adduser jupyter -h /data -D

USER jupyter
WORKDIR /data

RUN mkdir /data/.jupyter


EXPOSE 8090

CMD ["/jupyter/bin/jupyter", "lab", "--ip=0.0.0.0", "--port=8090"]

