# ubuntu openssh-server
# port 222
# user:root, password:12345678
# 
# VERSION 0.1

FROM ubuntu:14.04
MAINTAINER liuaifu "laf163@gmail.com"

RUN rm -f /etc/apt/sources.list

RUN apt-get update
RUN apt-get install -y openssh-server

#设置国内的源
RUN echo "deb http://mirrors.163.com/ubuntu/ trusty main restricted universe multiverse" >>/etc/apt/sources.list
RUN echo "deb http://mirrors.163.com/ubuntu/ trusty-security main restricted universe multiverse" >>/etc/apt/sources.list
RUN echo "deb http://mirrors.163.com/ubuntu/ trusty-updates main restricted universe multiverse" >>/etc/apt/sources.list
RUN echo "deb http://mirrors.163.com/ubuntu/ trusty-proposed main restricted universe multiverse" >>/etc/apt/sources.list
RUN echo "deb http://mirrors.163.com/ubuntu/ trusty-backports main restricted universe multiverse" >>/etc/apt/sources.list
RUN echo "deb-src http://mirrors.163.com/ubuntu/ trusty main restricted universe multiverse" >>/etc/apt/sources.list
RUN echo "deb-src http://mirrors.163.com/ubuntu/ trusty-security main restricted universe multiverse" >>/etc/apt/sources.list
RUN echo "deb-src http://mirrors.163.com/ubuntu/ trusty-updates main restricted universe multiverse" >>/etc/apt/sources.list
RUN echo "deb-src http://mirrors.163.com/ubuntu/ trusty-proposed main restricted universe multiverse" >>/etc/apt/sources.list
RUN echo "deb-src http://mirrors.163.com/ubuntu/ trusty-backports main restricted universe multiverse" >>/etc/apt/sources.list

RUN mkdir /var/run/sshd
RUN echo 'root:12345678' | chpasswd
EXPOSE 222
CMD ["/usr/sbin/sshd", "-p", "222", "-D"]
