FROM gradle:jdk17-alpine
WORKDIR /app
COPY . .
RUN ./gradlew clean build test

FROM gradle:jdk17-alpine
WORKDIR /app
COPY --from=builder /app/target/*.jar app.jar

CMD ["java", "-jar", "app.jar"]
