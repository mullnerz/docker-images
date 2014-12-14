FROM ubuntu:trusty

MAINTAINER Zoltán Müllner <mullner.zoltan@gmail.com>

# export DEBIAN_FRONTEND="noninteractive"
ENV DEBIAN_FRONTEND noninteractive

# Install dependencies
# make sure the package repository is up to date
RUN apt-get update && apt-get -y install \
    sudo vim curl zip \
    python-software-properties software-properties-common \
	&& apt-get clean

# Install oracle-jdk6
RUN add-apt-repository -y ppa:webupd8team/java && apt-get update
# automatically accept oracle license
RUN echo oracle-java6-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN apt-get -y install oracle-java6-installer && apt-get clean
RUN echo "JAVA_HOME=/usr/lib/jvm/java-6-oracle" >> /etc/environment
