export DEBIAN_FRONTEND="noninteractive"

# Install dependencies
# make sure the package repository is up to date
apt-get update && apt-get -y install \
    sudo vim curl zip \
    python-software-properties software-properties-common \
	&& apt-get clean

# Install oracle-jdk6
add-apt-repository -y ppa:webupd8team/java && apt-get update
# automatically accept oracle license
echo oracle-java6-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
apt-get -y install oracle-java6-installer && apt-get clean
echo "JAVA_HOME=/usr/lib/jvm/java-6-oracle" >> /etc/environment

java -version
