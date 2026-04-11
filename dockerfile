FROM eclipse-temurin:21-jdk AS builder
WORKDIR /app
COPY . .
RUN ./mvnw clean package -DskipTests

FROM eclipse-temurin:21-jdk
WORKDIR /app
COPY --from=builder /app/target/ServiceRegistry-0.0.1-SNAPSHOT.jar ServiceRegistry.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "ServiceRegistry.jar"]