
FROM ubuntu:latest
RUN apt-get update && \
    apt-get install -y openjdk-8-jdk maven git && \
    apt-get clean
COPY . .
WORKDIR /app
RUN mvn clean package
ENTRYPOINT ["java", "-jar", "app.jar"]
