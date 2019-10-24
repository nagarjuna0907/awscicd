FROM ubuntu:16.04

MAINTAINER nagarjuna.madineedi@gmail.com
#WORKDIR /opt/tomcat/webapps
#RUN curl -O -L https://github.com/AKSarav/SampleWebApp/raw/master/dist/SampleWebApp.wa
#FROM tomcat:8.0
# Create app directory
#COPY dist/lib/leadapp.war /usr/local/tomcat/webapps
RUN apt-get update -y
RUN mkdir /opt/tomcat/
WORKDIR /opt/tomcat
RUN apt install openjdk-8-jdk -y
RUN java -version
RUN curl -O https://www-us.apache.org/dist/tomcat/tomcat-7/v7.0.96/bin/apache-tomcat-7.0.96.tar.gz
RUN tar xvfz apache*.tar.gz
RUN mv apache-tomcat-7.0.96/* /opt/tomcat/.
ADD dist/lib/leadapp.war /opt/tomcat/webapps
EXPOSE 8080
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
