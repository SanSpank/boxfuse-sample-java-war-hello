FROM maven:3.5.2-jdk-9 AS build
COPY src /src/app/src
COPY pom.xml /usr/src/app
RUN mvn -f /usr/src/app/pom.xml clean package