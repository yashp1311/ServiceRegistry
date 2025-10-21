FROM eclipse-temurin:21-jdk-alpine AS builder
WORKDIR /app
COPY . .
RUN ./mvnw clean package -DskipTests

FROM eclipse-temurin:21-jre-alpine
WORKDIR /app
COPY --from=builder /app/target/ServiceRegistry-0.0.1-SNAPSHOT.jar ServiceRegistry.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "ServiceRegistry.jar"]