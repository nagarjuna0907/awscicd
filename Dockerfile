FROM tomcat:8.0
# Create app directory
COPY dist/lib/leadapp.war /usr/local/tomcat/webapps
