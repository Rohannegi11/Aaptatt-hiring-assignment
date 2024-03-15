# Use an official Tomcat image as the base image
FROM tomcat:9.0-jdk8

# Copy the built WAR file into the Tomcat webapps directory
COPY target/*.war /usr/local/tomcat/webapps/

# Expose the port the application runs on
EXPOSE 8080



