# Use Ubuntu as the base image
FROM ubuntu:latest

# Install OpenJDK 8
RUN apt-get update && \
    apt-get install -y openjdk-11-jdk && \
    apt-get clean;

# Install Maven
RUN apt-get update && \
    apt-get install -y maven && \
    apt-get clean;

# Copy the Maven project files
COPY . /app

# Set the working directory
WORKDIR /app

# Build the Maven project
RUN mvn package

# Expose the port the application runs on
EXPOSE 8080

# Command to run the application
CMD ["java", "-jar", "target/sparkjava-hello-world-1.0.war"]
