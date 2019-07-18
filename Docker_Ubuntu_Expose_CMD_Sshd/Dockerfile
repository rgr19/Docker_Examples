FROM ubuntu:16.04

MAINTAINER Robert Grzelka
ARG user=robgrzel
ARG host_pub_key

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
	openssh-server nano vim python valgrind \
	x11-xserver-utils xterm sudo less \
	cmake gcc build-essential gdbserver \
	tcpdump telnet byacc flex iproute2 \
	bison firefox curl iproute2 iputils-ping \
	net-tools tcpdump 

# add pub keys

ADD .ssh /root/.ssh

RUN echo "${host_pub_key}"

RUN chmod 0700 /root/.ssh && \
    chmod 600 /root/.ssh/id_rsa && \
    chmod 600 /root/.ssh/id_rsa.pub && \
    ssh-keyscan github.com > /root/.ssh/known_hosts && \
    echo "${host_pub_key}" > /root/.ssh/authorized_keys

RUN echo "    IdentityFile ~/.ssh/id_rsa" >> /etc/ssh/ssh_config
# set ssh server

RUN mkdir /var/run/sshd
RUN echo 'root:root' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# ssh fix to not be kicked off after login

RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "un users profile"
RUN echo "export VISIBLE=now" >> /etc/profile



EXPOSE 22 2250 2251 2252

RUN echo -e "auto eth0\niface eth0 inet dhcp" >> /etc/network/interfaces



CMD $(which sshd) -D
