# syntax=docker/dockerfile:1
FROM maven:3.9-eclipse-temurin-21-alpine AS build
WORKDIR /src
COPY pom.xml .
RUN --mount=type=cache,target=/root/.m2 mvn -q -B dependency:go-offline
COPY src ./src
RUN --mount=type=cache,target=/root/.m2 mvn -q -B -DskipTests package

FROM tomcat:11.0.26-jre21-temurin
COPY --from=build /src/target/ROOT.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
