export DEBIAN_FRONTEND="noninteractive"

useradd -m -N liferay
cd /home/liferay

# Install dependencies
# make sure the package repository is up to date
apt-get update && apt-get -y install \
    bsdtar \
    && apt-get clean

# Install liferay-portal-6.1.0-ce-ga1
curl -SL "http://downloads.sourceforge.net/project/lportal/Liferay%20Portal/6.1.0%20GA1/liferay-portal-tomcat-6.1.0-ce-ga1-20120106155615760.zip" \
    | bsdtar -xvf-

chmod +x liferay-portal-6.1.0-ce-ga1/tomcat-7.0.23/bin/*.sh
ln -sf tomcat-7.0.23 liferay-portal-6.1.0-ce-ga1/tomcat \
        && ln -sf /home/liferay/liferay-portal-6.1.0-ce-ga1/ /opt/liferay

# Add liferay init-script
cat > /etc/init.d/liferay <<EOF
# Liferay auto-start
# description: Auto-starts liferay
# processname: liferay
# pidfile: /var/run/liferay.pid
 
case "\$1" in
start)
        sh /opt/liferay/tomcat/bin/startup.sh
        ;;
stop)
        sh /opt/liferay/tomcat/bin/shutdown.sh
        ;;
restart)
        sh /opt/liferay/tomcat/bin/shutdown.sh
        sh /opt/liferay/tomcat/bin/startup.sh
        ;;
*)
        echo "Usage: /etc/init.d/liferay {start|stop|restart}"
        exit 1
        ;;
esac
exit 0
EOF

chmod 755 /etc/init.d/liferay && update-rc.d liferay defaults 

service liferay start && tail -f /opt/liferay/tomcat-7.0.23/logs/catalina.out
