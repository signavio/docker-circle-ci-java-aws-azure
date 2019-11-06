FROM 695480609797.dkr.ecr.eu-central-1.amazonaws.com/signavio-amazoncorretto:11.0.4

RUN yum -y update
RUN yum -y install git tar gzip ca-certificates wget curl gettext

# Docker
ENV DOCKER_VERSION=19.03.2
RUN yum -y install iptables procps xz jq
RUN wget https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VERSION}.tgz
RUN tar xzvf docker-${DOCKER_VERSION}.tgz && rm docker-${DOCKER_VERSION}.tgz
RUN mv docker/* /usr/bin/ && rm -rf docker/
RUN dockerd &

# AWS CLI
RUN yum -y install python-pip
RUN pip install awscli

# kubectl
RUN wget https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/local/bin/kubectl
