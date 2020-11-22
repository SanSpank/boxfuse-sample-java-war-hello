FROM maven:3.6.1-jdk-8 as maven_builder
WORKDIR /app
COPY ./ .
ADD pom.xml .
RUN mvn clean package
RUN ls -1 /app/target/

FROM tomcat:8.5.43-jdk8
COPY --from=maven_builder /app/target/hello-1.0.war /usr/local/tomcat/webapps

EXPOSE 8080

CMD ["catalina.sh", "run"]