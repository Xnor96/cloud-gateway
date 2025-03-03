# Fase de compilación
FROM eclipse-temurin:17-jdk AS build
WORKDIR /app
COPY . .
RUN ./mvnw clean package -DskipTests

# Imagen final de ejecución
FROM eclipse-temurin:17-jre
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar

# Exponer el puerto y ejecutar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
