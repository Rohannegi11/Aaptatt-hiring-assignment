# Use Tomcat with Java 11 as the base image
FROM tomcat:9-jdk11 AS runtime

# Copy the WAR file to Tomcat's webapps directory
COPY target/sparkjava-hello-world-1.0.war /usr/local/tomcat/webapps/

# Expose the port the application runs on
EXPOSE 8080
