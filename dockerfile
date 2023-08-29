# Build Stage

FROM maven:3.8.3-openjdk

COPY . .
RUN mvn clean package -DskipTests

#Packege Stage 

FROM openjdk:17-jdk-slim

COPY --from=build /target/ApiDevops-0.0.1-SNAPSHOT.jar app.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]