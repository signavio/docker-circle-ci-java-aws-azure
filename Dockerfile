FROM circleci/openjdk:11-jdk-stretch
RUN sudo apt-get update && sudo apt-get install gettext docker python-pip python-setuptools wget curl apt-transport-https

# Kubectl
RUN sudo curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && sudo chmod +x ./kubectl && sudo mv ./kubectl /usr/local/bin/kubectl

# AWS
RUN sudo pip install awscli

# Azure
