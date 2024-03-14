
FROM ubuntu
RUN apt update -y
RUN apt install openjdk-11-jdk -y
RUN  apt install git -y
COPY  apache-maven-3.9.6-bin.tar.gz /app
WORKDIR /app
RUN tar -xvzf apache-maven-3.9.6-bin.tar.gz
ENV MAVEN_HOME=/tmp/apache-maven-3.9.6/
ENV PATH=/tmp/apache-maven-3.9.6/bin/:$PATH
RUN mvn clean package
RUN git clone -b master https://github.com/Rohannegi11/Aaptatt-hiring-assignment.git
ENTRYPOINT ["java", "-jar", "app.jar"]




