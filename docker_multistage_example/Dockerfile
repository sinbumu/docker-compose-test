# Stage 1: Build the Spring Boot application
FROM gradle:jdk17 AS builder

WORKDIR /app
COPY . .

RUN ./gradlew clean build -x test

# Stage 2: Create a minimal JRE image
FROM amazoncorretto:17-alpine3.14

WORKDIR /app
COPY --from=builder /app/build/libs/cccv-server-v2-0.0.1-SNAPSHOT.jar .

# Expose port 8080
EXPOSE 8080

CMD ["java", "-jar", "cccv-server-v2-0.0.1-SNAPSHOT.jar"]
