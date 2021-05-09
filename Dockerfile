# pythonの3.9.2をベースにする
FROM jupyter/minimal-notebook:python-3.9.2

#タイムゾーンを設定
ENV TZ=Asia/Tokyo


USER root

RUN sudo apt-get update
RUN sudo apt-get upgrade -y
# imageのサイズを小さくするためにキャッシュ削除
RUN apt-get clean
# && rm -rf /var/lib/apt/lists/* \
# pipのアップデート
RUN pip install --upgrade pip
# vimもいれておく
RUN apt-get install -y vim


WORKDIR /app
ADD requirements.txt /app/
RUN pip install -r requirements.txt

