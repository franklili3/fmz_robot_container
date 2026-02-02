# Version 0.1
FROM aliyunfc/runtime-python3.6
MAINTAINER frank <348104201@qq.com>
RUN apt-get update; 
#apt-get install apt-utils ca-certificates -y; update-ca-certificates;
RUN apt-get install apt-utils gfortran libffi-dev make libopenblas-dev liblapack-dev libatlas-base-dev libblas-dev -y;
RUN adduser --disabled-password user1 
WORKDIR /home/user1
LABEL Description="This image is used for fmz robot docker container"
#RUN easy_install -i http://mirrors.aliyun.com/pypi/simple/ pip
COPY requirements.txt boot.sh ./
RUN pip  --no-cache-dir install --trusted-host mirrors.aliyun.com -i http://mirrors.aliyun.com/pypi/simple/ -r requirements.txt --user
RUN wget https://www.fmz.com/dist/robot_linux_amd64.tar.gz
RUN tar -xvzf robot_linux_amd64.tar.gz 
RUN chmod +x boot.sh robot
USER user1
ENTRYPOINT ["./boot.sh"]
