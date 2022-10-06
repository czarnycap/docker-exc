#syntax=docker/dockerfile:1
ARG CODE_VERSION=bullseye-20220912-slim
FROM debian:${CODE_VERSION}
#WORKDIR "/home/akowal/.ssh"
ENV HOME /home/git


RUN apt-get update && apt-get install -y --no-install-recommends \
 git\
 openssh-server \
 sudo \
 telnet  

RUN useradd git  
RUN mkdir /home/git 
RUN mkdir /home/git/.ssh
RUN chown -R git:git /home/git

RUN service ssh start 


#&& git commit -m "first commit"
COPY ./id_rsa.pub /home/git/id_rsa.pub
RUN mv /home/git/id_rsa.pub /home/git/.ssh/authorized_keys 
EXPOSE 22
ENTRYPOINT ["/usr/sbin/sshd","-D"]



