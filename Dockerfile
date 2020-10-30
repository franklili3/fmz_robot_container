# Version 0.1
FROM python:3.6-alpine
MAINTAINER frank <348104201@qq.com>
RUN apk update; apk add ca-certificates; update-ca-certificates; apk --no-cache add openssl wget; adduser -D user1 
USER user1
WORKDIR /home/user1
LABEL Description="This image is used for fmz robot docker container"
#RUN easy_install -i http://mirrors.aliyun.com/pypi/simple/ pip
COPY requirements.txt requirements.txt
RUN python -m venv venv 
RUN venv/bin/pip --no-cache-dir install --trusted-host mirrors.aliyun.com -i http://mirrors.aliyun.com/pypi/simple/ -r requirements.txt
RUN wget https://www.fmz.com/dist/robot_linux_amd64.tar.gz
RUN tar -xzvf robot_linux_amd64.tar.gz
CMD nohup ./robot -s node.fmz.com/$id -p $password &
