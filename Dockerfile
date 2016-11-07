FROM ubuntu:latest
MAINTAINER Elliot Marx "elliot.marx@affirm.com"

RUN apt-get update && apt-get install -y \
  python \
  python-pip \
  wget \
  vim \
  mysql-client \
  git \

RUN mkdir /platform
RUN mkdir /platform/salt
RUN mkdir /platform/all-the-things
ADD ./reqs.txt /platform/reqs.txt
RUN pip install virtualenv
RUN pip install /platform/reqs.txt

WORKDIR /platform
VOLUME /platform/salt
VOLUME /platform/all-the-things

# install packages required for build-deps.py
#RUN pip install -U pip==1.5.6
#RUN pip install -U setuptools==3.6
#RUN	pip install snakefood networkx pyyaml

RUN virtualenv "${VENV}"
RUN . "${VENV}/bin/activate"
