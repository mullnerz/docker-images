#
# Ubuntu Dockerfile
#
# https://github.com/mullnerz/docker-images/
# https://github.com/mullnerz/docker-images/tree/master/ubuntu
#

FROM ubuntu:14.04

MAINTAINER Zoltán Müllner <mullner.zoltan@gmail.com>

# Install
RUN \
#	sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
	apt-get update && \
	apt-get -y upgrade && \
	DEBIAN_FRONTEND=noninteractive apt-get -y install \
#	build-essential \
	software-properties-common \
	bsdtar curl htop zip unzip vim wget && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*

# Set environment variables
ENV HOME /root

# Define working directory
WORKDIR /root

# Define default command
CMD ["bash"]