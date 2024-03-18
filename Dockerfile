# Stage 1: Build the application
FROM openjdk:11-jdk-slim AS build
WORKDIR /app
COPY . .
RUN chmod +x ./mvnw
RUN ./mvnw package

# Stage 2: Create the final image
FROM openjdk:11-jre-slim
WORKDIR /app
COPY --from=build /app/target/app-0.0.1-SNAPSHOT.jar ./target/app-0.0.1-SNAPSHOT.jar
EXPOSE 9001
CMD ["java", "-jar", "./target/app-0.0.1-SNAPSHOT.jar"]
