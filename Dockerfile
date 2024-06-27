FROM gradle:jdk17-alpine AS builder
WORKDIR /app
COPY . .
RUN ./gradlew clean build test

FROM gradle:jdk17-alpine AS runner
WORKDIR /app
RUN ls -l
COPY --from=builder /app/build/libs/*.jar app.jar

CMD ["java", "-jar", "app.jar"]
