 FROM tomcat:9-jre11
 RUN rm -rf /usr/local/tomcat/webapps/*
 COPY ./target/sparkjava-hello-world-1.0.war /usr/local/tomcat/webapps/sparkjava-hello-world-1.0.war
 EXPOSE 8080
 CMD ["catalina.sh", "run"]
