# ubuntu openssh-server
# port 222
# user:root, password:12345678
# 
# VERSION 0.2

FROM debian:7.9
MAINTAINER liuaifu "laf163@qq.com"

#先更新并安装openssh-server（Docker Hub在国外自动构建更快），然后设为国内163源（国内使用时更快）
RUN apt-get update && \
    apt-get install -y openssh-server && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir /var/run/sshd && \
    sed --in-place=.bak 's/without-password/yes/' /etc/ssh/sshd_config && \
    echo 'root:12345678' | chpasswd
EXPOSE 222
CMD ["/usr/sbin/sshd", "-p", "222", "-D"]
