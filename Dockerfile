# ubuntu openssh-server
# port 222
# user:root, password:12345678
# 
# VERSION 0.2

FROM ubuntu:14.04.3
MAINTAINER liuaifu "laf163@qq.com"

#先更新并安装openssh-server（Docker Hub在国外自动构建更快），然后设为国内163源（国内使用时更快）
RUN apt-get update && \
    apt-get install -y openssh-server && \
    echo "deb http://mirrors.163.com/ubuntu/ trusty main restricted universe multiverse" >/etc/apt/sources.list && \
    echo "deb http://mirrors.163.com/ubuntu/ trusty-security main restricted universe multiverse" >>/etc/apt/sources.list && \
    echo "deb http://mirrors.163.com/ubuntu/ trusty-updates main restricted universe multiverse" >>/etc/apt/sources.list && \
    echo "deb http://mirrors.163.com/ubuntu/ trusty-proposed main restricted universe multiverse" >>/etc/apt/sources.list && \
    echo "deb http://mirrors.163.com/ubuntu/ trusty-backports main restricted universe multiverse" >>/etc/apt/sources.list && \
    echo "deb-src http://mirrors.163.com/ubuntu/ trusty main restricted universe multiverse" >>/etc/apt/sources.list && \
    echo "deb-src http://mirrors.163.com/ubuntu/ trusty-security main restricted universe multiverse" >>/etc/apt/sources.list && \
    echo "deb-src http://mirrors.163.com/ubuntu/ trusty-updates main restricted universe multiverse" >>/etc/apt/sources.list && \
    echo "deb-src http://mirrors.163.com/ubuntu/ trusty-proposed main restricted universe multiverse" >>/etc/apt/sources.list && \
    echo "deb-src http://mirrors.163.com/ubuntu/ trusty-backports main restricted universe multiverse" >>/etc/apt/sources.list && \
    apt-get clean && \
    mkdir /var/run/sshd && \
    sed --in-place=.bak 's/without-password/yes/' /etc/ssh/sshd_config && \
    echo 'root:12345678' | chpasswd
EXPOSE 222
CMD ["/usr/sbin/sshd", "-p", "222", "-D"]
