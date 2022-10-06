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

RUN useradd -m git  
#USER git
RUN mkdir /home/git/website.git \
&& mkdir /home/git/.ssh \
&& echo "some code starts here" > /home/git/website.git/code.sh \
&& cd /home/git/website.git \
&& git init --bare \
#&& git config --global user.name "A Kowal" \
#&& git config --global user.mail "akowa@centos1.tk" \
&& chown -R git:git /home/git \
#&& git add /home/git/website.git/*\
#&& git commit -m "works"\
&& service ssh start 

#&& git commit -m "first commit"
COPY ./id_rsa.pub /home/git/id_rsa.pub
RUN mv /home/git/id_rsa.pub /home/git/.ssh/authorized_keys 
EXPOSE 22
ENTRYPOINT ["/usr/sbin/sshd","-D"]



