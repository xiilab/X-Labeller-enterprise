FROM tomcat:8.5-jre8-openjdk

RUN apt-get update -y
RUN apt-get install -y sshpass vim tree openssh-server


RUN mkdir /usr/local/uploadFile

ADD server.xml /usr/local/tomcat/conf/
RUN chmod 755 /usr/local/tomcat/conf/server.xml

ADD uploadFile.xml /usr/local/tomcat/conf/Catalina/localhost/
RUN chmod -R 777 /usr/local/tomcat/conf/Catalina/localhost/
RUN chmod 755 /usr/local/tomcat/conf/Catalina/localhost/uploadFile.xml

RUN chmod -R 777 /usr/local/uploadFile
ADD setenv.sh /usr/local/tomcat/bin
RUN chmod 755 /usr/local/tomcat/bin/setenv.sh
RUN mkdir -p /usr/local/uploadFile/xlabeller/workspace

ADD Seoul /usr/local/tomcat/
RUN cp --remove-destination /usr/local/tomcat/Seoul /etc/localtime

ADD target/xlabeller.war /usr/local/tomcat/webapps/