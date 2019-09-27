FROM circleci/openjdk:11
RUN sudo apt-get update && sudo apt-get install gettext docker python-pip python-setuptools wget curl apt-transport-https java-common

# Amazon Corretto JDK
RUN sudo wget https://d3pxv6yz143wms.cloudfront.net/11.0.4.11.1/java-11-amazon-corretto-jdk_11.0.4.11-1_amd64.deb
RUN sudo dpkg --install java-11-amazon-corretto-jdk_11.0.4.11-1_amd64.deb
RUN sudo update-alternatives --set java /usr/lib/jvm/java-11-amazon-corretto/bin/java
RUN sudo update-alternatives --set javac /usr/lib/jvm/java-11-amazon-corretto/bin/javac

# Kubectl
RUN sudo curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
RUN sudo chmod +x ./kubectl
RUN sudo mv ./kubectl /usr/local/bin/kubectl

# AWS
RUN sudo pip install awscli
