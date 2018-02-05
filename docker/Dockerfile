FROM alpine:latest

COPY ./ /opt/

ENV DB_DATA_PATH /var/lib/mysql 
ENV MAX_ALLOWED_PACKET="200M"

RUN apk update \
 && mkdir -p /etc/mysql \
 && mv /opt/my.cnf /etc/mysql/my.cnf \
 && apk add openjdk8 bash mariadb mariadb-client --no-cache \
 && cd /opt \
 && unzip dr-elephant-2.0.13.zip \
 && rm /opt/dr-elephant-2.0.13.zip \
 && tar -xzf hadoop-2.6.5.tar.gz hadoop-2.6.5 \
 && rm hadoop-2.6.5.tar.gz \
 && alias ll="ls -la" \
 && mysql_install_db --user=mysql --datadir=${DB_DATA_PATH} \
 && chown -R mysql:mysql /var/lib/mysql \
 && chmod -R 755 /var/lib/mysql

ENV ELEPHANT_CONF_DIR /opt/dr-elephant-2.0.13/
ENV JAVA_HOME /usr/lib/jvm/default-jvm
ENV HADOOP_HOME /opt/hadoop-2.6.5
ENV PATH $PATH:$HADOOP_HOME/bin

EXPOSE 8080

WORKDIR /opt/dr-elephant-2.0.13
CMD /opt/init.sh
#CMD ["./bin/start.sh", "./app-conf"]
