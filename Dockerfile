FROM python:3.7.4

WORKDIR /work

RUN apt-get update -y && apt-get install -y mecab libmecab-dev mecab-ipadic mecab-ipadic-utf8 vim

RUN pip install --upgrade pip

RUN pip install matplotlib pandas numpy scipy jupyterlab tqdm gensim mecab-python3 sklearn torch torchvision gensim allennlp optuna allennlp-optuna allennlp-models

