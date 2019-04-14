FROM tensorflow/tensorflow:1.13.0rc0-gpu-py3 

LABEL maintainer="freimoser.c@gmail.com"

RUN apt-get update && apt-get install -y \
    software-properties-common \
    curl

RUN add-apt-repository ppa:git-core/ppa && \
    curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash

RUN apt-get update && apt-get install -y \
    git \
    software-properties-common \
    git-lfs \
    wget \
    virtualenv

RUN apt-get remove -y python-pip python3-pip

RUN wget https://bootstrap.pypa.io/get-pip.py && \
    python3 get-pip.py && \
    pip3 install --upgrade pip

RUN pip3 install pandas \
        progressbar2 \
        python-utils \
        tensorflow \
        numpy \
        matplotlib \
        scipy \
        sox \
        paramiko \
        python_speech_features \
        pyxdg \
        bs4 \
        six \
        requests \
        tables \
        attrdict \
        setuptools \
        librosa \
        soundfile

RUN virtualenv -p python3 /tmp/deepspeech-venv/ 

RUN echo 'source /tmp/deepspeech-venv/bin/activate' >> /etc/profile

RUN git clone https://github.com/mozilla/DeepSpeech

RUN pip3 install $(python3 /DeepSpeech/util/taskcluster.py --decoder)

RUN rm -f /usr/bin/python

RUN ln -s /usr/bin/python3 /usr/bin/python