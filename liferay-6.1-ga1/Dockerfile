FROM mullnerz/jdk6-oracle

MAINTAINER Zoltán Müllner <mullner.zoltan@gmail.com>

# export DEBIAN_FRONTEND="noninteractive"
ENV DEBIAN_FRONTEND noninteractive

RUN useradd -m -N liferay
WORKDIR /home/liferay

# Install dependencies
# make sure the package repository is up to date
RUN apt-get update && apt-get -y install \
    bsdtar \
    && apt-get clean

# Install liferay-portal-6.1.0-ce-ga1
RUN curl -SL "http://downloads.sourceforge.net/project/lportal/Liferay%20Portal/6.1.0%20GA1/liferay-portal-tomcat-6.1.0-ce-ga1-20120106155615760.zip" \
        | bsdtar -xvf-

RUN chmod +x liferay-portal-6.1.0-ce-ga1/tomcat-7.0.23/bin/*.sh
RUN ln -sf tomcat-7.0.23 liferay-portal-6.1.0-ce-ga1/tomcat \
        && ln -sf /home/liferay/liferay-portal-6.1.0-ce-ga1/ /opt/liferay

# Add liferay init-script
COPY liferay /etc/init.d/
RUN chmod 755 /etc/init.d/liferay && update-rc.d liferay defaults 

EXPOSE 8080

CMD service liferay start && tail -f /opt/liferay/tomcat-7.0.23/logs/catalina.out
